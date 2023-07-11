import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/utils/custom_exception.dart';
import 'package:flutter_getx_template/data/model/user_model.dart';
import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/persistence.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required this.networkCore, required this.persistenceCore});

  NetworkCore networkCore;
  PersistenceCore persistenceCore;

  @override
  FutureOr<UserModel?> getUser(int page) async {
    late Response? response;
    try {
      response = await networkCore.get("/users",
          options: networkCore.reqResBaseUrl(),
          queryParameters: {
            "page": page
          },
          // body: {
          //   "username": username,
          //   "password": password,
          //   "device_id": fcmToken
          // },
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json"
          });
    } on CustomException catch (e) {
      debugPrint(e.message);
      return UserModel();
    }
    return UserModel.fromJson(response?.data);
  }
}
