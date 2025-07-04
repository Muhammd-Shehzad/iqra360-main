import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra360/Model/Surah/AlQuran/al_quran_view_model.dart';
import 'package:iqra360/Model/utils/ArbicText/arbic_text.dart';
import 'package:provider/provider.dart';

class AlQuran extends StatefulWidget {
  const AlQuran({super.key});

  @override
  State<AlQuran> createState() => _AlQuranState();
}

class _AlQuranState extends State<AlQuran> {
  @override
  Widget build(BuildContext context) {
    final alQuranViewModel = Provider.of<AlQuranViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            'الْبَقَرَة',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          '۲',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'آل عمران',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D47A1).withOpacity(0.9), Color(0xFF1A237E)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -15.h,
              left: -10.w,
              right: -10.w,
              child: Image.asset(
                'assets/splash3.png',
                height: 200.h,
                width: 300.w,
              ),
            ),
            Positioned(
              top: -250.h,
              right: -90.w,
              child: Image.asset('assets/backGroundImage.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1A237E),
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: alQuranViewModel.surahList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ArbicText(
                                  text: alQuranViewModel.surahList[index],
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(height: 20.h),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 10),
      //         child: ListView.builder(
      //           shrinkWrap: true,
      //           physics: NeverScrollableScrollPhysics(),
      //           itemCount: 30,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.symmetric(
      //                 horizontal: 10,
      //                 vertical: 10,
      //               ),
      //               child: Column(
      //                 children: [
      //                   Container(
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(
      //                       color: Colors.white.withOpacity(0.1),
      //                       borderRadius: BorderRadius.circular(12.r),
      //                       // border: Border.all(color: Colors.cyan),
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
      //                       crossAxisAlignment:
      //                           CrossAxisAlignment.start,
      //                       children: [
      //                         Padding(
      //                           padding: const EdgeInsets.symmetric(
      //                             horizontal: 10,
      //                             vertical: 6,
      //                           ),
      //                           child: Align(
      //                             alignment: Alignment.topRight,
      //                             child: CircleAvatar(
      //                               radius: 16.r,
      //                               backgroundColor: Colors.white,
      //                               child: CircleAvatar(
      //                                 radius: 14.r,
      //                                 backgroundColor: Color(
      //                                   0xFF1A237E,
      //                                 ),
      //                                 child: Text(
      //                                   '${index + 1}',
      //                                   style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontSize: 20.sp,
      //                                     fontWeight: FontWeight.w600,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.symmetric(
      //                             horizontal: 10,
      //                             vertical: 6,
      //                           ),
      //                           child: Text(
      //                             'قُلْ يَا أَيُّهَا الْكَافِرُونَ لَا أَعْبُدُ مَا تَعْبُدُونَوَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُوَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْوَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ لَكُمْ دِينُكُمْ وَلِيَ دِينِ',
      //                             style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 25.sp,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(height: 10.h),
      //                   InkWell(
      //                     onTap: () {
      //                       Get.toNamed(RoutesName.TranslationScreen);
      //                     },
      //                     child: Container(
      //                       height: 50.h,
      //                       width: 150.w,
      //                       decoration: BoxDecoration(
      //                         color: Colors.cyanAccent.withOpacity(0.7),
      //                         borderRadius: BorderRadius.circular(10.r),
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.black,
      //                             blurRadius: 12,
      //                             spreadRadius: 1,
      //                             offset: const Offset(
      //                               0,
      //                               6,
      //                             ), // shadow position
      //                           ),
      //                         ],
      //                       ),
      //                       child: Center(
      //                         child: Text(
      //                           'Translation',
      //                           style: TextStyle(
      //                             color: Colors.white,
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 18.sp,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //       SizedBox(height: 20),
      //     ],
      //   ),
      // ),
      // ),
    );
  }
}


// List.generate(verses.length, (index) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 10,
//                             ),
//                             child: Text(
//                               verses[index],
//                               textAlign: TextAlign.right,
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: Colors.white,
//                                 fontFamily: 'Kitab',
//                               ),
//                             ),
//                           ),
//                           Divider(
//                             color: Colors.white,
//                             thickness: 1,
//                             indent: 0,
//                             endIndent: 0,
//                           ),
//                         ],
//                       );
//                     }),