import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

export async function GET(req: Request) {
  try {
    // const { store_id } = await req.json();

    // Call the stored procedure to get unconfirmed orders
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL show_confirmed_orders()');

    return NextResponse.json(rows);
  } catch (error) {
    console.error('Error fetching unconfirmed orders:', error);
    return NextResponse.json(
      { error: 'Failed to fetch unconfirmed orders' },
      { status: 500 }
    );
  }
}
