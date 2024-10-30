import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function GET(req: Request) {
  try {
    // const { store_id } = await req.json();
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
  }
    // Call the stored procedure to get unconfirmed orders
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL show_unconfirmed_orders()');

    return NextResponse.json(rows);
  } catch (error) {
    console.error('Error fetching unconfirmed orders:', error);
    return NextResponse.json(
      { error: 'Failed to fetch unconfirmed orders' },
      { status: 500 }
    );
  }
}
