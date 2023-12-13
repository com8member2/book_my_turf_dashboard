// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTurfsHash() => r'13a53240d27303f38a2783941693b18cd2ba71d8';

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

/// See also [getTurfs].
@ProviderFor(getTurfs)
const getTurfsProvider = GetTurfsFamily();

/// See also [getTurfs].
class GetTurfsFamily extends Family<AsyncValue<List>> {
  /// See also [getTurfs].
  const GetTurfsFamily();

  /// See also [getTurfs].
  GetTurfsProvider call(
    dynamic id,
  ) {
    return GetTurfsProvider(
      id,
    );
  }

  @override
  GetTurfsProvider getProviderOverride(
    covariant GetTurfsProvider provider,
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
  String? get name => r'getTurfsProvider';
}

/// See also [getTurfs].
class GetTurfsProvider extends AutoDisposeFutureProvider<List> {
  /// See also [getTurfs].
  GetTurfsProvider(
    dynamic id,
  ) : this._internal(
          (ref) => getTurfs(
            ref as GetTurfsRef,
            id,
          ),
          from: getTurfsProvider,
          name: r'getTurfsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTurfsHash,
          dependencies: GetTurfsFamily._dependencies,
          allTransitiveDependencies: GetTurfsFamily._allTransitiveDependencies,
          id: id,
        );

  GetTurfsProvider._internal(
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
    FutureOr<List> Function(GetTurfsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTurfsProvider._internal(
        (ref) => create(ref as GetTurfsRef),
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
    return _GetTurfsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTurfsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTurfsRef on AutoDisposeFutureProviderRef<List> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _GetTurfsProviderElement extends AutoDisposeFutureProviderElement<List>
    with GetTurfsRef {
  _GetTurfsProviderElement(super.provider);

  @override
  dynamic get id => (origin as GetTurfsProvider).id;
}

String _$getStaffHash() => r'47ae14017be989cd4e0351e5eaca2cb02845411f';

/// See also [getStaff].
@ProviderFor(getStaff)
const getStaffProvider = GetStaffFamily();

/// See also [getStaff].
class GetStaffFamily extends Family<AsyncValue<List>> {
  /// See also [getStaff].
  const GetStaffFamily();

  /// See also [getStaff].
  GetStaffProvider call(
    dynamic id,
  ) {
    return GetStaffProvider(
      id,
    );
  }

  @override
  GetStaffProvider getProviderOverride(
    covariant GetStaffProvider provider,
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
  String? get name => r'getStaffProvider';
}

/// See also [getStaff].
class GetStaffProvider extends AutoDisposeFutureProvider<List> {
  /// See also [getStaff].
  GetStaffProvider(
    dynamic id,
  ) : this._internal(
          (ref) => getStaff(
            ref as GetStaffRef,
            id,
          ),
          from: getStaffProvider,
          name: r'getStaffProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStaffHash,
          dependencies: GetStaffFamily._dependencies,
          allTransitiveDependencies: GetStaffFamily._allTransitiveDependencies,
          id: id,
        );

  GetStaffProvider._internal(
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
    FutureOr<List> Function(GetStaffRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStaffProvider._internal(
        (ref) => create(ref as GetStaffRef),
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
    return _GetStaffProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStaffProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetStaffRef on AutoDisposeFutureProviderRef<List> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _GetStaffProviderElement extends AutoDisposeFutureProviderElement<List>
    with GetStaffRef {
  _GetStaffProviderElement(super.provider);

  @override
  dynamic get id => (origin as GetStaffProvider).id;
}

String _$getAllVenuesCityHash() => r'ee33e7dc18c042287a26c6bcee7ba0fa0c386637';

/// See also [getAllVenuesCity].
@ProviderFor(getAllVenuesCity)
final getAllVenuesCityProvider = AutoDisposeFutureProvider<List>.internal(
  getAllVenuesCity,
  name: r'getAllVenuesCityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllVenuesCityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllVenuesCityRef = AutoDisposeFutureProviderRef<List>;
String _$getAllVenuesHash() => r'856175ca0a4a46cff9c69b08595c9fe8fb1e7580';

/// See also [getAllVenues].
@ProviderFor(getAllVenues)
final getAllVenuesProvider = AutoDisposeFutureProvider<List>.internal(
  getAllVenues,
  name: r'getAllVenuesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllVenuesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllVenuesRef = AutoDisposeFutureProviderRef<List>;
String _$getVenueDetailsHash() => r'0bfc9044da1a30006771f973326fddc493d56539';

/// See also [getVenueDetails].
@ProviderFor(getVenueDetails)
const getVenueDetailsProvider = GetVenueDetailsFamily();

/// See also [getVenueDetails].
class GetVenueDetailsFamily extends Family<AsyncValue<VenueEntity>> {
  /// See also [getVenueDetails].
  const GetVenueDetailsFamily();

  /// See also [getVenueDetails].
  GetVenueDetailsProvider call(
    dynamic id,
  ) {
    return GetVenueDetailsProvider(
      id,
    );
  }

  @override
  GetVenueDetailsProvider getProviderOverride(
    covariant GetVenueDetailsProvider provider,
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
  String? get name => r'getVenueDetailsProvider';
}

/// See also [getVenueDetails].
class GetVenueDetailsProvider extends AutoDisposeFutureProvider<VenueEntity> {
  /// See also [getVenueDetails].
  GetVenueDetailsProvider(
    dynamic id,
  ) : this._internal(
          (ref) => getVenueDetails(
            ref as GetVenueDetailsRef,
            id,
          ),
          from: getVenueDetailsProvider,
          name: r'getVenueDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVenueDetailsHash,
          dependencies: GetVenueDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetVenueDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  GetVenueDetailsProvider._internal(
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
    FutureOr<VenueEntity> Function(GetVenueDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVenueDetailsProvider._internal(
        (ref) => create(ref as GetVenueDetailsRef),
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
  AutoDisposeFutureProviderElement<VenueEntity> createElement() {
    return _GetVenueDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVenueDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVenueDetailsRef on AutoDisposeFutureProviderRef<VenueEntity> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _GetVenueDetailsProviderElement
    extends AutoDisposeFutureProviderElement<VenueEntity>
    with GetVenueDetailsRef {
  _GetVenueDetailsProviderElement(super.provider);

  @override
  dynamic get id => (origin as GetVenueDetailsProvider).id;
}

String _$venueSearchValueHash() => r'b850be65a1488b46dcc9b3aab2502521920b4c49';

/// See also [venueSearchValue].
@ProviderFor(venueSearchValue)
final venueSearchValueProvider =
    AutoDisposeNotifierProvider<venueSearchValue, String>.internal(
  venueSearchValue.new,
  name: r'venueSearchValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$venueSearchValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$venueSearchValue = AutoDisposeNotifier<String>;
String _$venueCitySearchValueHash() =>
    r'1adbb5b4947aee020a7164e15571917dc3056eb1';

/// See also [venueCitySearchValue].
@ProviderFor(venueCitySearchValue)
final venueCitySearchValueProvider =
    AutoDisposeNotifierProvider<venueCitySearchValue, String>.internal(
  venueCitySearchValue.new,
  name: r'venueCitySearchValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$venueCitySearchValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$venueCitySearchValue = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
