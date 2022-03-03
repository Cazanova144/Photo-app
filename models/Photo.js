/**
 * Photo model
 */

module.exports = (bookshelf) => {
	return bookshelf.model('Photo', {
		tableName: 'photos',
        user() {
            return this.belongsTo('User'); // photos.user_id
        },
        albums() {
            return this.belongsToMany('Album');
        }
	});
};