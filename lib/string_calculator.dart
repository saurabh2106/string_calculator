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

  final sum = inputList.map(int.parse).reduce((a, b) => a + b);
  return sum;
}
