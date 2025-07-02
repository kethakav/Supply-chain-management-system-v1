import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
  try {
    const { store_ID } = await req.json();
    console.log(store_ID);

    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [ordersToDeliver] = await pool.query<mysql.RowDataPacket[]>('CALL count_orders_to_deliver(?)', [store_ID]);
    const [ordersToReceive] = await pool.query<mysql.RowDataPacket[]>('CALL count_orders_to_recieve(?)', [store_ID]);

    // Extract the counts from the results
    const data = {
      ordersToDeliver: ordersToDeliver[0][0]['count(*)'] || 0,
      ordersToReceive: ordersToReceive[0][0]['count(*)'] || 0,
    };

    console.log(data);

    return NextResponse.json(data);
  } catch (error) {
    console.error('Error fetching data:', error);
    return NextResponse.json(
      { error: 'Failed to fetch data' },
      { status: 500 }
    );
  }
}
