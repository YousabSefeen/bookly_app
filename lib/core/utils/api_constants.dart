class ApiConstants {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  static const String computerBooks = 'volumes?q=computer science';
  static const String programmingBooks =
      'volumes?Filtering-free-ebooks&q=programming';

  static String getSimilar(String category) =>
      'volumes?Sorting=relevance &q=subject:$category';
}
