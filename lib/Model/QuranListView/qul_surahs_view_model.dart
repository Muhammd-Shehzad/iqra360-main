import 'package:flutter/material.dart';

class QulSurahsViewModel extends ChangeNotifier {
  List<Map<String, dynamic>> surahsData = [
    {
      'name': 'Surah Al-Kafiroun',
      'image': 'assets/sur1.png',
      'translation':
          'کہہ دو: اے کافرو!میں ان کی عبادت نہیں کرتا جن کی تم عبادت کرتے ہو،اور نہ ہی تم ان کی عبادت کرنے والے ہو جن کی میں عبادت کرتا ہوں۔اور نہ میں عبادت کرنے والا ہوں جن کی تم نے عبادت کی،اور نہ ہی تم عبادت کرنے والے ہو جن کی میں عبادت کرتا ہوں۔تمھارے لیے تمھارا دین، اور میرے لیے میرا دین ہے۔',
      'meaning': 'The Unbelievers',
      'arbi':
          'قُلْ يَا أَيُّهَا الْكَافِرُونَ لَا أَعْبُدُ مَا تَعْبُدُونَوَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُوَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْوَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ لَكُمْ دِينُكُمْ وَلِيَ دِينِ',
    },
    {
      'name': 'Surah Al-Ikhlas',
      'image': 'assets/sur2.png',
      'translation':
          'کہہ دو: وہ اللہ ایک ہے، اللہ بے نیاز ہے، نہ اس نے کسی کو جنا ہے اور نہ وہ جنا گیا ہے، اور اس کا کوئی ہمسر نہیں ہے۔',
      'meaning': 'The Sincerity',
      'arbi':
          'قُلْ هُوَ ٱللَّهُ أَحَدٌ ٱللَّهُ ٱلصَّمَدُ لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌ',
    },
    {
      'name': 'Surah Al-Falaq',
      'image': 'assets/sur3.png',
      'translation':
          'کہہ دو: میں صبح کے رب کی پناہ مانگتا ہوں، ہر چیز کی برائی سے جو اس نے پیدا کی، اور رات کے اندھیرے سے جب وہ چھا جائے، اور گنڈوں کے پھونکنے سے، اور حسد کرنے والے کے حسد سے جب وہ حسد کرے۔',
      'meaning': 'The Daybreak',
      'arbi':
          'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ مِن شَرِّ مَا خَلَقَ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
    },
    {
      'name': 'Surah An-Naas',
      'image': 'assets/sur4.png',
      'translation':
          'کہہ دو: میں لوگوں کے رب کی پناہ مانگتا ہوں، لوگوں کے بادشاہ کی، لوگوں کے معبود کی، اس شر سے جو چپکے سے دلوں میں وسوسے ڈالتا ہے، جو لوگوں میں سے ہے۔',
      'meaning': 'The Mankind',
      'arbi':
          'قُلْ أَعُوذُ بِرَبِّ النَّاسِ مَلِكِ النَّاسِ إِلَٰهِ النَّاسِ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ',
    },
  ];

  // void listViewOnTapFun(int index) {
  //   switch (index) {
  //     case 0:
  //       Get.toNamed(RoutesName.AlKafirounScreen, arguments: 0);
  //       break;
  //     case 1:
  //       Get.toNamed(RoutesName.AlIkhlasScreen, arguments: 1);
  //       break;
  //     case 2:
  //       Get.toNamed(RoutesName.AlFalaqScreen, arguments: 2);
  //       break;
  //     case 3:
  //       Get.toNamed(RoutesName.AnNaasScreen, arguments: 3);
  //       break;
  //     default:
  //       Get.to(
  //         () => Scaffold(
  //           body: Center(
  //             child: Container(
  //               height: 100.h,
  //               width: 200.w,
  //               decoration: BoxDecoration(
  //                 color: Color(0xFF1A237E),
  //                 borderRadius: BorderRadius.circular(10.sp),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   'No Route Found',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 18.sp,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //       break;
  //   }
  // }
}
