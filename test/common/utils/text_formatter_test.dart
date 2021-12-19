import 'package:app/common/utils/text_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Capitalization function work correctly', () {
    var _expected = 'Thailand';
    var _data = 'thailand';
    var _actual = TextFormatter.capitalizeFirstChar(word: _data);
    expect(_actual, _expected);
  });

  test('Capitalization do nothing when the first char is number', () {
    var _expected = '0765623942';
    var _data = '0765623942';
    var _actual = TextFormatter.capitalizeFirstChar(word: _data);
    expect(_actual, _expected);
  });

  test('Capitalization do nothing when the first char is not English', () {
    var _expected = 'ประเทศไทย';
    var _data = 'ประเทศไทย';
    var _actual = TextFormatter.capitalizeFirstChar(word: _data);
    expect(_actual, _expected);
  });
}
