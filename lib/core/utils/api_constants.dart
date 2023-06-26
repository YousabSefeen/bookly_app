class ApiConstants {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  static const String allBooks = 'volumes?q=Programming';
  static const String freeBooks =
      'volumes?Filtering-free-ebooks&Sorting=newest &q=subject:Programming';
}
