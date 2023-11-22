import 'package:hive/hive.dart';

import '../../../features/home/domain/entities/book_entity.dart';

List<BookEntity> getBoxData({required int pageNumber, required boxName}) {
  int startIndex = pageNumber * 10;
  int endIndex = (pageNumber + 1) * 10;
  var box = Hive.box<BookEntity>(boxName);
  List<BookEntity> allBooks = box.values.toList();
  int length = allBooks.length;
  if (startIndex >= length || endIndex > length) {
    return [];
  }
  return allBooks.sublist(startIndex, endIndex);
}
