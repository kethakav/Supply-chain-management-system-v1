import { NextResponse } from 'next/server';
import mysql from 'mysql2/promise';
import argon2 from 'argon2';

export async function POST(req: Request) {
    let { username, password } = await req.json();
    console.log(`Received login request: username = ${username}, password = [hidden]`);

    // Connect to the database
    let connection;
    try {
        connection = await mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASS,
            database: process.env.DB_NAME
        });
    } catch (error) {
        console.error('Database connection error:', error);
        return NextResponse.json({ error: 'Database connection failed' }, { status: 500 });
    }

    try {
        // Step 1: Identify the table based on the username
        const [rows]: any = await connection.execute(
            `SELECT identify_table(?) AS table_name`,
            [username]
        );

        if (!rows || rows.length === 0) {
            console.log(`Table identification failed for username: ${username}`);
            return NextResponse.json({ error: 'Invalid username or password' }, { status: 401 });
        }

        const table = rows[0]?.table_name;

        console.log(`Identified table for username ${username}: ${table}`);

        if (!table || table === 'Unknown') {
            console.log(`Table identification failed for username: ${username}`);
            return NextResponse.json({ error: 'Invalid username or password' }, { status: 401 });
        }

        // Step 2: Based on the identified table, fetch the hashed password and user details
        let user: any;
        switch (table) {
            case 'customer':
                [user] = await connection.execute(
                    `SELECT customer_id AS id, customer_first_name AS firstName, customer_last_name AS lastName, customer_email AS email, password, 'customer' AS type FROM Customer WHERE user_name = ? LIMIT 1`,
                    [username]
                );
                break;
            case 'manager':
                [user] = await connection.execute(
                    `SELECT manager_id AS id, manager_first_name AS firstName, manager_last_name AS lastName, manager_email AS email, password, 'manager' AS type FROM Manager WHERE user_name = ? LIMIT 1`,
                    [username]
                );
                break;
            case 'driver':
                [user] = await connection.execute(
                    `SELECT driver_id AS id, driver_first_name AS firstName, driver_last_name AS lastName, driver_email AS email, password, 'driver' AS type FROM Driver WHERE user_name = ? LIMIT 1`,
                    [username]
                );
                break;
            case 'assistant_driver':
                [user] = await connection.execute(
                    `SELECT ast_driver_id AS id, ast_driver_first_name AS firstName, ast_driver_last_name AS lastName, ast_driver_email AS email, password, 'assistantDriver' AS type FROM Assistant_Driver WHERE user_name = ? LIMIT 1`,
                    [username]
                );
                break;
            case 'hr_manager':
                [user] = await connection.execute(
                    `SELECT hr_manager_id AS id, manager_first_name AS firstName, manager_last_name AS lastName, manager_email AS email, password, 'hrManager' AS type FROM HR_Manager WHERE user_name = ? LIMIT 1`,
                    [username]
                );
                break;
            case 'financeandorder_manager':
                [user] = await connection.execute(
                    `SELECT finance_manager_id AS id, manager_first_name AS firstName, manager_last_name AS lastName, manager_email AS email, password, 'financeManager' AS type FROM FinanceandOrder_Manager WHERE user_name = ? LIMIT 1`,
                    [username]
                );
                break;
            default:
                console.log(`Table not found for user: ${username}`);
                return NextResponse.json({ error: 'Invalid username or password' }, { status: 401 });
        }

        // Step 3: Handle if the user is not found
        if (!user || user.length === 0) {
            console.log(`No user found for username: ${username} in table: ${table}`);
            return NextResponse.json({ error: 'Invalid username or password' }, { status: 401 });
        }

        const userInfo = user[0];

        // Step 4: Compare the provided password with the hashed password using argon2
        const passwordMatch = await argon2.verify(userInfo.password, password);
        if (!passwordMatch) {
            console.log(`Password mismatch for username: ${username}`);
            return NextResponse.json({ error: 'Invalid username or password' }, { status: 401 });
        }

        // Step 5: Return the user data if the password is correct
        console.log(`User data found: ${JSON.stringify(userInfo)}`);
        return NextResponse.json({
            id: userInfo.id,
            name: `${userInfo.firstName} ${userInfo.lastName}`,
            email: userInfo.email,
            type: userInfo.type,
        });

    } catch (error) {
        console.error('Error during login process:', error);
        return NextResponse.json({ error: 'Something went wrong, please try again later' }, { status: 500 });
    } finally {
        // Close the database connection
        if (connection) {
            await connection.end();
            console.log('Database connection closed');
        }
    }
}
