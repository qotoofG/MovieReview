// ignore: file_names
import 'package:flutter/material.dart';
import 'package:movie_review/model/box.dart';
import 'package:movie_review/model/review.dart';

class ReviewPage extends StatefulWidget {
  final String movieTitle;
  final String movieImage;
  const ReviewPage({
    super.key,
    required this.movieTitle,
    required this.movieImage,
    });

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();
  String? _selectedRating;

  
 void _submitReview() {
  if (_formKey.currentState!.validate()) {
    String reviewText = _reviewController.text;
    String rating = _selectedRating ?? 'No Rating';

    // Check if the review already exists
    Review? review = BoxReview.get(widget.movieTitle);
    if (review == null) {
      // If the review doesn't exist, create and save it
      review = Review(
        movietitle: widget.movieTitle,
        movieimg: widget.movieImage,
        myreview: reviewText,
        rating: rating,
      );
    } else {
      // If the review exists, update its fields
      review.myreview = reviewText;
      review.rating = rating;
    }
    // Save or update the review in the box
    BoxReview.put(widget.movieTitle, review);
    _reviewController.clear();
    setState(() {
      _selectedRating = null;
    });
  }
}
  void addToFaviort() {
  // Retrieve the review from the box
  Review? review = BoxReview.get(widget.movieTitle);
  // ignore: prefer_conditional_assignment
  if (review == null) {
    review = Review(
      movietitle: widget.movieTitle,
      movieimg: widget.movieImage,
      myreview: _reviewController.text.isNotEmpty ? _reviewController.text : 'No review yet',
      rating: _selectedRating ?? 'No Rating',
    );
  }
  review.favorite = !(review.favorite ?? false);
  // Save or update the review in the box
  BoxReview.put(widget.movieTitle, review);
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Review',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 195, 193, 193)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(color:Color.fromARGB(255, 188, 186, 186),),
                controller: _reviewController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Write your review here...',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 188, 186, 186),),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text(
                'Rating',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 188, 186, 186),),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                iconEnabledColor: const Color.fromARGB(255, 195, 193, 193),
                focusColor:const Color.fromARGB(255, 195, 193, 193),
                dropdownColor:const Color.fromARGB(255, 195, 193, 193),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 195, 193, 193),)
                  ),
                ),
                value: _selectedRating,
                hint: const Text('Select a rating',style: TextStyle(color: Color.fromARGB(255, 195, 193, 193)),),
                items: List.generate(5, (index) => (index + 1).toString())
                    .map((rating) => DropdownMenuItem<String>(
                          value: rating,
                          child: Text('$rating Stars',style: const TextStyle(color: Color.fromARGB(255, 201, 38, 26)),),
                           ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRating = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a rating';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add to Faviorts',
                    style: TextStyle(
                      color:  Color.fromARGB(255, 193, 194, 195),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      addToFaviort();
                    }, 
                    icon: Icon(
                      BoxReview.get(widget.movieTitle)?.favorite == true 
                      ?  Icons.favorite : Icons.favorite_border_outlined,
                      color:BoxReview.get(widget.movieTitle)?.favorite == true 
                       ?const Color.fromARGB(255, 201, 38, 26) : const Color.fromARGB(255, 195, 193, 193),
                      size: 30,
                    )
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    _submitReview();
                    Navigator.pop(context);
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
                    'Submit Review',
                    style: TextStyle(color:Colors.white,fontSize: 17),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}