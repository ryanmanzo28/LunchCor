import mysql from 'mysql2/promise'

type MysqlGlobal = typeof globalThis & { __lunchcorPool?: mysql.Pool }

export function getPool() {
  const globalRef = globalThis as MysqlGlobal

  // Reuse one pool across hot reloads in development.
  if (!globalRef.__lunchcorPool) {
    globalRef.__lunchcorPool = mysql.createPool({
      host: process.env.DB_HOST || '127.0.0.1',
      port: Number.parseInt(process.env.DB_PORT || '3306', 10),
      user: process.env.DB_USERNAME || 'lunchcor',
      password: process.env.DB_PASSWORD || 'lunchcor',
      database: process.env.DB_DATABASE || 'lunchcor',
      connectionLimit: 10,
    })
  }

  return globalRef.__lunchcorPool
}
