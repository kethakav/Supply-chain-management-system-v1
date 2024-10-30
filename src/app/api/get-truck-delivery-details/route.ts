import { NextResponse } from "next/server";
import mysql from "mysql2/promise";
import pool from '@/utils/db/pool';

export async function POST(req: Request) {
  try {
    const { truck_delivery_id } = await req.json();
    console.log(truck_delivery_id);

    // Call the stored procedure to get truck delivery details
    if (!pool) {
      throw new Error('Database connection pool is not initialized.');
    }
    const [rows] = await pool.query<mysql.RowDataPacket[]>('CALL GetTruckDeliveryDetails(?)', [truck_delivery_id]);

    // Assuming the delivery details are in the first result set of the procedure
    const deliveryDetails = rows[0];

    console.log(deliveryDetails);

    return NextResponse.json(deliveryDetails);
  } catch (error) {
    console.error('Error fetching truck delivery details:', error);
    return NextResponse.json(
      { error: 'Failed to fetch truck delivery details' },
      { status: 500 }
    );
  }
}
