import 'dart:async';

import 'package:flutter_getx_template/data/model/user_model.dart';

abstract interface class Repository {
  FutureOr<UserModel?> getUser(int page);
}
