import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review/view/Reviewpage.dart';


class MovieDetailPage extends StatelessWidget {
  final String movieTitle;
  final String movieImage;
  final String synopsis;
  final double imdbRating;

  const MovieDetailPage({
    super.key,
    required this.movieTitle,
    required this.movieImage,
    required this.synopsis,
    required this.imdbRating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text(
          movieTitle,
          style: GoogleFonts.aBeeZee(fontSize: 24,color: const Color.fromARGB(255, 195, 193, 193),fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            // Movie Poster
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  movieImage,
                  height: 300,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            const SizedBox(height:20),

            // IMDb Rating Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Color.fromRGBO(255, 193, 7, 1)),
                  const SizedBox(width: 4),
                  Text(
                    'IMDb: $imdbRating',
                    style: GoogleFonts.aBeeZee(fontSize: 18,color: const Color.fromARGB(255, 195, 193, 193)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Synopsis
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Overview',
                style: GoogleFonts.aBeeZee(fontSize: 22,color: const Color.fromARGB(255, 195, 193, 193),fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                synopsis,
                style: GoogleFonts.aBeeZee(fontSize: 16,color: const Color.fromARGB(255, 195, 193, 193)),
              ),
            ),
             // Write a Review Button
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Center(
              child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ReviewPage(movieTitle:movieTitle,movieImage: movieImage)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 201, 38, 26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      padding: const EdgeInsets.only(left: 40,right: 40,top: 13,bottom: 13),
                      elevation: 5,
                    ),  
                    child: const Text(
                      'Rate & Review',
                      style: TextStyle(color:Colors.white,fontSize: 17),
                    )
                  ),
            )
          ],
        ),
      ),
    );
  }
}