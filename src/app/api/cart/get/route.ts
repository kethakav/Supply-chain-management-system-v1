import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
  try {
    const { customer_ID } = await req.json();
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    // Call the stored procedure to get cart items along with product details
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL show_cart(?)', [customer_ID]);

    // Assuming the cart details are in the first result set of the procedure
    const cartItems = rows;

    console.log(rows);

    return NextResponse.json(cartItems);
  } catch (error) {
    console.error('Error fetching cart:', error);
    return NextResponse.json(
      { error: 'Failed to fetch cart' },
      { status: 500 }
    );
  }
}
