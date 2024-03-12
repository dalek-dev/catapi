import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  String? name;
  @JsonKey(name: 'origin')
  String? countryOrigin;
  String? description;
  int? intelligence;
  int? adaptability;
  @JsonKey(name: 'life_span')
  String? lifeSpan;
  @JsonKey(name: 'reference_image_id')
  String? refenceImage;

  Cat(this.name, this.countryOrigin, this.description, this.intelligence,
      this.adaptability, this.lifeSpan, this.refenceImage);

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
}

@JsonSerializable()
class CatImage {
  String? id;
  String? url;
  CatImage(this.id, this.url);

  factory CatImage.fromJson(Map<String, dynamic> json) =>
      _$CatImageFromJson(json);

  CatImage.none()
      : id = '',
        url = '';
}

class CatDetails {
  String? name;
  String? description;
  String? countryOrigin;
  int? intelligence;
  int? adaptability;
  String? lifeSpan;
  String? image;
  CatDetails(this.name, this.description, this.countryOrigin, this.intelligence,
      this.adaptability, this.lifeSpan, this.image);
}
