import 'package:book_my_turf_dashboard/generated/json/base/json_field.dart';
import 'package:book_my_turf_dashboard/generated/json/venue_entity.g.dart';
import 'dart:convert';
export 'package:book_my_turf_dashboard/generated/json/venue_entity.g.dart';

@JsonSerializable()
class VenueEntity {
	String? id = '';
	@JSONField(name: "created_at")
	String? createdAt = '';
	@JSONField(name: "venue_name")
	String? venueName = '';
	@JSONField(name: "venue_location")
	String? venueLocation = '';
	int? phone = 0;
	String? email = '';
	String? website = '';
	List<VenueAmenities>? amenities = [];
	List<String>? images = [];
	@JSONField(name: "owner_id")
	String? ownerId = '';
	String? country = '';
	String? state = '';
	String? city = '';
	@JSONField(name: "city_id")
	int? cityId = 0;
	String? status = '';
	double? latitude;
	double? longitude;
	@JSONField(name: "venue_description")
	String? venueDescription = '';

	VenueEntity();

	factory VenueEntity.fromJson(Map<String, dynamic> json) => $VenueEntityFromJson(json);

	Map<String, dynamic> toJson() => $VenueEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class VenueAmenities {
	int? id = 0;
	String? name = '';
	String? image = '';

	VenueAmenities();

	factory VenueAmenities.fromJson(Map<String, dynamic> json) => $VenueAmenitiesFromJson(json);

	Map<String, dynamic> toJson() => $VenueAmenitiesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}