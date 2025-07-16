import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/QariModel/qari_model.dart';
import 'package:iqra360/Model/utils/Routes/routes_name.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/Surah/SurahListScreen/quran_api_services.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/Surah/surah_screen.dart';
import 'package:just_audio/just_audio.dart';

class AudioSurahsScreen extends StatefulWidget {
  // final Qari qari;
  const AudioSurahsScreen({super.key});

  @override
  State<AudioSurahsScreen> createState() => _AudioSurahsScreenState();
}

class _AudioSurahsScreenState extends State<AudioSurahsScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int? _currentlyPlayingIndex;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Audio Screen'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
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
              top: 5,
              left: 0,
              right: 0,
              bottom: 0,
              child: FutureBuilder(
                future: QuranApiService.fetchSurahList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Failed to load Surahs",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Surahs Found",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final surahs = snapshot.data!;

                  return ListView.builder(
                    itemCount: surahs.length,
                    itemBuilder: (context, index) {
                      final surah = surahs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: InkWell(
                          onTap: () => Get.toNamed(RoutesName.SurahScreen),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: ListTile(
                              title: Text(
                                "${surah['englishName']}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              subtitle: Text(
                                '${surah['name']}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                ),
                              ),
                              trailing: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                  radius: 15.r,
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 30.sp,
                                  ),
                                ),
                              ),

                              // IconButton(
                              //   icon: Icon(
                              //     Icons.play_circle,
                              //     color: Colors.white,
                              //     size: 30,
                              //   ),
                              //   onPressed: () async {},
                              // ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
