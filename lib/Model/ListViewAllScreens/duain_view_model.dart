import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DuainViewModel extends ChangeNotifier {
    bool isUrdu = Get.locale?.languageCode == 'ur';

  List<Map<dynamic, dynamic>> duaData = [
    {
      'title': 'Dua Before Eating'.tr,
      'dua': 'بِسْمِ اللهِ وَعَلَى بَرَكَةِ اللهِ',
      'tra': 'In the name of Allah and with the blessings of Allah.'.tr,
      'ref': 'Abu Dawood 3767, Ahmad'.tr,
    },
    {
      'title': 'Dua After Eating'.tr,
      'dua':
          ' الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنِي هَذَا وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ',
      'tra':
          'All praise is for Allah who fed me this and provided it for me without any might nor power from myself.'.tr,
      'ref': 'Abu Dawood 4023, Tirmidhi 3458'.tr,
    },
    {
      'title': 'Dua Before Sleeping'.tr,
      'dua': 'بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا',
      'tra': 'In Your name, O Allah, I die and I live.'.tr,
      'ref': 'Bukhari 6324'.tr,
    },
    {
      'title': 'Dua After Waking Up'.tr,
      'dua':
          'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      'tra':
          'Praise is to Allah Who gave us life after He caused us to die, and to Him is the return.'.tr,
      'ref': 'Bukhari 6312, Muslim 2711'.tr,
    },
    {
      'title': 'Dua When Entering the Toilet'.tr,
      'dua': 'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ',
      'tra': 'O Allah, I seek refuge with You from all evil and evil-doers.'.tr,
      'ref': 'Bukhari 142, Muslim 375'.tr,
    },
    {
      'title': 'Dua After Leaving the Toilet'.tr,
      'dua': 'غُفْرَانَكَ',
      'tra': 'I ask You for Your forgiveness.'.tr,
      'ref': 'Abu Dawood 30, Ibn Majah 300'.tr,
    },
    {
      'title': 'Dua When Leaving the House'.tr,
      'dua':
          'بِسْمِ اللهِ تَوَكَّلْتُ عَلَى اللهِ، وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
      'tra':
          'In the name of Allah, I place my trust in Allah, and there is no might nor power except with Allah.'.tr,
      'ref': 'Abu Dawood 5095, Tirmidhi 3426'.tr,
    },
    {
      'title': 'Dua When Entering the House'.tr,
      'dua':
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلِجِ وَخَيْرَ الْمَخْرَجِ',
      'tra':
          'O Allah, I ask You for the best of entrances and the best of exits.'.tr,
      'ref': 'Abu Dawood 5096'.tr,
    },
    {
      'title': 'Dua for Traveling'.tr,
      'dua':
          'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَوَإِنَّا إِلَى رَبِّنَا لَمُنقَلِبُونَ',
      'tra':
          'Glory is to Him Who has made this [vehicle] subservient to us, and we ourselves could never have accomplished it. And verily, to our Lord we are returning.'.tr,
      'ref': 'Muslim 1342'.tr,
    },
    {
      'title': 'Dua When in Distress'.tr,
      'dua':
          'لَا إِلَهَ إِلَّا اللهُ الْعَظِيمُ الْحَلِيمُ، لَا إِلَهَ إِلَّا اللهُ رَبُّ الْعَرْشِ الْعَظِيمِ',
      'tra':
          'There is none worthy of worship except Allah, the Most Great, the Most Forbearing. There is none worthy of worship except Allah, the Lord of the Mighty Throne.'.tr,
      'ref': 'Bukhari 6345, Muslim 2730'.tr,
    },
  ];
}
