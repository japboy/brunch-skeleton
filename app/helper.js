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
