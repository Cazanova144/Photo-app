/**
 * Album Validation Rules
 */

const { body } = require('express-validator');
const models = require('../models');

/**
 * Create Album validation rules
 *
 * Required: title
 * Optional: -
 */
const createRules = [
	body('title').exists().isLength({ min: 3 })
];

/**
 * Update Album validation rules
 *
 * Required: -
 * Optional: title
 */
const updateRules = [
	body('title').exists().isLength({ min: 3 }),
];


/**
 * Add Photo to Album validation rules
 * 
 * Required: photo_id
 * Optional: -
 */
const addPhotoRules = [
	body('photo_id').exists().isInt().custom(async value => {
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
