import 'package:iqra360/Data/Network/base_api_services.dart';
import 'package:iqra360/Data/Network/network_api.dart';
import 'package:iqra360/Model/Api/suarah_model.dart';
import 'package:iqra360/Model/res/app_url.dart';

class SurahRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SurahApiModel> fetchSurahList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.surahListendPoint,
      );
      return response = SurahApiModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
