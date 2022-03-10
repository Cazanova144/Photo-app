/**
 * Example Controller
 */

const debug = require('debug')('books:album_controller');
const { matchedData, validationResult } = require('express-validator');
const models = require('../models');

/**
 * Get all resources
 *
 * GET /
 */
const index = async (req, res) => {
	const all_albums = await models.Album.fetchAll();

	res.send({
		status: 'success',
		data: {
            all_albums,
        }
	});
}

/**
 * Get a specific resource
 *
 * GET /:albumId
 */
const show = async (req, res) => {
	const album = await new models.Album({ id: req.params.albumId })
		.fetch({ withRelated: ['photos'] });

	res.send({
		status: 'success',
		data: {
            album,
        }
	});
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

        const album = await new models.Album(validData).save();
        debug('Created new album successfully: %O', album);

        res.send({
            status: 'success',
            data: album,
            });
    } catch (error) {
        res.status(500).send({
            status: 'error',
            message: 'Exception thrown when attempting to add album.'
        });
        throw error;
    
    }
};

/**
 * Add photo to album
 * 
 * POST /:albumId/photos
 */ 
const addPhotoToAlbum = async (req, res) => {
	// get only the validated data from the request
	const validData = matchedData(req);

	const albumId = req.params.albumId;

	const user = await models.User.fetchById(req.user.id, { 
		withRelated: ['albums', 'photos']
	});

	const album = await new models.Album({ id: albumId }).fetch({ require: false});

	if (!album) {
		debug('Album was not found. %o', { id: req.params.albumId });
		res.status(404).send({
			status: 'fail',
			data: 'Album Not Found',
		});
		return;
	}

	// check for any validation errors
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(422).send({ status: 'fail', data: errors.array() });
	}

	const userAlbum = user.related('albums').find(album => album.id == req.params.albumId);
	const userPhoto = user.related('photos').find(photo => photo.id == validData.photo_id);

	if (!userAlbum || !userPhoto) {
		debug('Cannot add photo to album you do not own. %o', {
			id: req.params.albumId,
		});
		res.status(403).send({
			status: 'fail',
			data: "Action denied. This album doesn't belong to you!",
		});
		return;
	}

	try {
		const result = await album.photos().attach(validData.photo_id);
		debug('Added photo to album successfully: %O', result);

		res.send({
			status: 'success',
			data: null,
		});
	} catch (error) {
		res.status(500).send({
			status: 'error',
			message: 'Exception thrown in database when adding a photo to an album.',
		});
		throw error;
	}
} 

/**
 * Update a specific resource
 *
 * PUT /:albumId
 */
const update = async (req, res) => {
	const albumId = req.params.albumId;

	// make sure example exists
	const album = await new models.Album({ id: albumId }).fetch({ require: false });
	if (!album) {
		debug("Album to update was not found. %o", { id: albumId });
		res.status(404).send({
			status: 'fail',
			data: 'Album Not Found',
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
		const updatedAlbum = await album.save(validData);
		debug("Updated album successfully: %O", updatedAlbum);

		res.send({
			status: 'success',
			data: album,
		});

	} catch (error) {
		res.status(500).send({
			status: 'error',
			message: 'Exception thrown in database when updating a new album.',
		});
		throw error;
	}
}

/**
 * Destroy a specific resource
 *
 * DELETE /:albumId
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
	addPhotoToAlbum,
	update,
	destroy,
}
