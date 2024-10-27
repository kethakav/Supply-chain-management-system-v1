import { NextResponse } from "next/server";
import mysql from "mysql2/promise";

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

export async function GET(req: Request) {
  try {
    // Call the stored procedure to get all routes
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetAllTrainDeliveries()');

    // The routes will be in the first result set of the procedure
    const routes = rows[0]; // Note: stored procedures return an array where first element contains the results

    console.log('Train Schedules fetched:', routes);

    return NextResponse.json(routes);
  } catch (error) {
    console.error('Error fetching train schedules:', error);
    return NextResponse.json(
      { error: 'Failed to fetch train schedules' },
      { status: 500 }
    );
  }
}