int calculate([String? input]) {
  if ((input?.isEmpty ?? true)) {
    return 0;
  }
  List<String> delimiters = [',', '\n'];
  String delimiter = ',';
  String newString = input!;

  if (input.startsWith('//')) {
    final delimeterEnd = newString.indexOf('\n');
    final inputParts = input.split('\n');
    delimiter = inputParts[0].substring(2, delimeterEnd);
    newString = inputParts[1];
  }

  if (delimiter.startsWith('[')) {
    final regex = RegExp(r'\[(.*?)\]');
    delimiters.addAll(regex.allMatches(delimiter).map((e) => e.group(1)!));
  } else {
    delimiters.add(delimiter);
  }

  for (var d in delimiters) {
    newString = newString.replaceAll(d, ',');
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
