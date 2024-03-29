import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/movie/test', '');
  }
  return File('$dir/test/$name').readAsStringSync();
}
