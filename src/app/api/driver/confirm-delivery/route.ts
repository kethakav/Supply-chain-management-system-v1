import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';



export async function POST(req: Request) {
  try {
    const { order_id } = await req.json();
    console.log(`Confirming delivery for order ID: ${order_id}`);

if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
    // Call the stored procedure to confirm delivery
    const [result] = await pool.query<mysql.RowDataPacket[]>('CALL confirm_delivery(?)', [order_id]);

    return NextResponse.json(
      { message: `Order ${order_id} delivery confirmed successfully.` },
      { status: 200 }
    );
  } catch (error) {
    console.error('Error confirming delivery:', error);
    return NextResponse.json(
      { error: 'Failed to confirm delivery' },
      { status: 500 }
    );
  }
}
