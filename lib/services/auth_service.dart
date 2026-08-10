import '../models/user_model.dart';
import 'api_service.dart';
import 'package:flutter/material.dart';


class AuthService extends ChangeNotifier{

  UserModel? currentUser;
  String? _token;
  String? get token => _token;
  UserModel? get user => currentUser;
  bool get isLoggedIn => token != null;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final ApiService apiService = ApiService();

  Future<bool> login(String email, String password) async{
    _isLoading = true;
    try{
      final response = await apiService.post(
        "/login",
        {
          "email": email,
          "password": password,
        },
      );
      _token = response["token"];
      currentUser = UserModel.fromJson(response["user"]);
      notifyListeners();
      return true;

    } catch (e) {
      return false;
    }finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  void logout() {
    currentUser = null;
    _token = null;
    notifyListeners();
  }

  Future<bool> register(Map<String, dynamic> data) async{
    _isLoading = true;

    try {
      final response = await apiService.post( "/register", data, );
      _token = response["token"];
      currentUser = UserModel.fromJson(response["user"]);
      _isLoading = false;
      notifyListeners();

      return true;

    } catch (e) {
      return false;
    }finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}