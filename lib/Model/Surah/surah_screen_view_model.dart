import 'package:flutter/material.dart';


class SurahScreenViewModel extends ChangeNotifier {
  // final _myRepo = SurahRepository();

  // ApiResponse<SurahApiModel> surahList = ApiResponse.loading();

  // setSuraList(ApiResponse<SurahApiModel> response) {
  //   surahList = response;
  //   notifyListeners();
  // }

  // Future<void> fetchSurahListApi() async {
  //   setSuraList(ApiResponse.loading());
  //   _myRepo
  //       .fetchSurahList()
  //       .then((value) {
  //         setSuraList(ApiResponse.completed(value));
  //       })
  //       .onError((Error,  StackTrace) {
  //         setSuraList(ApiResponse.error(Error.toString()));
  //       });
  // }

  // List<SurahApiModel> suraList = [];
  // Future<List<SurahApiModel>> getPostData() async {
  //   var response = await http.get(
  //     Uri.parse('https://api.alquran.cloud/v1/surah'),
  //   );
  //   var maxdata = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (var data in maxdata) {
  //       suraList.add(SurahApiModel.fromJson(data));
  //     }
  //     notifyListeners();

  //     return suraList;
  //   } else {
  //     return suraList;
  //   }
  // }

  List<Map<dynamic, dynamic>> nameData = [
    {
      "name": "سُورَةُ ٱلْفَاتِحَةِ",
      "englishName": "Al-Faatiha",
      "englishNameTranslation": "The Opening",
    },
    {
      "name": "سُورَةُ البَقَرَةِ",
      "englishName": "Al-Baqara",
      "englishNameTranslation": "The Cow",
    },
    {
      "name": "سُورَةُ آلِ عِمۡرَانَ",
      "englishName": "Aal-i-Imraan",
      "englishNameTranslation": "The Family of Imraan",
    },
    {
      "name": "سُورَةُ النِّسَاءِ",
      "englishName": "An-Nisaa",
      "englishNameTranslation": "The Women",
    },
    {
      "name": "سُورَةُ المَائـِدَةِ",
      "englishName": "Al-Maaida",
      "englishNameTranslation": "The Table",
    },
    {
      "name": "سُورَةُ الأَنۡعَامِ",
      "englishName": "Al-An'aam",
      "englishNameTranslation": "The Cattle",
    },
    {
      "name": "سُورَةُ الأَعۡرَافِ",
      "englishName": "Al-A'raaf",
      "englishNameTranslation": "The Heights",
    },
    {
      "name": "سُورَةُ الأَنفَالِ",
      "englishName": "Al-Anfaal",
      "englishNameTranslation": "The Spoils of War",
    },
    {
      "name": "سُورَةُ التَّوۡبَةِ",
      "englishName": "At-Tawba",
      "englishNameTranslation": "The Repentance",
    },
    {
      "name": "سُورَةُ يُونُسَ",
      "englishName": "Yunus",
      "englishNameTranslation": "Jonas",
    },
    {
      "name": "سُورَةُ هُودٍ",
      "englishName": "Hud",
      "englishNameTranslation": "Hud",
    },
    {
      "name": "سُورَةُ يُوسُفَ",
      "englishName": "Yusuf",
      "englishNameTranslation": "Joseph",
    },
    {
      "name": "سُورَةُ الرَّعۡدِ",
      "englishName": "Ar-Ra'd",
      "englishNameTranslation": "The Thunder",
    },
    {
      "name": "سُورَةُ إِبۡرَاهِيمَ",
      "englishName": "Ibrahim",
      "englishNameTranslation": "Abraham",
    },
    {
      "name": "سُورَةُ الحِجۡرِ",
      "englishName": "Al-Hijr",
      "englishNameTranslation": "The Rock",
    },
  ];
}
