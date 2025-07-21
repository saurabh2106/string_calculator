import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('returns 0 on empty string', () {
    expect(calculate(''), 0);
  });
}
