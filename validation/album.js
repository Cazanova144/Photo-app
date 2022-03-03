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
	body('title').exists().isLength({ min: 3 })
];

/**
 * Update User validation rules
 *
 * Required: -
 * Optional: password, first_name, last_name
 */
const updateRules = [
	body('title').optional().isLength({ min: 3 }),
];

module.exports = {
	createRules,
	updateRules,
}
