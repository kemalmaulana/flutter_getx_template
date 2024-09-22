import 'package:url_launcher/url_launcher.dart';

class OpenFileUtil {
  static openUrl(String url) {
    launchUrl(Uri.parse(url));
  }
}
