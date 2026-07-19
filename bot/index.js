require('dotenv').config()
const { Client, GatewayIntentBits, EmbedBuilder } = require('discord.js')
const { createClient } = require('@supabase/supabase-js')
const crypto = require('crypto')

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_KEY)
const OWNER_IDS = process.env.OWNER_IDS.split(',')
const PREFIX = '.'

const client = new Client({
  intents: [
    GatewayIntentBits.Guilds,
    GatewayIntentBits.GuildMessages,
    GatewayIntentBits.MessageContent
  ]
})

function generateKey() {
  return 'BAPE-' + crypto.randomBytes(16).toString('hex').toUpperCase()
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
      const { data: user } = await supabase
        .from('users')
        .select('key, hwid, revoked, granted_at')
        .eq('discord_id', message.author.id)
        .single()

      if (!user) {
        return message.reply('You do not have a key. Contact an owner.')
      }

      const embed = new EmbedBuilder()
        .setTitle('Your Bape Key')
        .setColor(user.revoked ? 0xff4444 : 0x5865f2)
        .addFields(
          { name: 'Key', value: `\`${user.key}\``, inline: false },
          { name: 'Status', value: user.revoked ? 'Revoked' : 'Active', inline: true },
          { name: 'HWID', value: user.hwid ? user.hwid.slice(0, 8) + '...' : 'Not set', inline: true },
          { name: 'Granted', value: new Date(user.granted_at).toLocaleDateString(), inline: true }
        )

      try {
        await message.author.send({ embeds: [embed] })
        await message.reply('Check your DMs.')
      } catch {
        await message.reply('Could not DM you. Enable DMs from server members.')
      }
      return
    }

    if (command === 'resethwid') {
      const { data: user } = await supabase
        .from('users')
        .select('id')
        .eq('discord_id', message.author.id)
        .single()

      if (!user) {
        return message.reply('You do not have a key.')
      }

      await supabase.from('users').update({ hwid: null }).eq('id', user.id)
      return message.reply('HWID has been reset.')
    }

    return
  }

  if (command === 'grant') {
    const target = message.mentions.users.first() || (args[0] && { id: args[0] })
    if (!target) {
      return message.reply('Usage: `.grant @user` or `.grant <discord_id>`')
    }

    const { data: existing } = await supabase
      .from('users')
      .select('id, revoked')
      .eq('discord_id', target.id)
      .single()

    if (existing && !existing.revoked) {
      return message.reply('User already has an active key.')
    }

    if (existing && existing.revoked) {
      await supabase.from('users').update({ revoked: false }).eq('id', existing.id)
      return message.reply(`Re-granted access to <@${target.id}>`)
    }

    const key = generateKey()
    await supabase.from('users').insert({
      key,
      discord_id: target.id,
      hwid: null,
      revoked: false,
      granted_at: new Date().toISOString()
    })

    const embed = new EmbedBuilder()
      .setTitle('Access Granted')
      .setColor(0x44ff44)
      .addFields(
        { name: 'User', value: `<@${target.id}>`, inline: true },
        { name: 'Key', value: `\`${key}\``, inline: false }
      )

    await message.reply({ embeds: [embed] })
  }

  else if (command === 'revoke') {
    const target = message.mentions.users.first() || (args[0] && { id: args[0] })
    if (!target) {
      return message.reply('Usage: `.revoke @user` or `.revoke <discord_id>`')
    }

    const { data: user } = await supabase
      .from('users')
      .select('id')
      .eq('discord_id', target.id)
      .single()

    if (!user) {
      return message.reply('User not found.')
    }

    await supabase.from('users').update({ revoked: true, hwid: null }).eq('id', user.id)
    await message.reply(`Revoked access for <@${target.id}>`)
  }

  else if (command === 'resethwid') {
    const target = message.mentions.users.first() || (args[0] && { id: args[0] })
    if (!target) {
      return message.reply('Usage: `.resethwid @user` or `.resethwid <discord_id>`')
    }

    const { data: user } = await supabase
      .from('users')
      .select('id')
      .eq('discord_id', target.id)
      .single()

    if (!user) {
      return message.reply('User not found.')
    }

    await supabase.from('users').update({ hwid: null }).eq('id', user.id)
    await message.reply(`HWID reset for <@${target.id}>`)
  }

  else if (command === 'genkey') {
    const count = parseInt(args[0]) || 1
    const keys = []

    for (let i = 0; i < Math.min(count, 10); i++) {
      const key = generateKey()
      keys.push(key)
      await supabase.from('users').insert({
        key,
        discord_id: 'unclaimed',
        hwid: null,
        revoked: false,
        granted_at: new Date().toISOString()
      })
    }

    const embed = new EmbedBuilder()
      .setTitle(`Generated ${keys.length} Key(s)`)
      .setColor(0x5865f2)
      .setDescription(keys.map(k => `\`${k}\``).join('\n'))

    try {
      await message.author.send({ embeds: [embed] })
      await message.reply(`Generated ${keys.length} key(s). Check your DMs.`)
    } catch {
      await message.reply({ embeds: [embed] })
    }
  }

  else if (command === 'users') {
    const { data: users, count } = await supabase
      .from('users')
      .select('discord_id, revoked, hwid', { count: 'exact' })
      .neq('discord_id', 'unclaimed')

    const active = users?.filter(u => !u.revoked).length || 0
    const revoked = users?.filter(u => u.revoked).length || 0

    const embed = new EmbedBuilder()
      .setTitle('Bape Users')
      .setColor(0x5865f2)
      .addFields(
        { name: 'Total', value: `${count || 0}`, inline: true },
        { name: 'Active', value: `${active}`, inline: true },
        { name: 'Revoked', value: `${revoked}`, inline: true }
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
