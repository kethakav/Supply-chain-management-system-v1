import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function GET(req: Request) {
  try {
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
  }
    // Call the stored procedure to get all routes
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL get_all_trains()');

    // The routes will be in the first result set of the procedure
    const routes = rows[0]; // Note: stored procedures return an array where first element contains the results

    console.log('Trains fetched:', routes);

    return NextResponse.json(routes);
  } catch (error) {
    console.error('Error fetching trains:', error);
    return NextResponse.json(
      { error: 'Failed to fetch trains' },
      { status: 500 }
    );
  }
}