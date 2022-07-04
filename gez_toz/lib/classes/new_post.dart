import 'package:gez_toz/classes/Expanse.dart';
import 'package:gez_toz/classes/accommodation.dart';
import 'package:gez_toz/classes/food.dart';
import 'package:gez_toz/classes/transportation.dart';
import 'package:image_picker/image_picker.dart';

class NewPost{
  String headline;
  String? experience;
  List<XFile>? imageFiles;
  List<Expanse>? expanses;
  List<Transportation>? transports;
  List<Accommodation>? accommodations;
  List<Food>? food;
  List<String>? tags;

  NewPost({
    required this.headline, this.experience,
    this.imageFiles, this.expanses, this.transports,
    this.accommodations, this.food, this.tags
  });
}