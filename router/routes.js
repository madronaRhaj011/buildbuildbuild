const express = require('express');
const router = express.Router();
const Mcontroller = require('../controller/mcontroller');
const productController = require('../controller/productController');

router.get('/', Mcontroller.show.showlanding);
router.get('/register', Mcontroller.show.showRegister);
router.get('/login', Mcontroller.show.showLogin);
router.get('/dash', Mcontroller.show.showDashboard);
router.get('/materials', Mcontroller.show.showMaterials);
router.get('/contactUs', Mcontroller.show.showContactus);
router.get('/material-overview/:id', Mcontroller.show.showOverview);
router.get('/admin', Mcontroller.show.showAdminDash);
router.get('/email-verification', Mcontroller.show.showEmailVerification);
router.get('/reset-password', Mcontroller.show.showResetPassword);
router.get('/cart', Mcontroller.show.showCart);
router.get('/billing-detail', Mcontroller.show.showBillingDetail);
router.get('/profile', Mcontroller.show.showProfile);


router.get('/adminProduct', Mcontroller.admin.showProd);
router.get('/adminUser', Mcontroller.admin.showUser);
router.post('/editProduct',Mcontroller.admin.updateProducts);

router.post('/sendVerificationCode',Mcontroller.user.sendVerificationCode);
router.post('/verifyCode',Mcontroller.user.verifyCode);
router.post('/register', Mcontroller.user.register);
router.post('/login', Mcontroller.user.login);
router.post('/reset-password', Mcontroller.user.resetPassword);
router.post('/add-to-cart', Mcontroller.user.addToCart);
router.post('/update-quantity', Mcontroller.user.updateQuantity);
router.post('/updateProfile', Mcontroller.user.updateProfile); 
router.post('/add-billing-address', Mcontroller.user.addBillingDetail); 
router.get('/delete-cart-items/:id', Mcontroller.user.deleteCartItem);



router.get('/logout', Mcontroller.user.logout);
// router.get('/products', productController.getProducts);



const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
      cb(null, 'public/uploads'); // Save images in the public/uploads folder
    },
    filename: (req, file, cb) => {
      cb(null, Date.now() + path.extname(file.originalname)); // Generate unique filename
    }
  });

const upload = multer({ storage });

router.post('/addProducts', upload.single('imgPrd'), Mcontroller.admin.addProducts);

module.exports = router;