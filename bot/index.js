require('dotenv').config()
const { Client, GatewayIntentBits, EmbedBuilder } = require('discord.js')

const API_URL = process.env.API_URL || 'https://bape.lol'
const ADMIN_SECRET = process.env.ADMIN_SECRET
const OWNER_IDS = process.env.OWNER_IDS.split(',')
const PREFIX = '.'

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent
  ]
})

async function adminRequest(body) {
  const res = await fetch(`${API_URL}/api/admin`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-admin-key': ADMIN_SECRET
    },
    body: JSON.stringify(body)
  })
  return res.json()
}

function isOwner(userId) {
  return OWNER_IDS.includes(userId)
}

client.on('ready', () => {
  console.log(`Logged in as ${client.user.tag}`)
})

client.on('messageCreate', async (message) => {
  if (message.author.bot || !message.content.startsWith(PREFIX)) return

  const args = message.content.slice(PREFIX.length).trim().split(/ +/)
  const command = args.shift().toLowerCase()

  if (!isOwner(message.author.id)) {
    if (command === 'key') {
      try {
        const res = await fetch(`${API_URL}/api/auth`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ discord_id: message.author.id })
        })
        const data = await res.json()
        if (!data.success) {
          return message.reply('You do not have a key. Contact an owner.')
        }

        const embed = new EmbedBuilder()
          .setTitle('Your Bape Key')
          .setColor(data.user.revoked ? 0xff4444 : 0x5865f2)
          .addFields(
            { name: 'Status', value: data.user.revoked ? 'Revoked' : 'Active', inline: true },
            { name: 'HWID', value: data.user.hwid || 'Not set', inline: true },
            { name: 'Granted', value: new Date(data.user.granted_at).toLocaleDateString(), inline: true }
          )
          .setFooter({ text: 'Visit bape.lol to get your script' })

        try {
          await message.author.send({ embeds: [embed] })
          await message.reply('Check your DMs.')
        } catch {
          await message.reply('Could not DM you. Enable DMs from server members.')
        }
      } catch {
        await message.reply('Error fetching your key.')
      }
      return
    }

    if (command === 'resethwid') {
      const data = await adminRequest({ action: 'resethwid', discord_id: message.author.id })
      if (data.success) {
        return message.reply('HWID has been reset.')
      }
      return message.reply('Failed to reset HWID.')
    }

    return
  }

  if (command === 'grant') {
    const target = message.mentions.users.first() || (args[0] && { id: args[0] })
    if (!target) {
      return message.reply('Usage: `.grant @user` or `.grant <discord_id>`')
    }

    const data = await adminRequest({ action: 'grant', discord_id: target.id })

    if (data.error && data.key) {
      return message.reply(`User already has an active key: \`${data.key}\``)
    }

    const embed = new EmbedBuilder()
      .setTitle('Access Granted')
      .setColor(0x44ff44)
      .addFields(
        { name: 'User', value: `<@${target.id}>`, inline: true },
        { name: 'Key', value: `\`${data.key}\``, inline: false },
        { name: 'Action', value: data.action === 'regranted' ? 'Re-granted (was revoked)' : 'New key created', inline: true }
      )

    await message.reply({ embeds: [embed] })
  }

  else if (command === 'revoke') {
    const target = message.mentions.users.first() || (args[0] && { id: args[0] })
    if (!target) {
      return message.reply('Usage: `.revoke @user` or `.revoke <discord_id>`')
    }

    const data = await adminRequest({ action: 'revoke', discord_id: target.id })
    if (data.success) {
      await message.reply(`Revoked access for <@${target.id}>`)
    } else {
      await message.reply(`Failed: ${data.error}`)
    }
  }

  else if (command === 'resethwid') {
    const target = message.mentions.users.first() || (args[0] && { id: args[0] })
    if (!target) {
      return message.reply('Usage: `.resethwid @user` or `.resethwid <discord_id>`')
    }

    const data = await adminRequest({ action: 'resethwid', discord_id: target.id })
    if (data.success) {
      await message.reply(`HWID reset for <@${target.id}>`)
    } else {
      await message.reply(`Failed: ${data.error}`)
    }
  }

  else if (command === 'genkey') {
    const count = parseInt(args[0]) || 1
    const data = await adminRequest({ action: 'genkey', count })

    const embed = new EmbedBuilder()
      .setTitle(`Generated ${data.keys.length} Key(s)`)
      .setColor(0x5865f2)
      .setDescription(data.keys.map(k => `\`${k}\``).join('\n'))

    try {
      await message.author.send({ embeds: [embed] })
      await message.reply(`Generated ${data.keys.length} key(s). Check your DMs.`)
    } catch {
      await message.reply({ embeds: [embed] })
    }
  }

  else if (command === 'users') {
    const data = await adminRequest({ action: 'users' })

    const embed = new EmbedBuilder()
      .setTitle('Bape Users')
      .setColor(0x5865f2)
      .addFields(
        { name: 'Total', value: `${data.total}`, inline: true },
        { name: 'Active', value: `${data.active}`, inline: true },
        { name: 'Revoked', value: `${data.revoked}`, inline: true }
      )

    await message.reply({ embeds: [embed] })
  }

  else if (command === 'help') {
    const embed = new EmbedBuilder()
      .setTitle('Bape Bot Commands')
      .setColor(0x5865f2)
      .addFields(
        { name: 'Owner Commands', value: '`.grant @user` - Grant access\n`.revoke @user` - Revoke access\n`.resethwid @user` - Reset HWID\n`.genkey [count]` - Generate keys\n`.users` - View user stats' },
        { name: 'User Commands', value: '`.key` - View your key (DM)\n`.resethwid` - Reset your own HWID' }
      )

    await message.reply({ embeds: [embed] })
  }
})

client.login(process.env.DISCORD_TOKEN)
