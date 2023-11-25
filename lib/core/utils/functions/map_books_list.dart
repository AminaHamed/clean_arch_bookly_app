import '../../../features/home/data/models/book_model/book_model.dart';
import '../../../features/home/domain/entities/book_entity.dart';

List<BookEntity> mapBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookItem in data['items']) {
    books.add(BookModel.fromJson(bookItem));
  }
  return books;
}
