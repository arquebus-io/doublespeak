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
            query, sql_param = {};
        sql_param.russian = req.param('ru');
        sql_param.english = req.param('en');
        sql_param.limit = req.param('limit') ? req.param('limit') : 4;

        if(sql_param.russian) {
            match_string = 'ru';
            against_string = sql_param.russian;
        }
        if(sql_param.english) {
            match_string = 'en';
            against_string = sql_param.english;
        }
        console.log(match_string, against_string);
        query = 'SELECT * FROM dialog d WHERE MATCH(';
        query += match_string;
        query += ') AGAINST (';
        query += sails_mysql.escape(against_string);
        query += ') AND d.ru_word_length < 5'
        query += ' ORDER BY RAND() LIMIT ' + sql_param.limit;

        dialog.query(query, function(err, words) {
            return res.send(words);
        });
    },
};
