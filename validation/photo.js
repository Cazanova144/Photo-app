/**
 * Photo Validation Rules
 */

const { body } = require('express-validator');

/**
 * Create Photo validation rules
 *
 * Required: title, url
 * Optional: comment
 */
const createRules = [
	body('title').exists().isLength({ min: 3 }),
	body('url').exists().isURL().isLength({ min: 2 }),
	body('comment').optional({checkFalsy: true}).isLength({ min: 3 }),
];

/**
 * Update Photo validation rules
 *
 * Required: -
 * Optional: title, url, comment
 */
const updateRules = [
	body('title').optional().isLength({ min: 3 }),
	body('url').optional().isURL().isLength({ min: 2 }),
	body('comment').optional({checkFalsy: true}).isLength({ min: 3 }),
];

module.exports = {
	createRules,
	updateRules,
}
