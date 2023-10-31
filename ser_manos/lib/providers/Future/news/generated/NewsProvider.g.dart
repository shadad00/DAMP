// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../NewsProvider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getNewsHash() => r'66773e971dfbb77af827f44a0a8b84020c2abd14';

/// See also [getNews].
@ProviderFor(getNews)
final getNewsProvider = FutureProvider<List<News>>.internal(
  getNews,
  name: r'getNewsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getNewsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNewsRef = FutureProviderRef<List<News>>;
String _$getNewByIdHash() => r'a7a4802c8bb475386575e1cb147ab58a1156c03b';

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

/// See also [getNewById].
@ProviderFor(getNewById)
const getNewByIdProvider = GetNewByIdFamily();

/// See also [getNewById].
class GetNewByIdFamily extends Family<AsyncValue<News?>> {
  /// See also [getNewById].
  const GetNewByIdFamily();

  /// See also [getNewById].
  GetNewByIdProvider call({
    required String id,
  }) {
    return GetNewByIdProvider(
      id: id,
    );
  }

  @override
  GetNewByIdProvider getProviderOverride(
    covariant GetNewByIdProvider provider,
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
  String? get name => r'getNewByIdProvider';
}

/// See also [getNewById].
class GetNewByIdProvider extends FutureProvider<News?> {
  /// See also [getNewById].
  GetNewByIdProvider({
    required String id,
  }) : this._internal(
          (ref) => getNewById(
            ref as GetNewByIdRef,
            id: id,
          ),
          from: getNewByIdProvider,
          name: r'getNewByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getNewByIdHash,
          dependencies: GetNewByIdFamily._dependencies,
          allTransitiveDependencies:
              GetNewByIdFamily._allTransitiveDependencies,
          id: id,
        );

  GetNewByIdProvider._internal(
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
    FutureOr<News?> Function(GetNewByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetNewByIdProvider._internal(
        (ref) => create(ref as GetNewByIdRef),
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
  FutureProviderElement<News?> createElement() {
    return _GetNewByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetNewByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetNewByIdRef on FutureProviderRef<News?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetNewByIdProviderElement extends FutureProviderElement<News?>
    with GetNewByIdRef {
  _GetNewByIdProviderElement(super.provider);

  @override
  String get id => (origin as GetNewByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
