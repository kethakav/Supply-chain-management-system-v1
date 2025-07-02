import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
  try {
    const { delivery_id } = await req.json();

    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
  }

    // Call the stored procedure to end the trip
    await pool.query('CALL end_trip(?)', [delivery_id]);

    return NextResponse.json({ message: 'Trip ended successfully' });
  } catch (error) {
    console.error('Error ending trip:', error);
    return NextResponse.json(
      { error: 'Failed to end trip' },
      { status: 500 }
    );
  }
}
