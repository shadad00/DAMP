// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../NewsProviders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsRetrieverHash() => r'e6f41b5ed2c5157cc84ef0f4c45d4c50b921b0a9';

/// See also [newsRetriever].
@ProviderFor(newsRetriever)
final newsRetrieverProvider = FutureProvider<List<News>>.internal(
  newsRetriever,
  name: r'newsRetrieverProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsRetrieverHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRetrieverRef = FutureProviderRef<List<News>>;
String _$newByIdRetrieverHash() => r'79883482fb314811b0edcdf59d9e57d351b949e9';

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

/// See also [newByIdRetriever].
@ProviderFor(newByIdRetriever)
const newByIdRetrieverProvider = NewByIdRetrieverFamily();

/// See also [newByIdRetriever].
class NewByIdRetrieverFamily extends Family<AsyncValue<News?>> {
  /// See also [newByIdRetriever].
  const NewByIdRetrieverFamily();

  /// See also [newByIdRetriever].
  NewByIdRetrieverProvider call({
    required String id,
  }) {
    return NewByIdRetrieverProvider(
      id: id,
    );
  }

  @override
  NewByIdRetrieverProvider getProviderOverride(
    covariant NewByIdRetrieverProvider provider,
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
  String? get name => r'newByIdRetrieverProvider';
}

/// See also [newByIdRetriever].
class NewByIdRetrieverProvider extends FutureProvider<News?> {
  /// See also [newByIdRetriever].
  NewByIdRetrieverProvider({
    required String id,
  }) : this._internal(
          (ref) => newByIdRetriever(
            ref as NewByIdRetrieverRef,
            id: id,
          ),
          from: newByIdRetrieverProvider,
          name: r'newByIdRetrieverProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newByIdRetrieverHash,
          dependencies: NewByIdRetrieverFamily._dependencies,
          allTransitiveDependencies:
              NewByIdRetrieverFamily._allTransitiveDependencies,
          id: id,
        );

  NewByIdRetrieverProvider._internal(
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
    FutureOr<News?> Function(NewByIdRetrieverRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewByIdRetrieverProvider._internal(
        (ref) => create(ref as NewByIdRetrieverRef),
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
    return _NewByIdRetrieverProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewByIdRetrieverProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewByIdRetrieverRef on FutureProviderRef<News?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NewByIdRetrieverProviderElement extends FutureProviderElement<News?>
    with NewByIdRetrieverRef {
  _NewByIdRetrieverProviderElement(super.provider);

  @override
  String get id => (origin as NewByIdRetrieverProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
