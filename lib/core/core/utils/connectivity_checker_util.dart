import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fimber/fimber.dart';

Future<bool> checkConnectivityState() async {
  final ConnectivityResult result = await Connectivity().checkConnectivity();

  if (result == ConnectivityResult.wifi) {
    Fimber.d('Connected to a Wi-Fi network');
    return true;
  } else if (result == ConnectivityResult.mobile) {
    Fimber.d('Connected to a mobile network');
    return true;
  } else {
    Fimber.d('Not connected to any network');
    return false;
  }
}
