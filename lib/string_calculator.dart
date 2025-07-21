int calculate([String? input]) {
  if (input?.isEmpty ?? true) {
    return 0;
  }

  List<String> inputList = input!.split(',').toList();

  if ((inputList.length) == 1) {
    return 1;
  } else {
    final sum = inputList
        .map(int.parse)
        .reduce((value, element) => value + element);
    return sum;
  }
}
