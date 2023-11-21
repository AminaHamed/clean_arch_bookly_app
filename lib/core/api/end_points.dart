abstract class EndPoints {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String freeProgramingBooks =
      '${baseUrl}volumes?Filtering=free-ebooks&q=programing';
  static const String newestProgramingBooks =
      '${baseUrl}volumes?Filtering=free-ebooks&q=programing&Sorting=newest';
}
