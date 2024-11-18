const db = require('../config/db'); // Import your database connection

exports.getFilteredProducts = async (req, res) => {
  const { search, category } = req.query;

  try {
    // SQL query with optional filters
    let query = 'SELECT * FROM products WHERE 1=1';
    const params = [];

    // Add search filter
    if (search) {
      query += ' AND name LIKE ?';
      params.push(`%${search}%`);
    }

    // Add category filter
    if (category) {
      query += ' AND category = ?';
      params.push(category);
    }

    const [products] = await db.execute(query, params);
    res.json({ products });
  } catch (error) {
    console.error('Error fetching products:', error);
    res.status(500).json({ message: 'Error fetching products' });
  }
};
