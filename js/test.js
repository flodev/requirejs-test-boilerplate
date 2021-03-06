// Generated by CoffeeScript 1.6.3
(function() {
  requirejs.config({
    baseUrl: 'js/app',
    shim: {
      'jasmine-html': {
        deps: ['jasmine']
      },
      'jquery': {
        "export": ['$']
      }
    },
    paths: {
      'jasmine': '../lib/jasmine/lib/jasmine-core/jasmine',
      'jasmine-html': '../lib/jasmine/lib/jasmine-core/jasmine-html',
      'jquery': '../lib/jquery/jquery'
    }
  });

  require(['../tests/tests', 'jasmine-html'], function(tests) {
    var Test;
    Test = (function() {
      function Test() {
        this.tests = [];
      }

      Test.prototype.runTest = function(config) {
        var definition, moduleName,
          _this = this;
        if (config.defineModules) {
          for (moduleName in config.defineModules) {
            requirejs.undef(moduleName);
            definition = config.defineModules[moduleName];
            definition.call();
          }
        }
        require([config.path], function(test) {
          test.call();
          if (config.defineModules) {
            for (moduleName in config.defineModules) {
              requirejs.undef(moduleName);
            }
          }
          if (_this.tests.length) {
            _this.runTest(_this.tests.shift());
          } else {
            _this.executeJasmine();
          }
        });
        return this;
      };

      Test.prototype.fetchTests = function() {
        var prefix, test, _i, _len;
        prefix = '../tests/';
        for (_i = 0, _len = tests.length; _i < _len; _i++) {
          test = tests[_i];
          test.path = prefix + test.path;
          if (test.only) {
            this.tests = [test];
            break;
          }
          this.tests.push(test);
        }
      };

      Test.prototype.runTests = function() {
        this.fetchTests();
        this.runTest(this.tests.shift());
        return this;
      };

      Test.prototype.executeJasmine = function() {
        $(function() {
          var consoleReporter, jasmineEnv;
          jasmineEnv = jasmine.getEnv();
          jasmineEnv.updateInterval = 1000;
          consoleReporter = new jasmine.HtmlReporter();
          jasmineEnv.addReporter(consoleReporter);
          return jasmineEnv.execute();
        });
        return this;
      };

      return Test;

    })();
    return new Test().runTests();
  });

}).call(this);
