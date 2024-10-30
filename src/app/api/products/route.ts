// app/api/products/route.ts
import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import pool from '@/utils/db/pool';

interface Product {
    product_id: number;
    product_name: string;
    product_price: number;
    Product_capacity: number;
    product_image_url: string;
}

export async function GET() {
    try {
        // Explicitly type the query result
        if (!pool) {
            throw new Error('Database connection pool is not initialized.');
        }
        const [result] = await pool.query<mysql.RowDataPacket[]>('CALL show_all_products()') as [mysql.RowDataPacket[], mysql.FieldPacket[]];
        
        // The stored procedure result is in the first element of the result array
        const products = result[0] as Product[];
        
        return NextResponse.json(products);
    } catch (error) {
        console.error('Error fetching products:', error);
        return NextResponse.json(
            { error: 'Failed to fetch products' },
            { status: 500 }
        );
    }
}