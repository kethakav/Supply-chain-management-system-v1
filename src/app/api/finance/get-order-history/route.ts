// /app/api/orders/route.ts
import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

// Define the order interface
interface Order {
  order_id: number;
  customer_id: number;
  ordered_date_time: string;
  total_amount: number;
  payment_documents: string;
  order_capacity: number;
  expecting_delivery_date: string;
  nearest_store_id: number;
  route_id: number;
  route_description_input: string;
  finance_manager_id: number | null;
  confirm_payments: number;
  sent_by_train: number;
  train_delivery_id: number | null;
  recieved_to_store: number;
  delivery_id: number | null;
  delivered_confirmation: number;
  delivered_date_time: string | null;
}

export async function POST(req: Request) {
  try {
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }

    // Query to get all orders where confirm_payments is true
    const [rows] = await pool.query<mysql.RowDataPacket[]>(`
      SELECT 
        order_id, 
        customer_id, 
        ordered_date_time, 
        total_amount, 
        payment_documents, 
        order_capacity, 
        expecting_delivery_date, 
        nearest_store_id, 
        route_id, 
        route_description_input, 
        finance_manager_id, 
        confirm_payments, 
        sent_by_train, 
        train_delivery_id, 
        recieved_to_store, 
        delivery_id, 
        delivered_confirmation, 
        delivered_date_time 
      FROM orders 
      WHERE confirm_payments = true
    `);

    const orderHistory = rows || [];

    // Calculate stage based on the order data
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

    // Structure the response as an array of orders
    const response = {
      orders: processedOrders, // An array of processed orders
      total: processedOrders.length, // Optional: Add total count of orders
    };

    return NextResponse.json(response);
  } catch (error) {
    console.error("Error fetching current orders:", error);
    return NextResponse.json(
      { error: "Failed to fetch current orders" },
      { status: 500 }
    );
  }
}
