// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllBookingVenueHash() =>
    r'47ee277ea1621bbb337246ed2e6e022f7ba04773';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getAllBookingVenue].
@ProviderFor(getAllBookingVenue)
const getAllBookingVenueProvider = GetAllBookingVenueFamily();

/// See also [getAllBookingVenue].
class GetAllBookingVenueFamily extends Family<AsyncValue<List>> {
  /// See also [getAllBookingVenue].
  const GetAllBookingVenueFamily();

  /// See also [getAllBookingVenue].
  GetAllBookingVenueProvider call(
    dynamic id,
  ) {
    return GetAllBookingVenueProvider(
      id,
    );
  }

  @override
  GetAllBookingVenueProvider getProviderOverride(
    covariant GetAllBookingVenueProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getAllBookingVenueProvider';
}

/// See also [getAllBookingVenue].
class GetAllBookingVenueProvider extends AutoDisposeFutureProvider<List> {
  /// See also [getAllBookingVenue].
  GetAllBookingVenueProvider(
    dynamic id,
  ) : this._internal(
          (ref) => getAllBookingVenue(
            ref as GetAllBookingVenueRef,
            id,
          ),
          from: getAllBookingVenueProvider,
          name: r'getAllBookingVenueProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllBookingVenueHash,
          dependencies: GetAllBookingVenueFamily._dependencies,
          allTransitiveDependencies:
              GetAllBookingVenueFamily._allTransitiveDependencies,
          id: id,
        );

  GetAllBookingVenueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final dynamic id;

  @override
  Override overrideWith(
    FutureOr<List> Function(GetAllBookingVenueRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllBookingVenueProvider._internal(
        (ref) => create(ref as GetAllBookingVenueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List> createElement() {
    return _GetAllBookingVenueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllBookingVenueProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllBookingVenueRef on AutoDisposeFutureProviderRef<List> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _GetAllBookingVenueProviderElement
    extends AutoDisposeFutureProviderElement<List> with GetAllBookingVenueRef {
  _GetAllBookingVenueProviderElement(super.provider);

  @override
  dynamic get id => (origin as GetAllBookingVenueProvider).id;
}

String _$bookingDetailsControllerHash() =>
    r'd17e3fc1494654666b2398e78a646f69fed9fcf9';

abstract class _$BookingDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<Map> {
  late final dynamic id;

  Future<Map> build(
    dynamic id,
  );
}

/// See also [BookingDetailsController].
@ProviderFor(BookingDetailsController)
const bookingDetailsControllerProvider = BookingDetailsControllerFamily();

/// See also [BookingDetailsController].
class BookingDetailsControllerFamily extends Family<AsyncValue<Map>> {
  /// See also [BookingDetailsController].
  const BookingDetailsControllerFamily();

  /// See also [BookingDetailsController].
  BookingDetailsControllerProvider call(
    dynamic id,
  ) {
    return BookingDetailsControllerProvider(
      id,
    );
  }

  @override
  BookingDetailsControllerProvider getProviderOverride(
    covariant BookingDetailsControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bookingDetailsControllerProvider';
}

/// See also [BookingDetailsController].
class BookingDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BookingDetailsController,
        Map> {
  /// See also [BookingDetailsController].
  BookingDetailsControllerProvider(
    dynamic id,
  ) : this._internal(
          () => BookingDetailsController()..id = id,
          from: bookingDetailsControllerProvider,
          name: r'bookingDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookingDetailsControllerHash,
          dependencies: BookingDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              BookingDetailsControllerFamily._allTransitiveDependencies,
          id: id,
        );

  BookingDetailsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final dynamic id;

  @override
  Future<Map> runNotifierBuild(
    covariant BookingDetailsController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BookingDetailsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookingDetailsControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BookingDetailsController, Map>
      createElement() {
    return _BookingDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookingDetailsControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookingDetailsControllerRef on AutoDisposeAsyncNotifierProviderRef<Map> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _BookingDetailsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BookingDetailsController,
        Map> with BookingDetailsControllerRef {
  _BookingDetailsControllerProviderElement(super.provider);

  @override
  dynamic get id => (origin as BookingDetailsControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
