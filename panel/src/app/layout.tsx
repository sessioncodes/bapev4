import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Bape',
  description: 'Bape Authentication Panel',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
