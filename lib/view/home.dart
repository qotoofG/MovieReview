import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_review/widget/trendingslider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> trendingMovies = [
      {
        'title': 'Mufasa: The Lion King',
        'image': 'assets/images/movie1.png',
        'synopsis': 'Told in flashbacks, Mufasa is an orphaned cub, lost and alone until he meets a sympathetic lion named Taka—the heir to a royal bloodline. The chance meeting sets in motion a journey of misfits searching for their destiny and working together to evade a threatening and deadly foe.',
        'imdbRating': 6.8,
      },
      {
        'title': 'Sonic the Hedgehog 3',
        'image': 'assets/images/movie2.png',
        'synopsis': 'Sonic, Knuckles, and Tails reunite against a powerful new adversary, Shadow, a mysterious villain with powers unlike anything they have faced before. With their abilities outmatched in every way, Team Sonic must seek out an unlikely alliance in hopes of stopping Shadow and protecting the planet.',
        'imdbRating': 7.4,
      },
      {
        'title': 'Gladiator II',
        'image': 'assets/images/movie3.png',
        'synopsis': 'Years after witnessing the death of the revered hero Maximus at the hands of his uncle, Lucius is forced to enter the Colosseum after his home is conquered by the tyrannical Emperors who now lead Rome with an iron fist. With rage in his heart and the future of the Empire at stake, Lucius must look to his past to find strengthand honor to return the glory of Rome to its people',
        'imdbRating': 6.8,
      },
      {
        'title': 'Doctor Who: The Legend of Ruby Sunday & Empire of Death',
        'image': 'assets/images/movie4.png',
        'synopsis': 'The Doctor and Ruby Sunday have faced the Bogeyman, fought against Maestro, and survived the battlefield of Kastarion 3. In the epic two-part season finale, The Doctor and Ruby arrive at UNIT headquarters on a top-secret mission and a long-buried secret awaits…',
        'imdbRating': 8.4,
      },
      {
        'title': 'Your Fault ',
        'image': 'assets/images/movie5.png',
        'synopsis': 'The love between Noah and Nick seems unwavering despite their parents attempts to separate them. But his job and her entry into college open up their lives to new relationships that will shake the foundations of both their relationship and the Leister family itself.',
        'imdbRating': 5.5,
      },
       {
        'title': 'Squid Game',
        'image': 'assets/images/movie6.png',
        'synopsis': 'Hundreds of cash-strapped players accept a strange invitation to compete in childrens games. Inside, a tempting prize awaits with deadly high stakes: a survival game that has a whopping 45.6 billion-won prize at stake.',
        'imdbRating': 8.0,
      },
    ];

    final List<Map<String, dynamic>> topRatedMovies = [
     
      {
        'title': 'Red One',
        'image': 'assets/images/movie7.png',
        'synopsis': 'After Santa Claus (codename: Red One) is kidnapped, the North Poles Head of Security must team up with the worlds most infamous tracker in a globe-trotting, action-packed mission to save Christmas.',
        'imdbRating': 6.4,
      },
      {
        'title': 'Moana 2',
        'image': 'assets/images/movie8.png',
        'synopsis': 'After receiving an unexpected call from her wayfinding ancestors, Moana must journey to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything shes ever faced',
        'imdbRating': 7.0,
      },
      {
        'title': 'Deadpool & Wolverine',
        'image': 'assets/images/movie9.png',
        'synopsis': 'Deadpool is offered a place in the Marvel Cinematic Universe by the Time Variance Authority, but instead recruits a variant of Wolverine to save his universe from extinction.',
        'imdbRating': 7.6,
      },
      {
        'title': 'The Wild Robot',
        'image': 'assets/images/movie10.png',
        'synopsis': 'After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the islands animals and cares for an orphaned baby goose.',
        'imdbRating': 8.2,
      },
        {
        'title': 'Carry-On',
        'image': 'assets/images/movie11.png',
        'synopsis': 'A mysterious traveler blackmails a young TSA agent into letting a dangerous package slip through security and onto a Christmas Eve flight.',
        'imdbRating': 6.5, // Placeholder
      },
      {
        'title': 'Wicked',
        'image': 'assets/images/movie12.png',
        'synopsis': 'Elphaba, a misunderstood young woman because of her green skin, and Galinda, a popular girl, become friends at Shiz University in the Land of Oz. After an encounter with the Wonderful Wizard of Oz, their friendship reaches a crossroads.',
        'imdbRating': 8.0,
      },
    ];

    final List<Map<String, dynamic>> upcomingMovies = [
      {
        'title': 'Squid Game: The Challenge',
        'image': 'assets/images/movie13.png',
        'synopsis': 'Follows contestants as they compete in challenges based on the Korean childrens games featured on the Squid Game to win a 4.56 million cash prize.',
        'imdbRating': 5.8, // Placeholder
      },
      {
        'title': 'What If?',
        'image': 'assets/images/movie14.png',
        'synopsis': 'Taking inspiration from the comic books of the same name, each episode of this animated anthology series questions, revisits and twists classic Marvel Cinematic moments.',
        'imdbRating': 7.4,
      },
      {
        'title': 'The Lord of the Rings: The War of the Rohirrim',
        'image': 'assets/images/movie15.png',
        'synopsis': 'A sudden attack by Wulf, a clever and traitorous lord of Rohan seeking vengeance for the death of his father, forces Helm Hammerhand, the King of Rohan, and his people to make a daring last stand in the ancient stronghold of the Hornburg.',
        'imdbRating': 6.5,
      },
       {
        'title': 'Nosferatu',
        'image': 'assets/images/movie16.png',
        'synopsis': 'A gothic tale of obsession between a haunted young woman and the terrifying vampire infatuated with her, causing untold horror in its wake.',
        'imdbRating': 7.9,
      
      },
       {
        'title': 'Silo',
        'image': 'assets/images/movie17.png',
        'synopsis': 'Men and women live in a giant silo underground with several regulations which they believe are in place to protect them from the toxic and ruined world on the surface.',
        'imdbRating': 8.1, // Placeholder
      },
       {
        'title': 'The Order',
        'image': 'assets/images/movie18.png',
        'synopsis': 'A series of bank robberies and car heists frightened communities in the Pacific Northwest. A lone FBI agent believes that the crimes were not the work of financially motivated criminals, but rather a group of dangerous domestic terrorists.',
        'imdbRating': 7.0, // Placeholder
      },
    ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/movieflix.png',
          fit: BoxFit.cover,
          height: 120,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trending Movies Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 30,color: const Color.fromARGB(255, 195, 193, 193),fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TrendingSlider(movies: trendingMovies),

            const SizedBox(height: 20),

            // Top Rated Movies Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(fontSize: 30,color: const Color.fromARGB(255, 195, 193, 193),fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TrendingSlider(movies: topRatedMovies),

            const SizedBox(height: 20),

            // Upcoming Movies Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee(fontSize: 30,color: const Color.fromARGB(255, 195, 193, 193),fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TrendingSlider(movies: upcomingMovies),
          ],
        ),
      ),
    ),
    );
  }
}