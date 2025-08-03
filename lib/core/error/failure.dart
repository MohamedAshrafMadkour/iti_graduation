import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);

  @override
  String toString() => errorMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('⏳ Connection Timeout! Please try again later.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('🚀 Send Timeout! Unable to reach the server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          '⏳ Receive Timeout! The server took too long to respond.',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure('🔒 Security Error! Invalid server certificate.');
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final data = dioException.response?.data;
        return ServerFailure.fromResponse(statusCode, data);
      case DioExceptionType.cancel:
        return ServerFailure('❌ Request Canceled! You canceled the request.');
      case DioExceptionType.connectionError:
        return ServerFailure(
          '🌐 Connection Error! Please check your internet.',
        );
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure(
            '📶 No Internet Connection! Please check your network.',
          );
        } else {
          return ServerFailure(
            '⚠️ Oops! Something went wrong, please try again.',
          );
        }
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure('⚠️ Unknown Error! Please try again.');
    }

    final errorDetails =
        response?['error']?['message'] ?? 'Unknown error occurred.';

    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('🔑 Authentication Error! $errorDetails');
    } else if (statusCode == 404) {
      return ServerFailure('🔍 Not Found! $errorDetails');
    } else if (statusCode == 500) {
      return ServerFailure('🛠️ Server Error! $errorDetails');
    } else {
      return ServerFailure('⚠️ Unexpected Error! $errorDetails');
    }
  }
}
