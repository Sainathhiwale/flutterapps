
import 'package:flutterapps/domain_layer/database_helper.dart';
import 'package:flutterapps/models/user.dart';

class LoginRepository{
  final DatabaseHelper databaseHelper;

  LoginRepository({required this.databaseHelper});

  Future<User?> login(int id, String username, String password) async {
    final user = await databaseHelper.getUser(username);
    if (user != null && user.password == password) {
      return user;
    } else {
    User user = User(id: id, username: username, password: password);
      register(user);
      return null;
    }
  }

  Future<void> register(User user) async {
    await databaseHelper.insertUser(user);
  }

}