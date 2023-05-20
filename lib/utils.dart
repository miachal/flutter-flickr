class Utils {
  static String fullImageSize(String url) {
    return url.replaceFirst('_m.', '_b.');
  }
}
