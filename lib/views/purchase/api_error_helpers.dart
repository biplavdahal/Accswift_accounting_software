import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showApiError(DioError e) {
  final _statusCode = e.response?.statusCode;

  if (_statusCode == 401) {
    Fluttertoast.showToast(
      msg: 'Not an authorized user.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 500) {
    Fluttertoast.showToast(
      msg: 'Something went wrong with server. Try again later.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 404) {
    Fluttertoast.showToast(
      msg: 'Resource not found.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 400) {
    Fluttertoast.showToast(
      msg: 'Bad Request.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 403) {
    Fluttertoast.showToast(
      msg: 'Invalid Username or Password.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 406) {
    Fluttertoast.showToast(
      msg: 'Not Acceptable.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 413) {
    Fluttertoast.showToast(
      msg: 'Request Entity Too Large.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 415) {
    Fluttertoast.showToast(
      msg: 'Unsupported Media Type.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 500) {
    Fluttertoast.showToast(
      msg: 'Internal Server Error.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 502) {
    Fluttertoast.showToast(
      msg: 'Bad Gateway.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 503) {
    Fluttertoast.showToast(
      msg: 'Service Unavailable.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 504) {
    Fluttertoast.showToast(
      msg: 'Gateway Timeout.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else {
    Fluttertoast.showToast(
      msg: 'Something went wrong. Contact system admin/developer.',
      toastLength: Toast.LENGTH_LONG,
    );
  }
}

showError(e) {
  if (e is DioError) {
    showApiError(e);
  } else {
    Fluttertoast.showToast(
      msg: 'Something unexpected occured.',
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
