// ignore_for_file: depend_on_referenced_packages

String generateChatRoomId({
  required String uId1,
  required String uId2,
}) {
  List<String> uIds = [uId1, uId2];
  uIds.sort();
  String chatId = uIds.join();
  return chatId;
}

String textToCamelCase({required String text}) {
  List splited = text.split(' ');
  List<String> capitalLetter = [];
  for (var x in splited) {
    capitalLetter.add(x[0].toUpperCase() + x.substring(1));
  }
  String join = capitalLetter.join(' ');
  return join;
}
