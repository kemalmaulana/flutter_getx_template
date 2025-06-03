import 'package:url_launcher/url_launcher.dart';

class OpenFileUtil {
  static void openUrl(String url) {
    launchUrl(Uri.parse(url));
  }
}
