import 'package:taskify_app/data/storage/local_storage.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<String?> getUsername();
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<void> saveAuthState(bool isLoggedIn, String? username);
}

class MockAuthRepository implements AuthRepository {
  final LocalStorage localStorage;

  MockAuthRepository({required this.localStorage});

  static const String isLoggedStorageKey = 'taskify.v1.is_logged_in';
  static const String usernameStorageKey = 'taskify.v1.username';

  bool _isLoggedIn = false;
  String? _username;
  
  @override
  Future<String?> getUsername() async {
    final result = await localStorage.getData<String>(key: usernameStorageKey);
    if (result == null || result.isEmpty || result == 'null') {
      _username = null;
      return null;
    }
    _username = result;
    return _username;
  }

  @override
  Future<bool> isLoggedIn() async {
    final raw = await localStorage.getData<String>(key: isLoggedStorageKey);
    if (raw == null || raw.isEmpty) {
      _isLoggedIn = false;
      return false;
    }
    _isLoggedIn = raw.trim().toLowerCase() == 'true';
    return _isLoggedIn;
  }
  
  @override
  Future<bool> login(String email, String password) async {
    // Simulando login mockado
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      _username = email.split("@").first;

      await saveAuthState(_isLoggedIn, _username);
      return true;
    }
    return false;
  }
  
  @override
  Future<void> logout() async {
    _isLoggedIn = false;
    _username = null;

    await localStorage.delete(key: isLoggedStorageKey);
    await localStorage.delete(key: usernameStorageKey);
  }
  
  @override
  Future<void> saveAuthState(bool isLoggedIn, String? username) async {
    await localStorage.create(key: isLoggedStorageKey, data: isLoggedIn);
    await localStorage.create(key: usernameStorageKey, data: username);
    
    _isLoggedIn = isLoggedIn;
    _username = username;
  }

}