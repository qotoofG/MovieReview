class Movie {
  final String imagePath;
  final String review;

  Movie({
    required this.imagePath,
    required this.review,
  });
}

class ImageAssets {
  static const List<String> trendingMovies = [
    'assets/movie1.png',
    'assets/movie2.png',
    'assets/movie3.png',
    'assets/movie4.png',
    'assets/movie5.png',
    'assets/movie6.png',
  ];
  static const List<String> topRatedMovies = [
    'assets/movie7.png',
    'assets/movie8.png',
    'assets/movie9.png',
    'assets/movie10.png',
    'assets/movie11.png',
    'assets/movie12.png',
  ];
  static const List<String> upcomingMovies = [
    'assets/movie13.png',
    'assets/movie14.png',
    'assets/movie15.png',
    'assets/movie16.png',
    'assets/movie17.png',
    'assets/movie18.png',
  ];
}
