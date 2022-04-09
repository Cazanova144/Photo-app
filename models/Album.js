/**
 * Album model
 */

module.exports = (bookshelf) => {
	return bookshelf.model('Album', {
		tableName: 'albums',
        hidden: ['_pivot_album_id', '_pivot_photo_id'],
        user() {
            return this.belongsTo('User'); // user.user_id
        },
        photos() {
            return this.belongsToMany('Photo', 'photos_albums');
        }
	}, {
        async fetchById(id, fetchOptions = {}) {
			return await new this({ id }).fetch(fetchOptions);
		}
    });
};