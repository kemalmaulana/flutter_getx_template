import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fimber/fimber.dart';

Future<bool> checkConnectivityState() async {
  final result = await Connectivity().checkConnectivity();
  for (var e in result) {
    Fimber.d("Connected to ${e.name}");
  }
  return result.isNotEmpty;
}
