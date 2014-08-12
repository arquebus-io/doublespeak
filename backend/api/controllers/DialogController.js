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
            query, match_string, against_string;
        russian_param = req.param('ru');
        english_param = req.param('en');
        if(russian_param) {
            match_string = 'ru';
            against_string = russian_param;
        }
        if(english_param) {
            match_string = 'en';
            against_string = english_param;
        }
        query = 'SELECT * FROM dialog d WHERE MATCH(';
        query += match_string;
        query += ') AGAINST (';
        query += sails_mysql.escape(against_string);
        query += ') ORDER BY RAND() LIMIT 4';

        dialog.query(query, function(err, words) {
            return res.send(words);
        });
    },
};
