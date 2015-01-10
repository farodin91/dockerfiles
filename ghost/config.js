// # Ghost Configuration
// Setup your Ghost install for various environments
// Documentation can be found at http://support.ghost.org/config/

var path = require('path'),
    config;

config = {
    // ### Production
    // When running Ghost in the wild, use the production environment
    // Configure your URL and mail settings here
    production: {
        url: 'http://{{SERVER_NAME}}',
        urlSSL: 'https://{{SERVER_NAME}}',
        mail: {},
        database: {
            client: 'pg',
            connection: {
                host : '{{POSTGRES_HOST}}',
                user : '{{POSTGRES_USER}}',
                password : '{{POSTGRES_PW}}',
                database : '{{POSTGRES_DB}}',
                charset : 'utf8'
            }
        },

        server: {
            // Host to be passed to node's `net.Server#listen()`
            host: '{{GHOST_HOST}}',
            // Port to be passed to node's `net.Server#listen()`, for iisnode set this to `process.env.PORT`
            port: '{{GHOST_PORT}}'
        }
    },

    // ### Development **(default)**
    development: {
        // The url to use when providing links to the site, E.g. in RSS and email.
        // Change this to your Ghost blogs published URL.
        url: 'http://{{SERVER_NAME}}',

        // Example mail config
        // Visit http://support.ghost.org/mail for instructions
        // ```
        //  mail: {
        //      transport: 'SMTP',
        //      options: {
        //          service: 'Mailgun',
        //          auth: {
        //              user: '', // mailgun username
        //              pass: ''  // mailgun password
        //          }
        //      }
        //  },
        // ```
        database: {
            client: 'pg',
            connection: {
                host : '{{POSTGRES_HOST}}',
                user : '{{POSTGRES_USER}}',
                password : '{{POSTGRES_PW}}',
                database : '{{POSTGRES_DB}}',
                charset : 'utf8'
            }
        },
        server: {
            // Host to be passed to node's `net.Server#listen()`
            host: '{{GHOST_HOST}}',
            // Port to be passed to node's `net.Server#listen()`, for iisnode set this to `process.env.PORT`
            port: '{{GHOST_PORT}}'
        },
        paths: {
            contentPath: path.join(__dirname, '/content/')
        }
    },
};

// Export config
module.exports = config;
