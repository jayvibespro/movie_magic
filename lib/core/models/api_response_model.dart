

class ApiResponseModel<T> {
  final T? data;
  final String message;
  final int statusCode;

  bool get success => data != null;

  ApiResponseModel({
    required this.data,
    this.message = "",
    required this.statusCode,
  });
}
