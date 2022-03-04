/**
 * User model
 */
const bcrypt = require('bcrypt');

module.exports = (bookshelf) => {
	return bookshelf.model('User', {
		tableName: 'users',
		hidden: ['password'],
		albums() {
			return this.hasMany('Album');
		}, 
		photos() {
			return this.hasMany('Photo');
		}
	}, {
		hashSaltRounds: 10,

		async fetchById(id, fetchOptions = {}) {
			return await new this({ id }).fetch(fetchOptions);
		},

		async login(email, password) {
			// Hitta användare med email (return false om email inte finns)
			const user = await new this({ email }).fetch({ require: false });
			if (!user) {
				return false;
			}
			const hash = user.get('password');

			// Hasha lösenordet med saltet från db
			// Jämför om genererade hashen matchar db-hashen
			const result = await bcrypt.compare(password, hash);
			if (!result) {
				return false;
			}

			// Om allt funkar, return user
			return user;
		}
	});
};
