import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  User({
  required this.name, 
  required this.password,  
  required this.email,
  });

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? password;

  @HiveField(2)
  String? email;
}