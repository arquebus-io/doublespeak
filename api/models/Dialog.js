/**
* Dialog.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

/**
 * CREATE TABLE `dialog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ru` text,
  `en` text,
  `ru_word_length` int(11) DEFAULT '0',
  `en_word_length` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ru_word_length` (`ru_word_length`),
  FULLTEXT KEY `ru` (`ru`),
  FULLTEXT KEY `en` (`en`)
) ENGINE=MyISAM AUTO_INCREMENT=5506286 DEFAULT CHARSET=utf8;
**/

module.exports = {
    migrate: 'safe',
    autoCreatedAt: false,
    autoUpdatedAt: false,
    attributes: {
          ru: 'STRING',
          en: 'STRING',
          ru_word_length: {
              type: 'INTEGER',
              defaultsTo: 0,
              index: true
          },
          en_word_length: {
              type: 'INTEGER',
              defaultsTo: 0
          }
    }

};
