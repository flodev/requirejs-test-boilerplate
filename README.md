requirejs-test-boilerplate
====================

This project provides a boilerplate for organizing your test and app files.

Features
====================

* organise your tests in a config file
* run all or just one test at a time
* mock modules

Installation
====================

Checkout out or download this project to a directory.
Install bower (if you havn't already):

    sudo npm install -g bower
  
Then simply type:

    bower install

This will install the dependencies.

Description and configuration
====================

The boilerplate is organized as follows:

    -- coffee
        -- app
            -- app.coffee
            -- (other app files ...)
        -- tests
            -- tests.coffee
            -- (test files ...)
        -- index.coffee
        -- test.coffee
    -- js
        -- (compiled files ...)
    index.html
    test.html
    
* test.html starts the tests
* index.html starts the app
* `coffee/index.coffee` is the first file which gets loaded and starts the app
* `coffee/test.coffee` is the first file which gets loaded and starts the tests
* `coffee/test/tests.coffee` contains the configuration for all tests

Configuration Options
----
* `path: {string}` path
* `only: {bool}` means only only this test will be executed (the first test which has the only flag)
* `defineModules: {object}` contains an object of modules which are mocked. Key is the module Name. Value is a function that should contain a "define"-call
