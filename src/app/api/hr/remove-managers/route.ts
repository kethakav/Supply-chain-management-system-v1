// pages/api/removeManagers.ts
import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST(req: Request) {
  try {
    const { input_table, input_id } = await req.json();

    // Ensure input_table and input_id are provided
    if (!input_table || typeof input_id !== 'number') {
      return NextResponse.json(
        { error: 'Invalid input provided' },
        { status: 400 }
      );
    }

    // Call the stored procedure to remove the manager
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [result] = await pool.query<mysql.RowDataPacket[]>(
      'CALL remove_managers(?, ?)',
      [input_table, input_id]
    );

    // Return the result of the deletion
    return NextResponse.json({ message: 'Manager removed successfully', result });
  } catch (error) {
    console.error('Error removing manager:', error);
    return NextResponse.json(
      { error: 'Failed to remove manager' },
      { status: 500 }
    );
  }
}
