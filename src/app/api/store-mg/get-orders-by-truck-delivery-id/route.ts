import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
  try {
    const { truck_delivery_id } = await req.json();
    console.log(truck_delivery_id);

    // Call the stored procedure using CALL
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetOrdersByTruckDeliveryId(?)', [truck_delivery_id]);

    // Assuming the train details are in the first result set of the procedure
    const trainDetails = rows;

    console.log(trainDetails);

    return NextResponse.json(trainDetails);
  } catch (error) {
    console.error('Error fetching train details:', error);
    return NextResponse.json(
      { error: 'Failed to fetch train details' },
      { status: 500 }
    );
  }
}
