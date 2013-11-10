requirejs.config
    baseUrl: 'js/app'

    shim:
        'jasmine-html':
            deps: ['jasmine']
        'jquery':
            export: ['$']
    paths:
        'jasmine': '../lib/jasmine/lib/jasmine-core/jasmine'
        'jasmine-html': '../lib/jasmine/lib/jasmine-core/jasmine-html'
        'jquery': '../lib/jquery/jquery'


require(
    [
        '../tests/tests'
        'jasmine-html'
    ],
    (tests)->
        class Test
            constructor: ->
                @tests = []

            runTest: (config)->
                if config.defineModules
                    for moduleName of config.defineModules
                        # unset previus module definition
                        requirejs.undef moduleName
                        definition = config.defineModules[moduleName]
                        definition.call()

                require [config.path], (test)=>
                    # execute test
                    test.call()

                    if config.defineModules
                        for moduleName of config.defineModules
                            # unset previus module definition
                            requirejs.undef moduleName

                    # run next test or execute jasmine
                    if @tests.length
                        @runTest @tests.shift()
                    else
                        @executeJasmine()
                    return
                @

            fetchTests: ->
                prefix = '../tests/'

                for test in tests
                    test.path = prefix + test.path

                    if test.only
                        @tests = [test]
                        break
                    @tests.push test
                return

            runTests: ->
                @fetchTests()
                @runTest @tests.shift()
                @

            executeJasmine: ->
                $(->
                    jasmineEnv = jasmine.getEnv()
                    jasmineEnv.updateInterval = 1000
                    consoleReporter = new jasmine.HtmlReporter()
                    jasmineEnv.addReporter consoleReporter
                    jasmineEnv.execute()
                )
                @

        new Test().runTests()
)
