// /app/api/orders/route.ts
import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

// Define the order interface
interface Order {
  order_id: number; // Add other properties as needed
  confirm_payments: boolean;
  sent_by_train: boolean;
  recieved_to_store: boolean;
  delivered_confirmation: boolean;
  // Additional properties can be added here
}

export async function POST(req: Request) {
  try {
    const { customer_ID } = await req.json();
    console.log("Customer ID:", customer_ID);

    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL show_current_orders_customer(?)', [customer_ID]);

    const orderHistory = rows || [];

    // Add stage calculation based on the order data
    const processedOrders = orderHistory.map((order) => {
      let stage = 1;
      if (order.confirm_payments) stage = 1;
      if (order.sent_by_train) stage = 2;
      if (order.recieved_to_store) stage = 3;
      if (order.delivered_confirmation) stage = 4;

      return {
        ...order,
        stage,
      };
    });

    return NextResponse.json(processedOrders);
  } catch (error) {
    console.error("Error fetching current orders:", error);
    return NextResponse.json(
      { error: "Failed to fetch current orders" },
      { status: 500 }
    );
  }
}
