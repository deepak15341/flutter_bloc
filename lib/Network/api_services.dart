import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_exceptions.dart';
import 'endpoints.dart';

class ApiService {
 final Dio dio;
 ApiService(this.dio);

  dynamic postRequest(String subUrl, Map<String, dynamic> inputData,
      {bool withFile = false,
      bool cacheRequest = true,
      bool forceRefresh = false}) async {
    try {
      String url = "${Endpoint.baseUrl}$subUrl";
      debugPrint('---POST url $url');
      debugPrint('---Params $inputData');
      Options option = Options(
        contentType: withFile ? 'multipart/form-data' : Headers.jsonContentType,
      );
      Response res = await dio.post(
        url,
        data: withFile ? FormData.fromMap(inputData) : inputData,
        options: option,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromString(dioError.response.toString());
    }
  }

  dynamic getRequest(String subUrl,
      {Map<String, dynamic> data = const {},
      bool cacheRequest = true,
      bool forceRefresh = false}) async {
    try {
      String url = "${Endpoint.baseUrl}$subUrl";

      debugPrint('---GET url $url');
      debugPrint('---Params $data');

      Options option = Options(
        contentType: Headers.jsonContentType,
      );
      Response res = await dio.get(
        url,
        queryParameters: data,
        options: option,
      );
      debugPrint('---RESULT: ${res.data}');
      if (res.statusCode == 200) {
        var rData = res.data;
        debugPrint('---RESULT END');
        return rData;
      } else if (res.statusCode == 404) {
        var errorResponse = res.data['error'];
        throw ApiException.fromString("Error Occurred: $errorResponse");
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromDioError(dioError);
    }
  }

  dynamic putRequest(String subUrl, Map<String, dynamic> inputData,
      {bool withFile = false,
      bool cacheRequest = true,
      bool forceRefresh = false}) async {
    try {
      String url = "${Endpoint.baseUrl}$subUrl";

      debugPrint('---PUT url $url');
      debugPrint('---Params $inputData');
      Options option = Options(
        contentType: Headers.formUrlEncodedContentType,
      );
      Response res = await dio.put(
        url,
        data: withFile ? FormData.fromMap(inputData) : inputData,
        options: option,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromDioError(dioError);
    }
  }

  dynamic patchRequest(String subUrl, Map<String, dynamic> inputData,
      {bool withFile = false,
      bool cacheRequest = true,
      bool forceRefresh = false}) async {
    try {
      String url = "${Endpoint.baseUrl}$subUrl";

      debugPrint('---PATCH url $url');
      debugPrint('---Params $inputData');
      Options option = Options(
        contentType: Headers.formUrlEncodedContentType,
      );
      Response res = await dio.patch(
        url,
        data: withFile ? FormData.fromMap(inputData) : inputData,
        options: option,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromDioError(dioError);
    }
  }
}
