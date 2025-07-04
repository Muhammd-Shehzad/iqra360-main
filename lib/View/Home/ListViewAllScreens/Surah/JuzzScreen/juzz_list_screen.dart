import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Surah/JuzzScreen/juzz_detail_screen.dart';

class JuzListScreen extends StatelessWidget {
  final List<Map<String, String>> paraList = [
    {'arabic': 'الٓمّ', 'roman': 'Alif Laam Meem'},
    {'arabic': 'سَيَقُولُ', 'roman': 'Sayaqool'},
    {'arabic': 'تِلْكَ الرُّسُلُ', 'roman': 'Tilkal Rusul'},
    {'arabic': 'لَنْ تَنَالُوا', 'roman': 'Lan Tanaalu'},
    {'arabic': 'وَالْمُحْصَنَاتُ', 'roman': 'Wal Mohsanaat'},
    {'arabic': 'لَا يُحِبُّ اللَّهُ', 'roman': 'La Yuhibbullah'},
    {'arabic': 'وَإِذَا سَمِعُوا', 'roman': 'Wa Iza Samiu'},
    {'arabic': 'وَلَوْ أَنَّنَا', 'roman': 'Wa Lau Annana'},
    {'arabic': 'قَدْ أَفْلَحَ', 'roman': 'Qad Aflaha'},
    {'arabic': 'وَاعْلَمُوا', 'roman': 'Wa A’lamu'},
    {'arabic': 'يَعْتَذِرُونَ', 'roman': 'Ya’tazerun'},
    {'arabic': 'وَمَا مِنْ دَابَّةٍ', 'roman': 'Wama Min Daabbah'},
    {'arabic': 'وَمَا أُبَرِّئُ', 'roman': 'Wama Ubarri-u'},
    {'arabic': 'رُبَمَا', 'roman': 'Rubama'},
    {'arabic': 'سُبْحَانَ الَّذِي', 'roman': 'Subhanallazi'},
    {'arabic': 'قَالَ أَلَمْ', 'roman': 'Qaal Alam'},
    {'arabic': 'اقْتَرَبَ', 'roman': 'Aqtarabat'},
    {'arabic': 'قَدْ أَفْلَحَ', 'roman': 'Qadd Aflaha'},
    {'arabic': 'وَقَالَ الَّذِينَ', 'roman': 'Wa Qalallazina'},
    {'arabic': 'أَمَّنْ خَلَقَ', 'roman': 'A’man Khalaq'},
    {'arabic': 'اتْلُ مَا أُوحِيَ', 'roman': 'Utlu Ma Uhiya'},
    {'arabic': 'وَمَنْ يَقْنُتْ', 'roman': 'Wa Man Yaqnut'},
    {'arabic': 'وَمَا لِيَ', 'roman': 'Wama Liya'},
    {'arabic': 'فَمَنْ أَظْلَمُ', 'roman': 'Faman Azlam'},
    {'arabic': 'إِلَيْهِ يُرَدُّ', 'roman': 'Ilayhi Yuraddu'},
    {'arabic': 'حم', 'roman': 'Ha Meem'},
    {'arabic': 'قَدْ سَمِعَ', 'roman': 'Qad Sami Allah'},
    {'arabic': 'تَبَارَكَ', 'roman': 'Tabaarak'},
    {'arabic': 'عَمَّ', 'roman': 'Amma Yatasa’alun'},
    {'arabic': 'عَمَّ', 'roman': 'Amma'},
  ];

  final Color bgColor = const Color(0xFF0D47A1);
  final Color cardColor = const Color(0xFF1E3A8A);

   JuzListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        title:  Text(
          'Juzz'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: paraList.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        itemBuilder: (context, index) {
          final para = paraList[index];

          return InkWell(
            onTap: () {
              Get.to(() => JuzDetailScreen(juzNumber: index + 1));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(2, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      para['roman']!.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    para['arabic']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily:
                          'Amiri', // Replace with your preferred Arabic font
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
