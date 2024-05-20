
import 'package:flutterapps/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{
  Future<SharedPreferences> _getInstance() async{
    return await SharedPreferences.getInstance();
  }

  Future<void> setloggedIn(bool isloggedIn) async{
    final prefs = await _getInstance();
    await prefs.setBool('isloggedIn', isloggedIn);
  }
  Future<bool> getIsLoggedIn() async {
    final prefs = await _getInstance();
    return prefs.getBool('isloggedIn') ?? false; // Default to false if not set
  }
  Future<void> setUser(User user) async {
    final prefs = await _getInstance();
    await prefs.setInt('userId', user.id);
    await prefs.setString('username', user.username);
    await prefs.setString('useremail', user.useremail);
  }
  Future<void> clearUser() async {
    final prefs = await _getInstance();
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('userId'); // Example token removal
    await prefs.remove('isLoggedIn');
  }

}