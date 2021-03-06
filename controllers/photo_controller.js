/**
 * Example Controller
 */

const debug = require('debug')('books:photo_controller');
const { matchedData, validationResult } = require('express-validator');
const models = require('../models');

/**
 * Get all resources
 *
 * GET /
 */
const index = async (req, res) => {
	const all_photos = await req.user.load('photos');

	res.send({
		status: 'success',
		data: 
            all_photos,
	});
}

/**
 * Get a specific resource
 *
 * GET /:photoId
 */
const show = async (req, res) => {
	await req.user.load('photos');

	const photo = await new models.Photo({ id: req.params.photoId })
		.fetch();

	const specificPhoto = await new models.Photo({ id: req.params.photoId })

	const relatedPhoto = req.user.related('photos');
	
	const findPhoto = relatedPhoto.find(photo => photo.id == specificPhoto.id)
	
	if (!findPhoto) {
		return res.status(404).send({
			status: 'fail',
			data: 'Photo not found'
		})
	}
	
	try {
		res.status(200).send({
			status: 'success',
			data: photo
		})
	} catch(error) {
		res.status(500).send({
			status: 'fail',
			message: error
		})
		throw error
	}
}

/**
 * Store a new resource
 *
 * POST /
 */
const store = async (req, res) => {
	// check for any validation errors
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(422).send({ status: 'fail', data: errors.array() });
	}

	// get only the validated data from the request
	const validData = matchedData(req);

    validData.user_id = req.user.id;

	try {
		const photo = await new models.Photo(validData).save();
		debug("Created new example successfully: %O", photo);

		res.send({
			status: 'success',
			data: {
                photo
            },
		});

	} catch (error) {
		res.status(500).send({
			status: 'error',
			message: 'Exception thrown in database when creating a new example.',
		});
		throw error;
	}
}

/**
 * Update a specific resource
 *
 * PUT /:photoId
 */
const update = async (req, res) => {
	const photoId = req.params.photoId;

	// make sure example exists
	const photo = await new models.Photo({ id: photoId }).fetch({ require: false });
	if (!photo) {
		debug("Photo to update was not found. %o", { id: photoId });
		res.status(404).send({
			status: 'fail',
			data: 'Photo Not Found',
		});
		return;
	}

	// check for any validation errors
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(422).send({ status: 'fail', data: errors.array() });
	}

	// get only the validated data from the request
	const validData = matchedData(req);

	try {
		const updatedPhoto = await photo.save(validData);
		debug("Updated example successfully: %O", updatedPhoto);

		res.send({
			status: 'success',
			data: photo,
		});

	} catch (error) {
		res.status(500).send({
			status: 'error',
			message: 'Exception thrown in database when updating a new photo.',
		});
		throw error;
	}
}

/**
 * Destroy a specific resource
 *
 * DELETE /:exampleId
 */
const destroy = (req, res) => {
	res.status(400).send({
		status: 'fail',
		message: 'You need to write the code for deleting this resource yourself.',
	});
}

module.exports = {
	index,
	show,
	store,
	update,
	destroy,
}
