import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

export async function POST(req: Request) {
  try {
    const { order_id } = await req.json();
    console.log(`Confirming delivery for order ID: ${order_id}`);

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
