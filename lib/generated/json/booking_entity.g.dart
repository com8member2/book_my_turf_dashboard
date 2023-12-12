import 'package:book_my_turf_dashboard/generated/json/base/json_convert_content.dart';
import 'package:book_my_turf_dashboard/model/booking_entity.dart';

BookingEntity $BookingEntityFromJson(Map<String, dynamic> json) {
  final BookingEntity bookingEntity = BookingEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bookingEntity.id = id;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    bookingEntity.createdAt = createdAt;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    bookingEntity.userId = userId;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    bookingEntity.price = price;
  }
  final int? venueId = jsonConvert.convert<int>(json['venue_id']);
  if (venueId != null) {
    bookingEntity.venueId = venueId;
  }
  final List<dynamic>? turfId = (json['turf_id'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (turfId != null) {
    bookingEntity.turfId = turfId;
  }
  final List<dynamic>? date = (json['date'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (date != null) {
    bookingEntity.date = date;
  }
  final List<BookingSlots>? slots = (json['slots'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BookingSlots>(e) as BookingSlots).toList();
  if (slots != null) {
    bookingEntity.slots = slots;
  }
  final String? userName = jsonConvert.convert<String>(json['user_name']);
  if (userName != null) {
    bookingEntity.userName = userName;
  }
  final int? userMobile = jsonConvert.convert<int>(json['user_mobile']);
  if (userMobile != null) {
    bookingEntity.userMobile = userMobile;
  }
  final int? discount = jsonConvert.convert<int>(json['discount']);
  if (discount != null) {
    bookingEntity.discount = discount;
  }
  final double? convenienceFee = jsonConvert.convert<double>(json['convenience_fee']);
  if (convenienceFee != null) {
    bookingEntity.convenienceFee = convenienceFee;
  }
  final double? finalAmount = jsonConvert.convert<double>(json['final_amount']);
  if (finalAmount != null) {
    bookingEntity.finalAmount = finalAmount;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    bookingEntity.status = status;
  }
  final int? couponId = jsonConvert.convert<int>(json['coupon_id']);
  if (couponId != null) {
    bookingEntity.couponId = couponId;
  }
  return bookingEntity;
}

Map<String, dynamic> $BookingEntityToJson(BookingEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['created_at'] = entity.createdAt;
  data['user_id'] = entity.userId;
  data['price'] = entity.price;
  data['venue_id'] = entity.venueId;
  data['turf_id'] = entity.turfId;
  data['date'] = entity.date;
  data['slots'] = entity.slots?.map((v) => v.toJson()).toList();
  data['user_name'] = entity.userName;
  data['user_mobile'] = entity.userMobile;
  data['discount'] = entity.discount;
  data['convenience_fee'] = entity.convenienceFee;
  data['final_amount'] = entity.finalAmount;
  data['status'] = entity.status;
  data['coupon_id'] = entity.couponId;
  return data;
}

extension BookingEntityExtension on BookingEntity {
  BookingEntity copyWith({
    int? id,
    String? createdAt,
    String? userId,
    int? price,
    int? venueId,
    List<dynamic>? turfId,
    List<dynamic>? date,
    List<BookingSlots>? slots,
    String? userName,
    int? userMobile,
    int? discount,
    double? convenienceFee,
    double? finalAmount,
    String? status,
    int? couponId,
  }) {
    return BookingEntity()
      ..id = id ?? this.id
      ..createdAt = createdAt ?? this.createdAt
      ..userId = userId ?? this.userId
      ..price = price ?? this.price
      ..venueId = venueId ?? this.venueId
      ..turfId = turfId ?? this.turfId
      ..date = date ?? this.date
      ..slots = slots ?? this.slots
      ..userName = userName ?? this.userName
      ..userMobile = userMobile ?? this.userMobile
      ..discount = discount ?? this.discount
      ..convenienceFee = convenienceFee ?? this.convenienceFee
      ..finalAmount = finalAmount ?? this.finalAmount
      ..status = status ?? this.status
      ..couponId = couponId ?? this.couponId;
  }
}

BookingSlots $BookingSlotsFromJson(Map<String, dynamic> json) {
  final BookingSlots bookingSlots = BookingSlots();
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    bookingSlots.time = time;
  }
  final int? turf = jsonConvert.convert<int>(json['turf']);
  if (turf != null) {
    bookingSlots.turf = turf;
  }
  final int? price = jsonConvert.convert<int>(json['price']);
  if (price != null) {
    bookingSlots.price = price;
  }
  final int? duration = jsonConvert.convert<int>(json['duration']);
  if (duration != null) {
    bookingSlots.duration = duration;
  }
  return bookingSlots;
}

Map<String, dynamic> $BookingSlotsToJson(BookingSlots entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['time'] = entity.time;
  data['turf'] = entity.turf;
  data['price'] = entity.price;
  data['duration'] = entity.duration;
  return data;
}

extension BookingSlotsExtension on BookingSlots {
  BookingSlots copyWith({
    String? time,
    int? turf,
    int? price,
    int? duration,
  }) {
    return BookingSlots()
      ..time = time ?? this.time
      ..turf = turf ?? this.turf
      ..price = price ?? this.price
      ..duration = duration ?? this.duration;
  }
}