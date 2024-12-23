import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function GET(req: Request) {
  try {
    // Call the stored procedure to get all routes
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL get_all_routes()');

    // The routes will be in the first result set of the procedure
    const routes = rows[0]; // Note: stored procedures return an array where first element contains the results

    console.log('Routes fetched:', routes);

    return NextResponse.json(routes);
  } catch (error) {
    console.error('Error fetching routes:', error);
    return NextResponse.json(
      { error: 'Failed to fetch routes' },
      { status: 500 }
    );
  }
}