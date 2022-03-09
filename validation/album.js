/**
 * Album Validation Rules
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
	body('title').exists().isLength({ min: 3 }),
];

const addPhotoRules = [
	body('photo_id').exists().isLength({ min: 3 }).custom(async value => {
		const photo = await new models.Photo({ id: value }).fetch({ require: false });

		if (!photo) {
			return Promise.reject(`Photo with ID ${value} does not exist.`)
		}

		return Promise.resolve();
	})
];

module.exports = {
	createRules,
	updateRules,
	addPhotoRules
}
