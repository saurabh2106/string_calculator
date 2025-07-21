int calculate([String? input]) {
  if ((input?.isEmpty ?? true)) {
    return 0;
  }

  String delimiter = ',';
  String newString = input!;

  if (input.startsWith('//')) {
    final inputParts = input.split('\n');
    delimiter = inputParts[0].substring(2);
    newString = inputParts[1];
  }

  final handleNewLines = newString
      .replaceAll('\n', ',')
      .replaceAll(delimiter, ',');

  final inputList = handleNewLines.split(',');
  final List<int> inputIntList = inputList
      .map(int.parse)
      .where((e) => e <= 1000)
      .toList();

  final negativeValues = inputIntList.where((e) => e < 0);
  if (negativeValues.isNotEmpty) {
    throw FormatException(
      "negative numbers not allowed: ${negativeValues.join(',')}",
    );
  }

  final sum = inputIntList.reduce((a, b) => a + b);
  return sum;
}
