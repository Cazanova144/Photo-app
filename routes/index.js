const express = require('express');
const router = express.Router();
const auth = require('../middlewares/auth');

/* GET / */
router.get('/', (req, res, next) => {
	res.send({ success: true, data: { msg: 'oh, hi' }});
});

router.use('/albums', require('./albums'));
router.use('/photos', require('./photos'));
router.use('/users', auth.basic, require('./users'));

module.exports = router;
