// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllBookingUsersHash() =>
    r'7b41025eb11105162c4df1b2406edc2523ef0df7';

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

/// See also [getAllBookingUsers].
@ProviderFor(getAllBookingUsers)
const getAllBookingUsersProvider = GetAllBookingUsersFamily();

/// See also [getAllBookingUsers].
class GetAllBookingUsersFamily extends Family<AsyncValue<List>> {
  /// See also [getAllBookingUsers].
  const GetAllBookingUsersFamily();

  /// See also [getAllBookingUsers].
  GetAllBookingUsersProvider call(
    dynamic id,
  ) {
    return GetAllBookingUsersProvider(
      id,
    );
  }

  @override
  GetAllBookingUsersProvider getProviderOverride(
    covariant GetAllBookingUsersProvider provider,
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
  String? get name => r'getAllBookingUsersProvider';
}

/// See also [getAllBookingUsers].
class GetAllBookingUsersProvider extends AutoDisposeFutureProvider<List> {
  /// See also [getAllBookingUsers].
  GetAllBookingUsersProvider(
    dynamic id,
  ) : this._internal(
          (ref) => getAllBookingUsers(
            ref as GetAllBookingUsersRef,
            id,
          ),
          from: getAllBookingUsersProvider,
          name: r'getAllBookingUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllBookingUsersHash,
          dependencies: GetAllBookingUsersFamily._dependencies,
          allTransitiveDependencies:
              GetAllBookingUsersFamily._allTransitiveDependencies,
          id: id,
        );

  GetAllBookingUsersProvider._internal(
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
    FutureOr<List> Function(GetAllBookingUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllBookingUsersProvider._internal(
        (ref) => create(ref as GetAllBookingUsersRef),
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
    return _GetAllBookingUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllBookingUsersProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllBookingUsersRef on AutoDisposeFutureProviderRef<List> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _GetAllBookingUsersProviderElement
    extends AutoDisposeFutureProviderElement<List> with GetAllBookingUsersRef {
  _GetAllBookingUsersProviderElement(super.provider);

  @override
  dynamic get id => (origin as GetAllBookingUsersProvider).id;
}

String _$getAllBookingVenueHash() =>
    r'47ee277ea1621bbb337246ed2e6e022f7ba04773';

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

String _$getBookingTurfHash() => r'3c1c4334b92d89614ab9ee8d9cb02ebc415fbecf';

/// See also [getBookingTurf].
@ProviderFor(getBookingTurf)
const getBookingTurfProvider = GetBookingTurfFamily();

/// See also [getBookingTurf].
class GetBookingTurfFamily extends Family<AsyncValue<List>> {
  /// See also [getBookingTurf].
  const GetBookingTurfFamily();

  /// See also [getBookingTurf].
  GetBookingTurfProvider call(
    List<dynamic> id,
  ) {
    return GetBookingTurfProvider(
      id,
    );
  }

  @override
  GetBookingTurfProvider getProviderOverride(
    covariant GetBookingTurfProvider provider,
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
  String? get name => r'getBookingTurfProvider';
}

/// See also [getBookingTurf].
class GetBookingTurfProvider extends AutoDisposeFutureProvider<List> {
  /// See also [getBookingTurf].
  GetBookingTurfProvider(
    List<dynamic> id,
  ) : this._internal(
          (ref) => getBookingTurf(
            ref as GetBookingTurfRef,
            id,
          ),
          from: getBookingTurfProvider,
          name: r'getBookingTurfProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBookingTurfHash,
          dependencies: GetBookingTurfFamily._dependencies,
          allTransitiveDependencies:
              GetBookingTurfFamily._allTransitiveDependencies,
          id: id,
        );

  GetBookingTurfProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final List<dynamic> id;

  @override
  Override overrideWith(
    FutureOr<List> Function(GetBookingTurfRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetBookingTurfProvider._internal(
        (ref) => create(ref as GetBookingTurfRef),
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
    return _GetBookingTurfProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetBookingTurfProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetBookingTurfRef on AutoDisposeFutureProviderRef<List> {
  /// The parameter `id` of this provider.
  List<dynamic> get id;
}

class _GetBookingTurfProviderElement
    extends AutoDisposeFutureProviderElement<List> with GetBookingTurfRef {
  _GetBookingTurfProviderElement(super.provider);

  @override
  List<dynamic> get id => (origin as GetBookingTurfProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
