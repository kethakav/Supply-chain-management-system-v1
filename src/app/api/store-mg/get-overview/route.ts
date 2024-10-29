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
    const { store_ID } = await req.json();
    console.log(store_ID);

    // Call each procedure and collect their results
    // const [trucks] = await pool.query<mysql.RowDataPacket[]>('CALL available_trucks(?)', [store_ID]);
    // const [drivers] = await pool.query<mysql.RowDataPacket[]>('CALL available_drivers(?)', [store_ID]);
    // const [assistantDrivers] = await pool.query<mysql.RowDataPacket[]>('CALL available_assistant_drivers(?)', [store_ID]);
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
