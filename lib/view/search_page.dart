import 'package:flutter/material.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> allMovies = [
    {
      'title': 'Gladiator',
      'genre': 'Action',
      'year': '2000',
    },
    {
      'title': 'Sonic 3',
      'genre': 'Action',
      'year': '2024',
    },
    {
      'title': 'Mufasa',
      'genre': 'Adventure',
      'year': '2024',
    },
    
     {
      'title': 'Doctor Who',
      'genre': 'Drama',
      'year': '1963',
    },
     {
      'title': 'Your Fault',
      'genre': 'Romance',
      'year': '2024',
    },
     {
      'title': 'Squid Game',
      'genre': 'Thriller',
      'year': '2021',
    },
     {
      'title': 'Red One',
      'genre': 'Action',
      'year': '2024',
    },
    
     {
      'title': 'Moana 2',
      'genre': 'Family',
      'year': '2024',
    },
    
     {
      'title': 'Deadpool & Wolverine',
      'genre': 'action/comedy',
      'year': '2024',
    },
    
     {
      'title': 'The Wild Robot',
      'genre': 'Family/Adventure',
      'year': '2024',
    },
     {
      'title': 'Carry-On',
      'genre': 'Thriller',
      'year': '2024',
    },
    
     {
      'title': 'Wicked',
      'genre': 'Musical/Fantasy',
      'year': '2024',
    },
    
    
     {
      'title': 'Squid Game:The Challenge',
      'genre': 'Reality Competition',
      'year': '2023',
    },
    
    
     {
      'title': 'One Final Watch',
      'genre': 'Adventure',
      'year': '2024',
    },
    
     {
      'title': 'The Lord of the Rings: The War of the Rohirrim',
      'genre': 'Fantasy/War',
      'year': '2024',
    },
    
     {
      'title': 'Nosferatu',
      'genre': 'Horror/Drama',
      'year': '2024',
    },
    
      {
      'title': 'Silo',
      'genre': 'Drama',
      'year': '2023',
    },
      {
      'title': 'The Order',
      'genre': 'Drama',
      'year': '2019',
    },];

  List<Map<String, String>> filteredMovies = [];

  @override
  void initState() {
    super.initState();
    filteredMovies = allMovies; 
    searchController.addListener(_filterMovies);
  }

  void _filterMovies() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredMovies = allMovies.where((movie) {
        final title = movie['title']!.toLowerCase();
        final genre = movie['genre']!.toLowerCase();
        //final year = movie['year']!.toLowerCase();
        return title.contains(query) || genre.contains(query) ;//||                //year.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
        title: const Text(
          'Search Movies',
          style: TextStyle(
                    color: Color.fromARGB(255, 188, 186, 186),
                    fontSize: 35
                  ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              // Search bar
              TextField(
                style: const TextStyle(color:Color.fromARGB(255, 188, 186, 186),),
                controller: searchController,
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Color.fromARGB(255, 188, 186, 186),
                  labelText: 'Search for movies...',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 188, 186, 186),
                    fontSize: 20
                  ),
                  hintText: 'Search by title, genre, or year',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 188, 186, 186),
                  ),
                  prefixIcon: const Icon(Icons.search,color: Color.fromARGB(255, 201, 38, 26),),
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 195, 193, 193),),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromARGB(255, 195, 193, 193),),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
      
              if (filteredMovies.isEmpty)
                const Expanded(
                  child:  Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = filteredMovies[index];
                      return Card(
                        color: Colors.black54,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(
                            movie['title']!,
                            style: const TextStyle(color: Color.fromARGB(255, 188, 186, 186), fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${movie['genre']} - ${movie['year']}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: const Color.fromARGB(255, 188, 186, 186),
                                  title: Text(
                                    movie['title']!,
                                    style: const TextStyle( fontWeight: FontWeight.bold),
                                  ),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Genre: ${movie['genre']}',
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Year: ${movie['year']}',
                                      ),
                                      const SizedBox(height: 20),
                                      
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); 
                                      },
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 201, 38, 26),
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}