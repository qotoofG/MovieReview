import 'package:flutter/material.dart';
import 'package:movie_review/view/detailspage.dart';

class TrendingSlider extends StatelessWidget {

  final List<Map<String, dynamic>> movies;

  const TrendingSlider({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the Movie Detail Page with custom data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    movieTitle: movie['title'],
                    movieImage: movie['image'],
                    synopsis: movie['synopsis'],
                    imdbRating: movie['imdbRating'],
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(35, 39, 46, 1), 
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  movie['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}