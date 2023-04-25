import 'dart:math';

String generateTicketId() {
  const String prefix = 'G';
  final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  final String random = Random().nextInt(999999).toString().padLeft(6, '0');
  const String alphaNumeric =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final String randomAlphaNumeric = String.fromCharCodes(Iterable.generate(8,
      (_) => alphaNumeric.codeUnitAt(Random().nextInt(alphaNumeric.length))));
  return '$prefix$timestamp$random$randomAlphaNumeric';
}
