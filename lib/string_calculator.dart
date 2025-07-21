int calculate([String? input]) {
  if (input?.isEmpty ?? true) {
    return 0;
  }

  final handleNewLines = input!.replaceAll('\n', ',');
  List<String> inputList = handleNewLines.split(',').toList();

  if ((inputList.length) == 1) {
    return 1;
  } else {
    final sum = inputList
        .map(int.parse)
        .reduce((value, element) => value + element);
    return sum;
  }
}
