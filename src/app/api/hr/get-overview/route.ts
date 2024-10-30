import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';


export async function POST() {
  try {
    // Query each function separately
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [driversResult] = await pool.query<mysql.RowDataPacket[]>('SELECT count_all_drivers() AS drivers');
    const [managersResult] = await pool.query<mysql.RowDataPacket[]>('SELECT count_all_managers() AS managers');
    const [storesResult] = await pool.query<mysql.RowDataPacket[]>('SELECT count_all_stors() AS stores');
    const [trucksResult] = await pool.query<mysql.RowDataPacket[]>('SELECT count_all_trucks() AS trucks');

    // Extract results from each query
    const drivers = driversResult[0].drivers;
    const managers = managersResult[0].managers;
    const stores = storesResult[0].stores;
    const trucks = trucksResult[0].trucks;

    // Construct the response object
    const counts = {
      drivers,
      managers,
      stores,
      trucks,
    };

    return NextResponse.json(counts);
  } catch (error) {
    console.error('Error fetching counts:', error);
    return NextResponse.json(
      { error: 'Failed to fetch counts' },
      { status: 500 }
    );
  }
}
