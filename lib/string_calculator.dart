int calculate([String? input]) {
  if (input == null || input.isEmpty) return 0;

  List<String> delimiters = [',', '\n'];
  String numbers = input;

  // Handle custom delimiter section
  if (input.startsWith('//')) {
    final delimiterSectionEnd = input.indexOf('\n');
    final delimiterPart = input.substring(2, delimiterSectionEnd);
    numbers = input.substring(delimiterSectionEnd + 1);

    final delimiterRegex = RegExp(r'\[(.*?)\]');
    final matches = delimiterRegex.allMatches(delimiterPart);

    if (matches.isNotEmpty) {
      delimiters.addAll(matches.map((m) => m.group(1)!));
    } else {
      delimiters.add(delimiterPart);
    }
  }

  for (final d in delimiters) {
    numbers = numbers.replaceAll(d, ',');
  }

  final parts = numbers.split(',');
  final intList = parts.map(int.parse).where((n) => n <= 1000).toList();

  final negatives = intList.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw FormatException(
      'negative numbers not allowed: ${negatives.join(',')}',
    );
  }

  return intList.fold(0, (sum, val) => sum + val);
}
