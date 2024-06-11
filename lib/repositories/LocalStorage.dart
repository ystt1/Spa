import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbdd/Models/User.dart';

class LocalStorage {
  static final String _keyUsername = 'username';
  static final String _keyEmail = 'email';
  static final String _keyPassword = 'password';
  static final String _keyid = 'id';
  static final String _keyNumber = 'number';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyUsername, user.username);
    prefs.setString(_keyEmail, user.email);
    prefs.setString(_keyPassword, user.password);
    prefs.setString(_keyid, user.id);
    prefs.setString(_keyNumber, user.number);
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(_keyUsername);
    final email = prefs.getString(_keyEmail);
    final password = prefs.getString(_keyPassword);
    final id = prefs.getString(_keyid);
    final number = prefs.getString(_keyNumber);

    // Kiểm tra xem có bất kỳ giá trị nào là null không
    if (username != null &&
        email != null &&
        password != null &&
        id != null &&
        number != null) {
      return User(
          username: username,
          email: email,
          password: password,
          id: id,
          number: number);
    } else {
      // Trả về null nếu một trong các giá trị bị thiếu
      return null;
    }
  }
}
