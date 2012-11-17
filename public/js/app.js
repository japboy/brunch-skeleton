(function(/*! Brunch !*/) {
  'use strict';

  var globals = typeof window !== 'undefined' ? window : global;
  if (typeof globals.require === 'function') return;

  var modules = {};
  var cache = {};

  var has = function(object, name) {
    return ({}).hasOwnProperty.call(object, name);
  };

  var expand = function(root, name) {
    var results = [], parts, part;
    if (/^\.\.?(\/|$)/.test(name)) {
      parts = [root, name].join('/').split('/');
    } else {
      parts = name.split('/');
    }
    for (var i = 0, length = parts.length; i < length; i++) {
      part = parts[i];
      if (part === '..') {
        results.pop();
      } else if (part !== '.' && part !== '') {
        results.push(part);
      }
    }
    return results.join('/');
  };

  var dirname = function(path) {
    return path.split('/').slice(0, -1).join('/');
  };

  var localRequire = function(path) {
    return function(name) {
      var dir = dirname(path);
      var absolute = expand(dir, name);
      return globals.require(absolute);
    };
  };

  var initModule = function(name, definition) {
    var module = {id: name, exports: {}};
    definition(module.exports, localRequire(name), module);
    var exports = cache[name] = module.exports;
    return exports;
  };

  var require = function(name) {
    var path = expand(name, '.');

    if (has(cache, path)) return cache[path];
    if (has(modules, path)) return initModule(path, modules[path]);

    var dirIndex = expand(path, './index');
    if (has(cache, dirIndex)) return cache[dirIndex];
    if (has(modules, dirIndex)) return initModule(dirIndex, modules[dirIndex]);

    throw new Error('Cannot find module "' + name + '"');
  };

  var define = function(bundle) {
    for (var key in bundle) {
      if (has(bundle, key)) {
        modules[key] = bundle[key];
      }
    }
  }

  globals.require = require;
  globals.require.define = define;
  globals.require.brunch = true;
})();

window.require.define({"main": function(exports, require, module) {
  /**
  # Main script
  # @project backbone-skeleton
  # @title main
  */

  var helper, template;

  helper = require('helper');

  template = require('template');

  jQuery(function($) {
    var $p, main, values;
    values = {
      description: 'My starting point of working with bare Brunch.'
    };
    $('#main').append($(template())).masonry({
      itemSelector: '.item',
      columnWidth: 10,
      isAnimated: true
    });
    $p = $('<p/>');
    $p.append('Hello, I am the main script!');
    main = function() {
      return $('#special').append($p);
    };
    return setTimeout(function() {
      main();
      return setTimeout(function() {
        return helper();
      }, 2000);
    }, 2000);
  });
  
}});

window.require.define({"template": function(exports, require, module) {
  module.exports = function anonymous(locals, attrs, escape, rethrow, merge) {
  attrs = attrs || jade.attrs; escape = escape || jade.escape; rethrow = rethrow || jade.rethrow; merge = merge || jade.merge;
  var buf = [];
  with (locals || {}) {
  var interp;
  buf.push('<section class="item"><h1>Hello, I am Jade.</h1></section><section class="item"><p>My starting point of working with bare Brunch.</p></section><section id="special" class="item"></section>');
  }
  return buf.join("");
  };
}});

window.require.define({"helper": function(exports, require, module) {
  /**
   * Helper script
   * @project backbone-skeleton
   * @title helper
   */

  helper = function () {
    $(function () {
      var $p = $('<p/>');
      $p.append('Hello, I am a helper script :D');
      $('#special').append($p);
    });
  };

  module.exports = helper
  
}});

