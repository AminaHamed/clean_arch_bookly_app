import 'package:clean_arch_bookly_app/core/api/api_service.dart';
import 'package:clean_arch_bookly_app/core/api/end_points.dart';
import 'package:clean_arch_bookly_app/core/utils/constants.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

import '../../../../core/utils/functions/cache_data.dart';
import '../../../../core/utils/functions/map_books_list.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceDioImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceDioImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    Map<String, dynamic> data = await apiService.get(
        endPoint: "${EndPoints.freeProgramingBooks}${pageNumber * 10}");
    List<BookEntity> books = mapBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    Map<String, dynamic> data =
        await apiService.get(endPoint: EndPoints.newestProgramingBooks);
    List<BookEntity> books = mapBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }
}
