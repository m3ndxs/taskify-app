abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<String?> getUsername();
  Future<bool> login(String email, String password);
  Future<void> logout();
  Future<void> saveAuthState(bool isLoggedIn, String? username);
}

class MockAuthRepository implements AuthRepository {
  bool _isLoggedIn = false;
  String? _username;
  
  @override
  Future<String?> getUsername() async {
    return _username;
  }
  
  @override
  Future<bool> isLoggedIn() async {
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
    _isLoggedIn = true;
    _username = null;

    await saveAuthState(_isLoggedIn, _username);
  }
  
  @override
  Future<void> saveAuthState(bool isLoggedIn, String? username) async {
    _isLoggedIn = isLoggedIn;
    _username = username;
  }

}