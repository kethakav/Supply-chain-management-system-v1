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
    console.log(delivery_id);

    // Call the stored procedure using CALL
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetOrdersByTrainDeliveryId(?)', [delivery_id]);

    // Assuming the train details are in the first result set of the procedure
    const trainDetails = rows;

    console.log(trainDetails);

    return NextResponse.json(trainDetails);
  } catch (error) {
    console.error('Error fetching train details:', error);
    return NextResponse.json(
      { error: 'Failed to fetch train details' },
      { status: 500 }
    );
  }
}
