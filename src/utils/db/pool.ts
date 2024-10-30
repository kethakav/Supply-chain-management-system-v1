import mysql, { Pool } from "mysql2/promise";

let pool: Pool | null = null;

if (!pool) {
  pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    connectionLimit: 10, // Adjust as needed
  });
}

export default pool;
