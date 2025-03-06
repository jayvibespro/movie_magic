import 'package:flutter/foundation.dart';

import '../../models/api_response_model.dart';
import '../base_service.dart';

/*
   * Created by Jackson Stephen, jacksonsteven436@gmail.com: 10|12|2024
**/

class AuthService extends BaseService {
  /*Future<ApiResponseModel<UserModel?>> sendOtP(UserModel data) async {
    return await post<UserModel>(
      epSendOtp,
      body: data.toJson(),
      fromJson: (data) {
        if (data.containsKey('passenger')) {
          return UserModel.fromJson(data['passenger'] as Map<String, dynamic>);
        } else {
          return UserModel(
            phoneNumber: data['parent_number'],
            isFirstLogin: data['registered'],
          );
        }
      },
    );
  }

  Future<ApiResponseModel<UserModel?>> reSendOtP(UserModel data) async {
    return await post<UserModel>(
      epResendOtp,
      body: data.toJson(),
      fromJson: (data) {
        return UserModel.fromJson(data['passenger'] as Map<String, dynamic>);
      },
    );
  }

  Future<ApiResponseModel<LoginResponse?>> login(UserModel data) async {
    return await post<LoginResponse>(
      epLogin,
      body: data.toJson(),
      fromJson: (data) {
        return LoginResponse.fromJson(data as Map<String, dynamic>);
      },
    );
  }

  Future<ApiResponseModel<void>> logOut() async {
    return await post<void>(
      epLogOut,
      fromJson: (data) {
        return;
      },
    );
  }

  Future<ApiResponseModel<bool?>> changePassword(UserModel data) async {
    return await post<bool>(
      epChangePassword,
      body: data.toJson(),
      fromJson: (data) {
        return data['message'] == 'Password changed successfully'
            ? true
            : false;
      },
    );
  }

  Future<ApiResponseModel<UserModel?>> loginWithPassword(UserModel data) async {
    return await post<UserModel>(
      epLogin,
      body: data.toJson(),
      fromJson: (data) {
        return UserModel.fromJson(data['passenger'] as Map<String, dynamic>);
      },
    );
  }*/
}
