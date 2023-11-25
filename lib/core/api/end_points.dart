abstract class EndPoints {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String freeProgramingBooks =
      '${baseUrl}volumes?Filtering=free-ebooks&q=programing&startIndex=';
  static const String newestProgramingBooks =
      '${baseUrl}volumes?Filtering=free-ebooks&q=programing&Sorting=newest&startIndex=100';
  static const String search =
      '${baseUrl}volumes?Filtering=partial&Sorting=newest&q=';
// "https://www.googleapis.com/books/v1/volumes?Filtering=partial&Sorting=newest&q=cooking"
}
