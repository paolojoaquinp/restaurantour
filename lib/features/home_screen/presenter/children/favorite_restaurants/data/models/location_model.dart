import 'package:restaurant_tour/features/home_screen/presenter/children/favorite_restaurants/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({required super.formattedAddress});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      formattedAddress: json['formatted_address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'formatted_address': formattedAddress,
    };
  }
}
