int calculate([String? input]) {
  if (input?.isEmpty ?? true) {
    return 0;
  }

  input!.split(',').toList();

  if ((input.length) == 1) {
    return 1;
  }

  return 6 * 7;
}
