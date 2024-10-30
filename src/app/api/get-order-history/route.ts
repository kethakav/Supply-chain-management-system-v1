import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';
export async function POST(req: Request) {
  try {
    const { customer_ID } = await req.json();
    console.log("Customer ID:", customer_ID);

    // Call the stored procedure to get order history for the customer
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL show_order_history_customer(?)', [customer_ID]);

    console.log("Rows:", rows);
    // Assuming the order history details are in the first result set of the procedure
    const orderHistory = rows;

    console.log("Order History:", orderHistory);

    return NextResponse.json(orderHistory);
  } catch (error) {
    console.error("Error fetching order history:", error);
    return NextResponse.json(
      { error: "Failed to fetch order history" },
      { status: 500 }
    );
  }
}
