const db = require('../config/db'); // Assuming a database setup file

// Get all products with optional filters
const getFilteredProducts = async (filters) => {
    const { category, minPrice, maxPrice, availability } = filters;
    let query = 'SELECT * FROM products WHERE 1=1';
    const values = [];

    if (category) {
        query += ' AND category = ?';
        values.push(category);
    }
    if (minPrice) {
        query += ' AND price >= ?';
        values.push(minPrice);
    }
    if (maxPrice) {
        query += ' AND price <= ?';
        values.push(maxPrice);
    }
    if (availability) {
        query += ' AND stock > 0';
    }

    const [rows] = await db.execute(query, values);
    return rows;
};

// Get unique categories
const getCategories = async () => {
    const [rows] = await db.execute('SELECT DISTINCT category FROM products');
    return rows;
};

module.exports = { getFilteredProducts, getCategories };
