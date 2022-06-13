import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '../../model/tour_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/network/network_constants.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../product/enum/safety_tour_url_enum.dart';
import '../../model/category_dd_model.dart';
import '../../model/field_dd_model.dart';
import '../../model/location_dd_model.dart';
import '../../model/finding_model.dart';
import '../../model/user_dd_model.dart';

class UnPlannedTourService {
  static UnPlannedTourService? _instance;
  static UnPlannedTourService? get instance {
    if (_instance == null) _instance = UnPlannedTourService._init();
    return _instance;
  }

  UnPlannedTourService._init();

  final dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
    headers: {"Content-Type": "application/json"},
  ));

  Future<TourModel?> createUnplannedTourMobile(
      TourModel tour, BuildContext context) async {
    final response = await dio.post(
      SafetyTourURLs.CreateUnplannedTourMobile.rawValue,
      data: json.encode(tour.toJson()),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        return TourModel.fromJson(responseBody);
      default:
        return null;
    }
  }

  Future<bool> deleteTour(int id) async {
    final response = await dio.post(SafetyTourURLs.DeleteTour.rawValue,
        queryParameters: {"id": "$id"});
    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;
      default:
        return false;
    }
  }

  Future<TourModel?> updateUnplannedTour(TourModel tour) async {
    final response = await dio.post(SafetyTourURLs.UpdateTourMobile.rawValue,
        data: json.encode(
          tour.toJson(),
        ));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        return TourModel.fromJson(responseBody);
      default:
        return null;
    }
  }

  Future<List<TourModel>?> getUnplannedTours() async {
    final response = await dio.post(
      SafetyTourURLs.GetAllUnplannedTours.rawValue,
      options: Options(headers: {
        'Authorization':
            'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.ACCESSTOKEN_SAFETYTOUR)}',
      }),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        if (responseBody is List && responseBody.isNotEmpty) {
          print(responseBody);
          return responseBody.map((e) => TourModel.fromJson(e)).toList();
        }
        return Future.error(responseBody);
    }
  }

  Future<TourModel?> getTourById(int id) async {
    final response = await dio.post(
      SafetyTourURLs.GetTourByIdMobile.rawValue,
      queryParameters: {"id": "$id"},
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        if (responseBody is Map<String, dynamic>) {
          return TourModel.fromJson(responseBody);
        }
        return null;
    }
  }

  Future<List<TourModel>?> getUnplannedTourFindings() async {
    final response = await dio.post(SafetyTourURLs.GetAllTours.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];

        if (responseBody is List) {
          return responseBody
              .map((e) => TourModel.fromJson(e))
              .where((element) => element.isPlanned == false)
              .toList();
        }
        return Future.error(responseBody);
    }
  }

  Future<FindingModel?> getFindingById(int tourId, int findingId) async {
    final response = await dio.post(SafetyTourURLs.GetTourByIdMobile.rawValue,
        queryParameters: {"id": "$tourId"});

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        if (responseBody is Map<String, dynamic>) {
          final tour = TourModel.fromJson(responseBody);
          return (tour.findings
                  ?.firstWhere((element) => element.id == findingId)) ??
              null;
        }
        return null;
    }
  }

  Future<List<CategoryDDModel>?> getCategories() async {
    final response = await dio.post(SafetyTourURLs.GetAllCategories.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];

        if (responseBody is List) {
          return responseBody.map((e) => CategoryDDModel.fromJson(e)).toList();
        }
        return Future.error(responseBody);
    }
  }

  Future<List<dynamic>?> getJsonCategories() async {
    final response = await dio.post(SafetyTourURLs.GetAllCategories.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];

        return responseBody;
    }
    return [];
  }

  Future<List<LocationDDModel>?> getLocations() async {
    final response = await dio.post(SafetyTourURLs.GetAllLocations.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];

        if (responseBody is List) {
          return responseBody.map((e) => LocationDDModel.fromJson(e)).toList();
        }
        return Future.error(responseBody);
    }
  }

  Future<List<dynamic>?> getJsonLocations() async {
    final response = await dio.post(SafetyTourURLs.GetAllLocations.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        return responseBody;
    }
    return [];
  }

  Future<List<FieldDDModel>?> getFields() async {
    final response = await dio.post(SafetyTourURLs.GetAllFields.rawValue);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        if (responseBody is List) {
          return responseBody.map((e) => FieldDDModel.fromJson(e)).toList();
        }
        return Future.error(responseBody);
    }
  }

  Future<List<dynamic>?> getJsonFields() async {
    final response = await dio.post(SafetyTourURLs.GetAllFields.rawValue);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];

        final retval = responseBody.map((item) {
          return {
            "id": item["id"],
            "name": item["name"],
            "locationId": item['locationId'],
          };
        }).toList();

        return retval;
    }
    return null;
  }

  Future<List<UserDDModel>?> getUsers() async {
    final response = await dio.post(SafetyTourURLs.GetUsers.rawValue);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"]["items"];
        if (responseBody is List) {
          return responseBody.map((e) => UserDDModel.fromJson(e)).toList();
        }
        return Future.error(responseBody);
    }
  }

  Future<dynamic> approveTour(int tourId) async {
    final response = await dio.post(
      SafetyTourURLs.FinalizeTourCreation.rawValue,
      queryParameters: {"tourId": "$tourId"},
    );

    switch (response.statusCode) {
      case HttpStatus.ok:
        return response.data["result"];
      default:
        return Future.error(response.data);
    }
  }
}
