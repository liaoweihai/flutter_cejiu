import 'dart:convert';

// import 'dart:ffi';

class ApiError {
  final Object? error;

  ApiError({this.error});
}

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  Map<String, dynamic>? modelMap;
  List? arrayModel;
  ApiError? apiError;
  ApiResponse.completed(data) {
    data = data;
    status = ApiStatus.apiSuccess;

    if (data != null) {
      if (data is String) {
        final responseObj = jsonDecode(data);
        if (responseObj is Map) {
          modelMap = responseObj.cast<String, dynamic>();
        } else if (responseObj is List) {
          arrayModel = responseObj;
        }
      } else if (data is List) {
        arrayModel = data;
      } else if (data is Map) {
        modelMap = data.cast<String, dynamic>();
      }
    }
  }
  ApiResponse.error(error)
      : status = ApiStatus.apiFailure,
        apiError = ApiError(error: error);

  @override
  String toString() {
    return "Status : $status \n Message : ${apiError?.error} \n Data : $data";
  }
}

enum ApiStatus { apiSuccess, apiFailure }
