// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../AuthProviders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'769f9c7156cdc869e729c05bdd6f6a7dfa0a6923';

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

/// See also [login].
@ProviderFor(login)
const loginProvider = LoginFamily();

/// See also [login].
class LoginFamily extends Family<AsyncValue<void>> {
  /// See also [login].
  const LoginFamily();

  /// See also [login].
  LoginProvider call({
    required UserLoginData userLoginData,
  }) {
    return LoginProvider(
      userLoginData: userLoginData,
    );
  }

  @override
  LoginProvider getProviderOverride(
    covariant LoginProvider provider,
  ) {
    return call(
      userLoginData: provider.userLoginData,
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
  String? get name => r'loginProvider';
}

/// See also [login].
class LoginProvider extends AutoDisposeFutureProvider<void> {
  /// See also [login].
  LoginProvider({
    required UserLoginData userLoginData,
  }) : this._internal(
          (ref) => login(
            ref as LoginRef,
            userLoginData: userLoginData,
          ),
          from: loginProvider,
          name: r'loginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginHash,
          dependencies: LoginFamily._dependencies,
          allTransitiveDependencies: LoginFamily._allTransitiveDependencies,
          userLoginData: userLoginData,
        );

  LoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userLoginData,
  }) : super.internal();

  final UserLoginData userLoginData;

  @override
  Override overrideWith(
    FutureOr<void> Function(LoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginProvider._internal(
        (ref) => create(ref as LoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userLoginData: userLoginData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginProvider && other.userLoginData == userLoginData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userLoginData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userLoginData` of this provider.
  UserLoginData get userLoginData;
}

class _LoginProviderElement extends AutoDisposeFutureProviderElement<void>
    with LoginRef {
  _LoginProviderElement(super.provider);

  @override
  UserLoginData get userLoginData => (origin as LoginProvider).userLoginData;
}

String _$registerHash() => r'8be0f8aef87fe15cfcff14399ca8cf1af68af924';

/// See also [register].
@ProviderFor(register)
const registerProvider = RegisterFamily();

/// See also [register].
class RegisterFamily extends Family<AsyncValue<void>> {
  /// See also [register].
  const RegisterFamily();

  /// See also [register].
  RegisterProvider call({
    required UserRegisterData userRegisterData,
  }) {
    return RegisterProvider(
      userRegisterData: userRegisterData,
    );
  }

  @override
  RegisterProvider getProviderOverride(
    covariant RegisterProvider provider,
  ) {
    return call(
      userRegisterData: provider.userRegisterData,
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
  String? get name => r'registerProvider';
}

/// See also [register].
class RegisterProvider extends AutoDisposeFutureProvider<void> {
  /// See also [register].
  RegisterProvider({
    required UserRegisterData userRegisterData,
  }) : this._internal(
          (ref) => register(
            ref as RegisterRef,
            userRegisterData: userRegisterData,
          ),
          from: registerProvider,
          name: r'registerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registerHash,
          dependencies: RegisterFamily._dependencies,
          allTransitiveDependencies: RegisterFamily._allTransitiveDependencies,
          userRegisterData: userRegisterData,
        );

  RegisterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userRegisterData,
  }) : super.internal();

  final UserRegisterData userRegisterData;

  @override
  Override overrideWith(
    FutureOr<void> Function(RegisterRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RegisterProvider._internal(
        (ref) => create(ref as RegisterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userRegisterData: userRegisterData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RegisterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegisterProvider &&
        other.userRegisterData == userRegisterData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userRegisterData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegisterRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userRegisterData` of this provider.
  UserRegisterData get userRegisterData;
}

class _RegisterProviderElement extends AutoDisposeFutureProviderElement<void>
    with RegisterRef {
  _RegisterProviderElement(super.provider);

  @override
  UserRegisterData get userRegisterData =>
      (origin as RegisterProvider).userRegisterData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
