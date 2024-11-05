const db = require('../config/db');
const bcrypt = require('bcrypt');

const user = {
    register: async (data, callback) => {
        try {
            const hashedPassword = await bcrypt.hash(data.password, 10);
            const query = 'INSERT INTO users (username, email, password) VALUES (?, ?, ?)';
            db.query(query, [data.username, data.email, hashedPassword], callback);
        } catch (error) {
            console.error('Error hashing password:', error);
            callback(error);
        }
    },
    authenticate: (email, password, callback) => {
        const query = 'SELECT * FROM users WHERE email = ?';
        db.query(query, [email], async (err, results) => {
            if (err) {
                console.error('Database query error:', err);
                return callback(err);
            }
            if (results.length === 0) {
                console.log('No user found for email:', email);
                return callback(null, false);
            }

            // Check password match
            const match = await bcrypt.compare(password, results[0].password);
            if (match) {
                callback(null, results[0]); // User authenticated
            } else {
                console.log('Incorrect password for email:', email);
                callback(null, false);
            }
        });
    },
    emailExists: (email, callback) => {
        const query = 'SELECT * FROM users WHERE email = ?';
        db.query(query, [email], (err, results) => {
            if (err) {
                console.error('Database query error:', err);
                return callback(err);
            }
            callback(null, results.length > 0); // true if email exists, false otherwise
        });
    },
    updatePassword: (email, newPassword, callback) => {
        const sql = 'UPDATE users SET password = ? WHERE email = ?'; // Adjust your table and column names as necessary

        db.query(sql, [newPassword, email], (err, results) => {
            if (err) {
                console.error('Error updating password:', err);
                return callback(err);
            }
            if (results.affectedRows === 0) {
                return callback(new Error('No user found with that email'));
            }
            callback(null);
        });
    },
        // Function to get all products
    getAllProd: () => {
        return new Promise((resolve, reject) => {
            const query = 'SELECT * FROM products';
            db.query(query, (err, result) => {
                if (err) {    
                    return reject(err);
                }
                resolve(result);
            }); 
        });
    },
    getAllProdexcept: (id) => {
        return new Promise((resolve, reject) => {
            const query = 'SELECT * FROM products where product_id != ?';
            db.query(query,[id], (err, result) => {
                if (err) {    
                    return reject(err);
                }
                resolve(result);
            }); 
        });
    },
    getAllUser:() => {
        return new Promise((resolve, reject) => {
            const query = 'select * from users';
            db.query(query, (err, result)=>{
                if(err){    
                    return reject (err);
                }
                resolve(result); 
            }); 
        })
    },
    updateProduct:(id, data, callback) =>{
        const query = "update products set price = ?, stock =? where product_id=?"; 
        db.query(query, [data.price, data.stock, id], callback);
    },
        // Function to get a specific product by ID
    getProductById: (id) => {
        return new Promise((resolve, reject) => {
            const query = 'SELECT * FROM products WHERE product_id = ?';
            db.query(query, [id], (err, result) => {
                if (err) {
                    return reject(err);
                }
                resolve(result);
            });
        });
    },
    addToCart: (data, callback) => {
        const query = 'INSERT INTO cart (user_id, product_id, quantity, totalPrice) VALUES (?, ?, ?, ?)';
        
        // Ensure data.price and data.quantity are valid numbers; set to 0 if not.
        const price = isNaN(data.price) ? 0 : data.price;
        const quantity = isNaN(data.quantity) ? 0 : data.quantity;
        const totalPrice = price * quantity;
    
        db.query(query, [data.user_id, data.productId, quantity, totalPrice], callback);
    },
    
    
};

module.exports = user;
