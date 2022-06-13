import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';

import '../../../../../../product/enum/safety_tour_url_enum.dart';
import '../../../../../core/constants/network/network_constants.dart';
import '../../../../../product/common/_product/_model/finding_file.dart';
import '../../../model/finding_model.dart';
import '../../../model/tour_model.dart';
import '../../../unplanned_tours/subview/unplanned_tour_detail/model/finding_entry_model.dart';
import '../../service/planned_tour_service.dart';

class PlannedTourDetailService {
  static PlannedTourDetailService? _instance;
  static PlannedTourDetailService? get instance {
    if (_instance == null) _instance = PlannedTourDetailService._init();
    return _instance;
  }

  PlannedTourDetailService._init();

  final dio = Dio(
    BaseOptions(
      baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
      headers: {"Content-Type": "application/json-patch+json"},
    ),
  );

  Future<FindingModel?> createFindingForTour(
    FindingEntryModel finding,
    int tourId,
  ) async {
    final response = await dio.post(
        SafetyTourDetailsURLs.CreateFindingForTour.rawValue,
        data: json.encode(finding.toJson()),
        queryParameters: {"tourId": tourId});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];
        return FindingModel.fromJson(responseBody);
      default:
        return response.data["result"];
    }
  }

  Future<void> uploadFindingFile(File fileInput, int findingId) async {
    var formDio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.BASE_URL_TEMPLATE,
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    );
    List<String> mimeType = lookupMimeType(fileInput.path)!.split("/").toList();

    String type = mimeType[0];
    String subType = mimeType[1];
    String fileName = basename(fileInput.path);

    FormData formData = FormData.fromMap({
      "files": [
        await MultipartFile.fromFile(fileInput.path,
            filename: fileName, contentType: MediaType(type, subType)),
      ],
    });

    var response = await formDio.post(
      SafetyTourDetailsURLs.UploadFiles.rawValue,
      data: formData,
      queryParameters: {"findingId": findingId},
    );

    final result = json.decode(response.toString())['result'];
    print(result);
  }

  Future<FindingFile?> uploadFindingFiles(
      List<File?> items, int findingId) async {
    for (var item in items) {
      await uploadFindingFile(item ?? File(""), findingId);
    }
    return null;
  }

  Future<List<FindingFile>?> getFindingFiles(int findingId) async {
    final response = await dio.post(
        SafetyTourDetailsURLs.GetFindingFiles.rawValue,
        queryParameters: {"findingId": findingId});
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = await response.data["result"];

        if (responseBody is List) {
          return responseBody.map((e) => FindingFile.fromJson(e)).toList();
        }
        return Future.error(responseBody);
    }
    return Future.error(response);
  }

  Future<TourModel?> deleteFinding(int findingId, int tourId) async {
    final response = await dio.post(
        SafetyTourDetailsURLs.RemoveFindingFromTour.rawValue,
        queryParameters: {"findingId": "$findingId"});
    if (response.statusCode == HttpStatus.ok) {
      final refreshedTour = PlannedTourService.instance!.getTourById(tourId);
      return refreshedTour;
    }
    return null;
  }

  Future<bool> deleteFindingFile(int findingId, String fileName) async {
    final response = await dio.post(
        SafetyTourDetailsURLs.RemoveFindingFile.rawValue,
        queryParameters: {"findingId": "$findingId", "fileName": fileName});

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }
    return false;
  }

  Future<List<FindingModel>>? getFindings(int tourId) async {
    final response = await dio.post(
      SafetyTourDetailsURLs.GetFindingsOfTourMobile.rawValue,
      queryParameters: {"tourId": "$tourId"},
    );
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = await response.data["result"];
      if (responseBody is List) {
        return responseBody.map((e) => FindingModel.fromJson(e)).toList();
      }
      return Future.error(responseBody);
    }
    return Future.error(response);
  }
}
