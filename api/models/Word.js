/**
* Word.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {
    migrate: 'safe',
    autoCreatedAt: false,
    autoUpdatedAt: false,
    attributes: {
        name: 'STRING',
        frequency: {
            type: 'INTEGER',
            defaultsTo: 0
        }
    }
};

