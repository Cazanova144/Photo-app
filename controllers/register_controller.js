/**
 * Register Controller
 */

const bcrypt = require('bcrypt');
const debug = require('debug')('books:register_controller');
const { matchedData, validationResult } = require('express-validator');
const models = require('../models');
// const { login } = require('../models')

/**
 * Register a new user
 *
 * POST /
 */
const register = async (req, res) => {
	// check for any validation errors
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(422).send({ status: 'fail', data: errors.array() });
	}

	// get only the validated data from the request
	const validData = matchedData(req);

	debug("The validated data:", validData);

	// generate a hash of `validData.password`
	// and overwrite `validData.password` with the generated hash
	try {
		validData.password = await bcrypt.hash(validData.password, 10);

	} catch (error) {
		res.status(500).send({
			status: 'error',
			message: 'Exception thrown when hashing the password.',
		});
		throw error;
	}

	try {
		const user = await new models.User(validData).save();
		debug("Created new user successfully: %O", user);

		res.send({
			status: 'success',
			data: {
				user,
			},
		});

	} catch (error) {
		res.status(500).send({
			status: 'error',
			message: 'Exception thrown in database when creating a new user.',
		});
		throw error;
	}
}

/**
 * Login an existing user
 * 
 * POST /
 */
const login = async (req, res) => {
	// check for any validation errors
	const errors = validationResult(req);
	if (!errors.isEmpty()) {
		return res.status(422).send({ status: 'fail', data: errors.array() });
	}

	const validData = matchedData(req)

	debug("The validated data:", validData);

	const { email, password } = req.body;

	debug(email)
	debug(password)

	// find user based on the username (bail if no such user exists)
	const user = await models.User.login(email, password);

	debug(user)

	if (!user) {
		res.status(401).send({
			status: 'fail',
			data: 'Authentication failed.',
		})
	}

	try {
		const hash = user.get('password');

		// hash the incoming cleartext password using the salt from the db
		// and compare if the generated hash matches the db-hash
		const result = await bcrypt.compare(password, hash);

		res.send({
			status: 'success',
			data: {
				result,
			},
		});
	} catch (error) {
		debug('Lösenordet')

		res.status(401).send({
			status: 'fail',
			data: 'Authentication failed.',
		});

		throw error
	}

	// all is well, return user
	return user;
	
}

module.exports = {
	register,
	login
}