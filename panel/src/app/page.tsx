'use client'
import { useState } from 'react'

export default function Home() {
  const [key, setKey] = useState('')
  const [user, setUser] = useState<any>(null)
  const [error, setError] = useState('')
  const [message, setMessage] = useState('')
  const [script, setScript] = useState('')

  async function login() {
    setError('')
    setMessage('')
    const res = await fetch('/api/auth', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ key })
    })
    const data = await res.json()
    if (data.success) {
      setUser(data.user)
    } else {
      setError(data.error)
    }
  }

  async function resetHwid() {
    const res = await fetch('/api/hwid', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ key })
    })
    const data = await res.json()
    if (data.success) {
      setMessage('HWID reset successfully')
      setUser({ ...user, hwid: 'Not set' })
    } else {
      setError(data.error)
    }
  }

  function getScript() {
    setScript(`loadstring(game:HttpGet("https://bape.lol/api/script?key=${key}"))()`)
  }

  if (user) {
    return (
      <div style={styles.container}>
        <div style={styles.card}>
          <h1 style={styles.title}>Bape</h1>
          <div style={styles.info}>
            <p><strong>Discord:</strong> {user.discord_id}</p>
            <p><strong>HWID:</strong> {user.hwid}</p>
            <p><strong>Granted:</strong> {new Date(user.granted_at).toLocaleDateString()}</p>
            <p><strong>Status:</strong> <span style={{ color: user.revoked ? '#ff4444' : '#44ff44' }}>{user.revoked ? 'Revoked' : 'Active'}</span></p>
          </div>
          {message && <p style={styles.success}>{message}</p>}
          {error && <p style={styles.error}>{error}</p>}
          <button onClick={resetHwid} style={styles.button}>Reset HWID</button>
          <button onClick={getScript} style={styles.button}>Get Script</button>
          {script && (
            <div style={styles.scriptBox}>
              <code>{script}</code>
              <button onClick={() => { navigator.clipboard.writeText(script); setMessage('Copied!') }} style={styles.copyBtn}>Copy</button>
            </div>
          )}
          <button onClick={() => { setUser(null); setScript('') }} style={styles.logoutBtn}>Logout</button>
        </div>
      </div>
    )
  }

  return (
    <div style={styles.container}>
      <div style={styles.card}>
        <h1 style={styles.title}>Bape</h1>
        <p style={styles.subtitle}>Enter your key to access the panel</p>
        {error && <p style={styles.error}>{error}</p>}
        <input
          type="text"
          placeholder="Enter your key"
          value={key}
          onChange={(e) => setKey(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && login()}
          style={styles.input}
        />
        <button onClick={login} style={styles.button}>Login</button>
      </div>
    </div>
  )
}

const styles: Record<string, React.CSSProperties> = {
  container: {
    minHeight: '100vh',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    background: '#0a0a0a',
    fontFamily: 'system-ui, -apple-system, sans-serif',
  },
  card: {
    background: '#141414',
    border: '1px solid #222',
    borderRadius: '12px',
    padding: '40px',
    width: '100%',
    maxWidth: '420px',
    textAlign: 'center' as const,
  },
  title: {
    color: '#fff',
    fontSize: '28px',
    marginBottom: '8px',
    fontWeight: 700,
  },
  subtitle: {
    color: '#888',
    marginBottom: '24px',
  },
  input: {
    width: '100%',
    padding: '12px 16px',
    borderRadius: '8px',
    border: '1px solid #333',
    background: '#0a0a0a',
    color: '#fff',
    fontSize: '14px',
    marginBottom: '16px',
    outline: 'none',
    boxSizing: 'border-box' as const,
  },
  button: {
    width: '100%',
    padding: '12px',
    borderRadius: '8px',
    border: 'none',
    background: '#5865f2',
    color: '#fff',
    fontSize: '14px',
    fontWeight: 600,
    cursor: 'pointer',
    marginBottom: '8px',
  },
  logoutBtn: {
    width: '100%',
    padding: '12px',
    borderRadius: '8px',
    border: '1px solid #333',
    background: 'transparent',
    color: '#888',
    fontSize: '14px',
    cursor: 'pointer',
    marginTop: '8px',
  },
  error: {
    color: '#ff4444',
    fontSize: '13px',
    marginBottom: '12px',
  },
  success: {
    color: '#44ff44',
    fontSize: '13px',
    marginBottom: '12px',
  },
  info: {
    textAlign: 'left' as const,
    color: '#ccc',
    marginBottom: '20px',
    lineHeight: '2',
  },
  scriptBox: {
    background: '#0a0a0a',
    border: '1px solid #333',
    borderRadius: '8px',
    padding: '12px',
    marginBottom: '8px',
    wordBreak: 'break-all' as const,
    color: '#44ff44',
    fontSize: '12px',
    position: 'relative' as const,
  },
  copyBtn: {
    marginTop: '8px',
    padding: '6px 12px',
    borderRadius: '4px',
    border: 'none',
    background: '#333',
    color: '#fff',
    fontSize: '12px',
    cursor: 'pointer',
  },
}
