###*
# Brunch configuration
# @url http://brunch.readthedocs.org/en/latest/config.html
###


exports.config =

  ###*
  # @attribute paths
  # @url http://brunch.readthedocs.org/en/latest/config.html#paths
  ###
  paths:

    ###*
    # @attribute public
    # @required
    # @type {String} Path to build directory that would contain output
    ###
    public: 'public'

    ###*
    # @attribute test
    # @required
    # @type {String} Path to test files
    ###
    test: 'test'

    ###*
    # @attribute app
    # @optional
    # @default 'app'
    # @type {String}
    ###
    app: 'app'

    ###*
    # @attribute vendor
    # @optional
    # @default 'vendor'
    # @type {String}
    ###
    vendor: 'vendor'

    ###*
    # @attribute root
    # @optional
    # @default ''
    # @type {String}
    ###
    root: './'


  ###*
  # @attribute files
  # @url http://brunch.readthedocs.org/en/latest/config.html#files
  ###
  files:

    ###*
    # @attribute javascripts
    ###
    javascripts:

      ###*
      # @attribute joinTo
      # @required
      # @type {String|Hash}
      ###
      joinTo:
        'js/app.js': /^app/
        'js/vendor.js': /^vendor\/js/
        'test/test.js': /^test/

      ###*
      # @attribute order
      # @optional
      ###
      order:

        ###*
        # @attribute before
        # @optional
        # @type {Array}
        ###
        before: [
          'vendor/js/console-helper.js'
          'vendor/js/jquery.masonry-2.1.05.js'
        ]

        ###*
        # @attribute after
        # @optional
        # @type {Array}
        ###
        after: [
          'app/helper.js'
        ]


    ###*
    # @attribute stylesheets
    ###
    stylesheets:
      joinTo: 'css/app.css'
      order:
        before: [
          'vendor/css/normalize-2.0.1.css'
        ]
        after: [
          'app/helper.scss'
        ]


    ###*
    # @attribute templates
    ###
    templates:
      joinTo:
        'js/app.js': /^app/


  ###*
  # @attribute conventions
  # @url http://brunch.readthedocs.org/en/latest/config.html#conventions
  ###
  conventions:

    ###*
    # @attribute ignored
    # @optional
    # @default Function that ignores files starting with underscore
    # @type {RegExp|Function}
    ###
    ignored: (path) ->
      sysPath = require 'path'
      startsWith = (string, substring) ->
        string.lastIndexOf(substring, 0) is 0
      startsWith sysPath.basename(path), '_'

    ###*
    # @attribute assets
    # @optional
    # @default /assets(\/|\\)/
    # @type {RegExp|Function}
    ###
    assets: /assets(\/|\\)/

    ###*
    # @attribute vendor
    # @optional
    # @default /vendor(\/|\\)/
    # @type {RegExp|Function}
    ###
    vendor: /vendor(\/|\\)/

    ###*
    # @attribute tests
    # @optional
    # @default /_test\.\w+$/
    # @type {RegExp|Function}
    ###
    tests: /_test\.\w+$/


  ###*
  # @attribute modules
  # @url http://brunch.readthedocs.org/en/latest/config.html#modules
  ###
  modules:

    ###*
    # @attribute wrapper
    # @optional
    # @default 'commonjs'
    # @type {String|Boolean|Function}
    ###
    wrapper: 'commonjs'  # 'amd' is also available

    ###*
    # @attribute definition
    # @optional
    # @default 'commonjs'
    # @type {String|Boolean|Function}
    ###
    definition: 'commonjs'


  ###*
  # @attribute notifications
  # @optional
  # @default true
  # @type {Boolean}
  # @url http://brunch.readthedocs.org/en/latest/config.html#notifications
  ###
  notifications: true


  ###*
  # @attribute optimize
  # @optional
  # @default false
  # @type {Boolean}
  # @url http://brunch.readthedocs.org/en/latest/config.html#optimize
  ###
  optimize: false


  ###*
  # @attribute server
  # @url http://brunch.readthedocs.org/en/latest/config.html#server
  ###
  server:

    ###*
    # @attribute path
    # @optional
    # @default
    # @type {String}
    ###
    #path: 'server.coffee'

    ###*
    # @attribute port
    # @optional
    # @type {Integer}
    ###
    #port: 6832

    ###*
    # @attribute base
    # @optional
    # @type {String}
    ###
    base: '/'

    ###*
    # @attribute run
    # @optional
    # @default false
    # @type {Booleano}
    ###
    run: false
