import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showApiError(DioError e) {
  final _statusCode = e.response?.statusCode;

  if (_statusCode == 401) {
    Fluttertoast.showToast(
      msg: 'You are not an authorized user.Try another user.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 500) {
    Fluttertoast.showToast(
      msg: 'Something went wrong with server. Try again later.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 404) {
    Fluttertoast.showToast(
      msg: 'Resource not found.Try again later.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 400) {
    Fluttertoast.showToast(
      msg: 'Bad Request.Try again later.',
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.amber,
    );
  } else if (_statusCode == 403) {
    Fluttertoast.showToast(
      msg: 'You are not authorized to access this resource.',
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
      msg: 'Unsupported Media Type.Please Try again later.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 500) {
    Fluttertoast.showToast(
      msg: 'Internal Server Error.Please try again later.',
      toastLength: Toast.LENGTH_LONG,
    );
  } else if (_statusCode == 502) {
    Fluttertoast.showToast(
      msg: 'Bad Gateway :( Please try again later.',
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
        msg:
            'Opps :( !! Something went wrong.Please check your internet connection and try again later.',
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red);
  }
}

showError(e) {
  if (e is DioError) {
    showApiError(e);
  } else {
    Fluttertoast.showToast(
      msg: 'Something unexpected occured. Please try again later.',
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
