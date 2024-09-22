class CustomException implements Exception {
  dynamic message;
  dynamic statusCode;
  CustomException(this.statusCode, this.message);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "$message";
  }
}
