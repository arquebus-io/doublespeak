/**
 * DialogController
 *
 * @description :: Server-side logic for managing dialogs
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {
    /**
     * DialogController.search()
     */
    search: function (req, res) {
        var params = req.params.all(),
            sails_mysql = require('sails-mysql'),
            dialog = sails.models.dialog,
            query, match_string, against_string, limit;
        console.log(params);
        against_string = req.param('word');
        limit = req.param('limit') ? req.param('limit') : 4;
        if(req.param('lang') === 'ru') {
            match_string = 'ru';
        } else {
            match_string = 'en';
        }

        console.log(match_string, against_string);
        query = 'SELECT * FROM dialog d WHERE MATCH(';
        query += match_string;
        query += ') AGAINST (';
        query += sails_mysql.escape(against_string);
        query += ') AND d.ru_word_length < 5'
        query += ' LIMIT ' + limit;

        dialog.query(query, function(err, words) {
            return res.send(words);
        });
    },
};
