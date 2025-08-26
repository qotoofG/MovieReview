import 'package:hive/hive.dart';

part 'review.g.dart';

@HiveType(typeId: 1)
class Review {
  Review({
  required this.movietitle,
  required this.movieimg,
  required this.myreview, 
  required this.rating,  
  });

  @HiveField(0)
  String? movietitle;

  @HiveField(1)
  String? movieimg;

  @HiveField(2)
  String? myreview;

  @HiveField(3)
  String? rating;

  @HiveField(4)
  bool? favorite=false;

  @override
  String toString() {
    return 'Review{movietitle: $movietitle, movieimg: $movieimg, myreview: $myreview, rating: $rating,favorite:$favorite}';
  }

}