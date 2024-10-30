import { NextRequest, NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST(req: NextRequest) {
  try {
    // Extract data from the request body
    const { customer_ID, store_ID, route_ID, description, payment } = await req.json();

    // Validate the request parameters
    if (!customer_ID || !store_ID || !route_ID || !description || !payment) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      );
    }

    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }

    // Call the stored procedure to create a new purchase order
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL purchas_orders(?, ?, ?, ?, ?)', [
      customer_ID,
      store_ID,
      route_ID,
      description,
      payment,
    ]);

    // Get the order confirmation details
    const result = rows[0] || {}; // The first result set should contain order details

    // Respond with success and the order details
    return NextResponse.json({
      message: 'Order placed successfully',
      orderDetails: result,
    });
  } catch (error) {
    console.error('Error placing order:', error);
    return NextResponse.json(
      { error: 'Failed to place order' },
      { status: 500 }
    );
  }
}
