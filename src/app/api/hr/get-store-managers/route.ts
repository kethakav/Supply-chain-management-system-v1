// app/api/finance-managers/route.ts

import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

export async function GET() {
  try {
    // Call the stored procedure to get all finance and order managers
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetAllStoreManagers()');

    // Assuming the procedure returns the results in the first result set
    const financeManagers = rows;

    return NextResponse.json(financeManagers);
  } catch (error) {
    console.error('Error fetching finance and order managers:', error);
    return NextResponse.json(
      { error: 'Failed to fetch finance and order managers' },
      { status: 500 }
    );
  }
}
