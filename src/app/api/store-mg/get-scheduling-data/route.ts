import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
  try {
    const { store_ID } = await req.json();
    console.log(store_ID);

    // Call each procedure and collect their results
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [availableDrivers] = await pool.query<mysql.RowDataPacket[]>('CALL available_drivers(?)', [store_ID]);
    const [availableAssistantDrivers] = await pool.query<mysql.RowDataPacket[]>('CALL available_assistant_drivers(?)', [store_ID]);
    const [availableTrucks] = await pool.query<mysql.RowDataPacket[]>('CALL available_trucks(?)', [store_ID]);

    // Extract results from the queries
    const data = {
      availableDrivers: availableDrivers[0] || [],
      availableAssistantDrivers: availableAssistantDrivers[0] || [],
      availableTrucks: availableTrucks[0] || [],
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
