import 'package:clean_arch_bookly_app/core/api/api_service.dart';
import 'package:clean_arch_bookly_app/core/api/end_points.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

import '../../../../core/utils/functions/map_books_list.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> search(String keyWord);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> search(String keyWord) async {
    Map<String, dynamic> data =
        await apiService.get(endPoint: "${EndPoints.search}$keyWord");
    List<BookEntity> books = mapBooksList(data);
    return books;
  }
}
