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
    const { store_ID } = await req.json(); // Get store_ID from the request body
    console.log(store_ID);

    // Call the stored procedure to get deliveries linked to the store_ID
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetDeliveriesByStoreID(?)', [store_ID]);

    // Assuming the deliveries are in the first result set of the procedure
    const deliveries = rows;

    console.log(deliveries);

    return NextResponse.json(deliveries);
  } catch (error) {
    console.error('Error fetching deliveries:', error);
    return NextResponse.json(
      { error: 'Failed to fetch deliveries' },
      { status: 500 }
    );
  }
}
