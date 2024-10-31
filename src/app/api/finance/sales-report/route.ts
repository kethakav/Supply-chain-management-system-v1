import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function GET(req: Request) {
  try {
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    
    // Call the stored procedures to get all routes and stores
    const [rows_route] = await pool.query<mysql.RowDataPacket[]>('CALL sales_report_by_route()');
    const [rows_store] = await pool.query<mysql.RowDataPacket[]>('CALL sales_report_by_stores()');

    // Access the first result set from each procedure
    const routes = rows_route[0] || []; // Default to an empty array if no results
    const stores = rows_store[0] || []; // Default to an empty array if no results

    // Combine the data into a structured response
    const responseData = {
      routes,
      stores,
    };

    console.log('Items fetched:', responseData);

    // Return the combined response
    return NextResponse.json(responseData);
  } catch (error) {
    console.error('Error fetching items:', error);
    return NextResponse.json(
      { error: 'Failed to fetch items', details: (error as Error).message },
      { status: 500 }
    );
  }
}
