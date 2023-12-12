import 'package:book_my_turf_dashboard/generated/json/base/json_convert_content.dart';
import 'package:book_my_turf_dashboard/model/venue_entity.dart';

VenueEntity $VenueEntityFromJson(Map<String, dynamic> json) {
  final VenueEntity venueEntity = VenueEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    venueEntity.id = id;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    venueEntity.createdAt = createdAt;
  }
  final String? venueName = jsonConvert.convert<String>(json['venue_name']);
  if (venueName != null) {
    venueEntity.venueName = venueName;
  }
  final String? venueLocation = jsonConvert.convert<String>(json['venue_location']);
  if (venueLocation != null) {
    venueEntity.venueLocation = venueLocation;
  }
  final int? phone = jsonConvert.convert<int>(json['phone']);
  if (phone != null) {
    venueEntity.phone = phone;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    venueEntity.email = email;
  }
  final String? website = jsonConvert.convert<String>(json['website']);
  if (website != null) {
    venueEntity.website = website;
  }
  final List<VenueAmenities>? amenities = (json['amenities'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<VenueAmenities>(e) as VenueAmenities).toList();
  if (amenities != null) {
    venueEntity.amenities = amenities;
  }
  final List<String>? images = (json['images'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (images != null) {
    venueEntity.images = images;
  }
  final String? ownerId = jsonConvert.convert<String>(json['owner_id']);
  if (ownerId != null) {
    venueEntity.ownerId = ownerId;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    venueEntity.country = country;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    venueEntity.state = state;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    venueEntity.city = city;
  }
  final int? cityId = jsonConvert.convert<int>(json['city_id']);
  if (cityId != null) {
    venueEntity.cityId = cityId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    venueEntity.status = status;
  }
  final double? latitude = jsonConvert.convert<double>(json['latitude']);
  if (latitude != null) {
    venueEntity.latitude = latitude;
  }
  final double? longitude = jsonConvert.convert<double>(json['longitude']);
  if (longitude != null) {
    venueEntity.longitude = longitude;
  }
  final String? venueDescription = jsonConvert.convert<String>(json['venue_description']);
  if (venueDescription != null) {
    venueEntity.venueDescription = venueDescription;
  }
  return venueEntity;
}

Map<String, dynamic> $VenueEntityToJson(VenueEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['created_at'] = entity.createdAt;
  data['venue_name'] = entity.venueName;
  data['venue_location'] = entity.venueLocation;
  data['phone'] = entity.phone;
  data['email'] = entity.email;
  data['website'] = entity.website;
  data['amenities'] = entity.amenities?.map((v) => v.toJson()).toList();
  data['images'] = entity.images;
  data['owner_id'] = entity.ownerId;
  data['country'] = entity.country;
  data['state'] = entity.state;
  data['city'] = entity.city;
  data['city_id'] = entity.cityId;
  data['status'] = entity.status;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['venue_description'] = entity.venueDescription;
  return data;
}

extension VenueEntityExtension on VenueEntity {
  VenueEntity copyWith({
    String? id,
    String? createdAt,
    String? venueName,
    String? venueLocation,
    int? phone,
    String? email,
    String? website,
    List<VenueAmenities>? amenities,
    List<String>? images,
    String? ownerId,
    String? country,
    String? state,
    String? city,
    int? cityId,
    String? status,
    double? latitude,
    double? longitude,
    String? venueDescription,
  }) {
    return VenueEntity()
      ..id = id ?? this.id
      ..createdAt = createdAt ?? this.createdAt
      ..venueName = venueName ?? this.venueName
      ..venueLocation = venueLocation ?? this.venueLocation
      ..phone = phone ?? this.phone
      ..email = email ?? this.email
      ..website = website ?? this.website
      ..amenities = amenities ?? this.amenities
      ..images = images ?? this.images
      ..ownerId = ownerId ?? this.ownerId
      ..country = country ?? this.country
      ..state = state ?? this.state
      ..city = city ?? this.city
      ..cityId = cityId ?? this.cityId
      ..status = status ?? this.status
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude
      ..venueDescription = venueDescription ?? this.venueDescription;
  }
}

VenueAmenities $VenueAmenitiesFromJson(Map<String, dynamic> json) {
  final VenueAmenities venueAmenities = VenueAmenities();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    venueAmenities.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    venueAmenities.name = name;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    venueAmenities.image = image;
  }
  return venueAmenities;
}

Map<String, dynamic> $VenueAmenitiesToJson(VenueAmenities entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['image'] = entity.image;
  return data;
}

extension VenueAmenitiesExtension on VenueAmenities {
  VenueAmenities copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return VenueAmenities()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..image = image ?? this.image;
  }
}