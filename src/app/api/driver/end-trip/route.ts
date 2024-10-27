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
    const { delivery_id } = await req.json();

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
