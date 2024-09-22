import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data/model/user_model.dart';
import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';
import 'package:get/get.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required this.networkCore});

  NetworkCore networkCore;

  @override
  FutureOr<UserModel?> getUser(int page) async {
    late Response<dynamic>? response;
    try {
      response = await networkCore.getRequest<UserModel>('/users',
          queryParameters: {
            'page': page.toString()
          },
          decoder: UserModel.fromJson,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }
}
