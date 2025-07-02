import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function GET(req: Request) {
  const url = new URL(req.url);
  const store_id = url.searchParams.get("store_id");

  if (!store_id) {
    return NextResponse.json(
      { error: "Store ID is required" },
      { status: 400 }
    );
  }

  try {
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>(
      'SELECT * FROM store WHERE store_id = ?',
      [store_id]
    );

    if (rows.length === 0) {
      return NextResponse.json(
        { error: "Store not found" },
        { status: 404 }
      );
    }

    return NextResponse.json(rows[0]);
  } catch (error) {
    console.error('Error fetching store:', error);
    return NextResponse.json(
      { error: 'Failed to fetch store' },
      { status: 500 }
    );
  }
}
