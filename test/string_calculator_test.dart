import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('returns 0 on empty string', () {
    expect(calculate(''), 0);
  });

  test('returns number when only one number is given', () {
    expect(calculate('1'), 1);
  });

  test('returns sum when two comma separated numbers are given', () {
    expect(calculate("1,2"), 3);
  });

  test('handles new lines between numbers', () {
    expect(calculate("1\n2,3"), 6);
  });

  test('supports custom delimiter ;', () {
    expect(calculate("//;\n1;2"), 3);
  });
}
