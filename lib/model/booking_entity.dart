import 'package:book_my_turf_dashboard/generated/json/base/json_field.dart';
import 'package:book_my_turf_dashboard/generated/json/booking_entity.g.dart';
import 'dart:convert';
export 'package:book_my_turf_dashboard/generated/json/booking_entity.g.dart';

@JsonSerializable()
class BookingEntity {
	int? id = 0;
	@JSONField(name: "created_at")
	String? createdAt = '';
	@JSONField(name: "user_id")
	String? userId = '';
	int? price = 0;
	@JSONField(name: "venue_id")
	int? venueId = 0;
	@JSONField(name: "turf_id")
	List<dynamic>? turfId = [];
	List<dynamic>? date = [];
	List<BookingSlots>? slots = [];
	@JSONField(name: "user_name")
	String? userName = '';
	@JSONField(name: "user_mobile")
	int? userMobile = 0;
	int? discount = 0;
	@JSONField(name: "convenience_fee")
	double? convenienceFee;
	@JSONField(name: "final_amount")
	double? finalAmount;
	String? status = '';
	@JSONField(name: "coupon_id")
	int? couponId = 0;

	BookingEntity();

	factory BookingEntity.fromJson(Map<String, dynamic> json) => $BookingEntityFromJson(json);

	Map<String, dynamic> toJson() => $BookingEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BookingSlots {
	String? time = '';
	int? turf = 0;
	int? price = 0;
	int? duration = 0;

	BookingSlots();

	factory BookingSlots.fromJson(Map<String, dynamic> json) => $BookingSlotsFromJson(json);

	Map<String, dynamic> toJson() => $BookingSlotsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}