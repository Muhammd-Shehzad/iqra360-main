// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// import 'package:iqra360/Data/Response/status.dart';
// import 'package:iqra360/Model/Surah/surah_screen_view_model.dart';
// import 'package:iqra360/Model/utils/Routes/routes_name.dart';

// class SurahScreen extends StatefulWidget {
//   const SurahScreen({super.key});

//   @override
//   State<SurahScreen> createState() => _SurahScreenState();
// }

// class _SurahScreenState extends State<SurahScreen> {
//   SurahScreenViewModel surahScreenViewModel = SurahScreenViewModel();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),
//         leading: InkWell(
//           onTap: () => Get.back(),
//           child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
//         ),
//         title: Text(
//           'Surahs',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Container(
//         width: double.infinity.w,
//         height: double.infinity.h,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF0D47A1).withOpacity(0.9), Color(0xFF1A237E)],
//           ),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               bottom: -15.h,
//               left: -10.w,
//               right: -10.w,
//               child: Image.asset(
//                 'assets/splash3.png',
//                 height: 200.h,
//                 width: 300.w,
//               ),
//             ),
//             Positioned(
//               top: -250.h,
//               right: -90.w,
//               child: SizedBox(
//                 height: 100.h,
//                 width: 100.w,
//                 child: Image.asset(
//                   'assets/backGroundImage.png',
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.red,
//                       child: Icon(Icons.error, color: Colors.white),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             ListView.builder(
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
//               itemCount: surahScreenViewModel.nameData.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () => Get.toNamed(RoutesName.TranslationScreen),
//                   child: Container(
//                     height: 50.h,
//                     width: double.infinity.w,
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(12.r),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Color(0xFF1A237E),
//                           blurRadius: 10,
//                           spreadRadius: 4,
//                           offset: Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 10,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     '${index + 1}.',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18.sp,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   Text(
//                                     surahScreenViewModel
//                                         .nameData[index]['englishName'],
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 20.sp,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                               ),
//                               child: Text(
//                                 surahScreenViewModel.nameData[index]['name'],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//  //   if (snapshot.hasData) {
//                     //     return ListView.builder(
//                     //       padding: const EdgeInsets.symmetric(
//                     //         vertical: 20,
//                     //         horizontal: 12,
//                     //       ),
//                     //       itemCount: surahScreenViewModel.suraList.length,
//                     //       itemBuilder: (context, index) {
//                     //         final surah = surahScreenViewModel.suraList[index];

//                     //         return InkWell(
//                     //           onTap: () => Get.toNamed(RoutesName.TranslationScreen),
//                     //           child: Container(
//                     //             margin: const EdgeInsets.symmetric(vertical: 10),
//                     //             decoration: BoxDecoration(
//                     //               color: Colors.white.withOpacity(0.1),
//                     //               borderRadius: BorderRadius.circular(12.r),
//                     //               boxShadow: [
//                     //                 BoxShadow(
//                     //                   color: Color(0xFF1A237E),
//                     //                   blurRadius: 10,
//                     //                   spreadRadius: 4,
//                     //                   offset: Offset(0, 4),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //             child: Column(
//                     //               mainAxisAlignment: MainAxisAlignment.start,
//                     //               children: [
//                     //                 Row(
//                     //                   mainAxisAlignment:
//                     //                       MainAxisAlignment.spaceBetween,
//                     //                   children: [
//                     //                     Padding(
//                     //                       padding: const EdgeInsets.symmetric(
//                     //                         horizontal: 10,
//                     //                       ),
//                     //                       child: Row(
//                     //                         children: [
//                     //                           Text(
//                     //                             surah.data![index].number.toString(),
//                     //                             style: TextStyle(
//                     //                               color: Colors.white,
//                     //                               fontSize: 18.sp,
//                     //                               fontWeight: FontWeight.w400,
//                     //                             ),
//                     //                           ),
//                     //                           Text(
//                     //                             surah.data![index].englishName
//                     //                                 .toString(),
//                     //                             style: TextStyle(
//                     //                               color: Colors.white,
//                     //                               fontSize: 20.sp,
//                     //                               fontWeight: FontWeight.bold,
//                     //                             ),
//                     //                           ),
//                     //                         ],
//                     //                       ),
//                     //                     ),
//                     //                     Padding(
//                     //                       padding: const EdgeInsets.symmetric(
//                     //                         horizontal: 20,
//                     //                       ),
//                     //                       child: Text(
//                     //                         surah.data![index].name.toString(),
//                     //                         style: TextStyle(
//                     //                           color: Colors.white,
//                     //                           fontSize: 18.sp,
//                     //                           fontWeight: FontWeight.bold,
//                     //                         ),
//                     //                       ),
//                     //                     ),
//                     //                   ],
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ),
//                     //         );
//                     //       },
//                     //     );
//                     //   } else {
//                     //     return Center(
//                     //       child: CircularProgressIndicator(color: Colors.white),
//                     //     );
//                     //   }

// // Widget buildAyah(String text, int ayahNumber) {
// //   return Padding(
// //     padding: EdgeInsets.symmetric(vertical: 4.h),
// //     child: Text.rich(
// //       TextSpan(
// //         children: [
// //           TextSpan(text: "$text "),
// //           WidgetSpan(
// //             child: CircleAvatar(
// //               radius: 12.r,
// //               backgroundColor: Colors.grey.shade200,
// //               child: Text(
// //                 '$ayahNumber',
// //                 style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       textAlign: TextAlign.center,
// //     ),
// //   );
// // }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  List<Map<String, dynamic>> surahs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSurahList();
  }

  Future<void> fetchSurahList() async {
    final response = await http.get(
      Uri.parse('http://api.alquran.cloud/v1/surah'),
    );
    final json = jsonDecode(response.body);

    if (json['code'] == 200) {
      setState(() {
        surahs = List<Map<String, dynamic>>.from(json['data']);
        isLoading = false;
      });
    } else {
      throw Exception("Failed to load Surah list");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0D47A1),
        title: Text('Surah List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body:
          isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
              : ListView.builder(
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  final surah = surahs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(
                          SurahDetailScreen(
                            surahNumber: surah['number'],
                            surahName: surah['name'],
                          ),
                        );
                      },
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E3A8A),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    surah['englishName'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              Text(
                                surah['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Amiri',
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  List ayahs = [];
  bool isLoading = true;
  String surahType = '';
  String currentSurah = '';

  @override
  void initState() {
    super.initState();
    fetchSurah();
  }

  Future<void> fetchSurah() async {
    final response = await http.get(
      Uri.parse(
        'http://api.alquran.cloud/v1/surah/${widget.surahNumber}/quran-uthmani',
      ),
    );

    final json = jsonDecode(response.body);
    if (json['code'] == 200) {
      final data = json['data'];
      setState(() {
        ayahs = data['ayahs'];
        surahType = data['revelationType'] == "Meccan" ? "مَكِّيّ" : "مَدَنِيّ";
        currentSurah = data['name'];
        isLoading = false;
      });
    } else {
      throw Exception("Failed to load Surah");
    }
  }

  String getCircularArabicNumber(int number) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final digits = number.toString().split('');
    final arabic = digits.map((d) => arabicDigits[int.parse(d)]).join();
    return '۝$arabic';
  }

  bool isBismillahAyah(Map<String, dynamic> ayah) {
    final cleanText = ayah['text'].replaceAll(RegExp(r'\s+'), '');
    return cleanText == 'بِسْمِاللّٰهِالرَّحْمٰنِالرَّحِیْمِ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        automaticallyImplyLeading: false, // Removes back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              surahType,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'NotoNastaliq',
              ),
            ),
            Text(
              currentSurah,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      body:
          isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: ayahs.length,
                itemBuilder: (context, index) {
                  final ayah = ayahs[index];
                  final isBismillah = isBismillahAyah(ayah);
                  final ayahNumberText =
                      (!isBismillah || (currentSurah == 'سُورَةُ ٱلْفَاتِحَةِ'))
                          ? getCircularArabicNumber(ayah['numberInSurah'])
                          : '';

                  return Card(
                    elevation: 6,
                    shadowColor: Colors.black45,
                    color: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      child: Text(
                        '${ayah['text']} $ayahNumberText',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
