/**
 * Album model
 */

module.exports = (bookshelf) => {
	return bookshelf.model('Album', {
		tableName: 'albums',
        user() {
            return this.belongsTo('User'); // user.user_id
        },
        photos() {
            return this.belongsToMany('Photo');
        }
	});
};