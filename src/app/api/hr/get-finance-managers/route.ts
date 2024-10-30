// app/api/finance-managers/route.ts

import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function GET() {
  try {
    // Call the stored procedure to get all finance and order managers
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetAllFinanceOrderManagers()');

    // Assuming the procedure returns the results in the first result set
    const financeManagers = rows;

    return NextResponse.json(financeManagers);
  } catch (error) {
    console.error('Error fetching finance and order managers:', error);
    return NextResponse.json(
      { error: 'Failed to fetch finance and order managers' },
      { status: 500 }
    );
  }
}
