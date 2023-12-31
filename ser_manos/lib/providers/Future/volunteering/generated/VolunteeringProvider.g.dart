// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../VolunteeringProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVolunteeringsHash() => r'0cb9e0279f911df90c0733c6d91c21c88528c7f2';

/// See also [getVolunteerings].
@ProviderFor(getVolunteerings)
final getVolunteeringsProvider = FutureProvider<List<Volunteering>>.internal(
  getVolunteerings,
  name: r'getVolunteeringsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getVolunteeringsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetVolunteeringsRef = FutureProviderRef<List<Volunteering>>;
String _$getVolunteeringByIdHash() =>
    r'c1e7e9136721413656a4ed307fdaf535e063414c';

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

/// See also [getVolunteeringById].
@ProviderFor(getVolunteeringById)
const getVolunteeringByIdProvider = GetVolunteeringByIdFamily();

/// See also [getVolunteeringById].
class GetVolunteeringByIdFamily extends Family<AsyncValue<Volunteering?>> {
  /// See also [getVolunteeringById].
  const GetVolunteeringByIdFamily();

  /// See also [getVolunteeringById].
  GetVolunteeringByIdProvider call({
    required String id,
  }) {
    return GetVolunteeringByIdProvider(
      id: id,
    );
  }

  @override
  GetVolunteeringByIdProvider getProviderOverride(
    covariant GetVolunteeringByIdProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getVolunteeringByIdProvider';
}

/// See also [getVolunteeringById].
class GetVolunteeringByIdProvider extends FutureProvider<Volunteering?> {
  /// See also [getVolunteeringById].
  GetVolunteeringByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => getVolunteeringById(
            ref as GetVolunteeringByIdRef,
            id: id,
          ),
          from: getVolunteeringByIdProvider,
          name: r'getVolunteeringByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVolunteeringByIdHash,
          dependencies: GetVolunteeringByIdFamily._dependencies,
          allTransitiveDependencies:
              GetVolunteeringByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetVolunteeringByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Volunteering?> Function(GetVolunteeringByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVolunteeringByIdProvider._internal(
        (ref) => create(ref as GetVolunteeringByIdRef),
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
  FutureProviderElement<Volunteering?> createElement() {
    return _GetVolunteeringByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVolunteeringByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVolunteeringByIdRef on FutureProviderRef<Volunteering?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetVolunteeringByIdProviderElement
    extends FutureProviderElement<Volunteering?> with GetVolunteeringByIdRef {
  _GetVolunteeringByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetVolunteeringByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
