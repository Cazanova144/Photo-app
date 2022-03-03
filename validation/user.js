/**
 * User Validation Rules
 */

const { body } = require('express-validator');
const models = require('../models');

/**
 * Create User validation rules
 *
 * Required: username, password, first_name, last_name
 * Optional: -
 */
const createRules = [
	body('email').exists().isLength({ min: 3 }).custom(async value => {
		const user = await new models.User({ email: value }).fetch({ require: false });
        // let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		if (user) {
			return Promise.reject("Email is already registered.");
		}

		return Promise.resolve();
	}),
	body('password').exists().isLength({ min: 6 }),
	body('first_name').exists().isLength({ min: 3 }),
	body('last_name').exists().isLength({ min: 3 }),
];

/**
 * Update User validation rules
 *
 * Required: -
 * Optional: password, first_name, last_name
 */
const updateRules = [
	body('password').optional().isLength({ min: 6 }),
	body('first_name').optional().isLength({ min: 3 }),
	body('last_name').optional().isLength({ min: 3 }),
];

module.exports = {
	createRules,
	updateRules,
}
