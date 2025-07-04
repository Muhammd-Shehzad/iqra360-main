import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Surah/Translation/translation_view_model.dart';
import 'package:iqra360/Model/utils/ArbicText/arbic_text.dart';
import 'package:iqra360/Model/utils/CustomTextRich/custom_text_rich1.dart';

class TranslationPageView extends StatefulWidget {
  const TranslationPageView({super.key});

  @override
  State<TranslationPageView> createState() => _TranslationPageViewState();
}

class _TranslationPageViewState extends State<TranslationPageView> {
  TranslationViewModel translationViewModel = TranslationViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1).withOpacity(0.9),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Surahs'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
             fontFamily: 'Amiri',
          ),
        ),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemCount: translationViewModel.nameData.length,
        itemBuilder: (context, index) {
          return TranslationPageContent();
        },
      ),
    );
  }
}

class TranslationPageContent extends StatelessWidget {
  const TranslationPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final translationViewModel = Provider.of<TranslationViewModel>(context);

    return Container(
      width: double.infinity.h,
      height: double.infinity.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0D47A1).withOpacity(0.9), const Color(0xFF1A237E)],
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF1A237E),
              blurRadius: 10,
              spreadRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: translationViewModel.nameData.length,
          itemBuilder: (context, index) {
            final data = translationViewModel.nameData[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextRich1(
                        text1: data['juzzName'],
                        text2: data['juzzNo'],
                        sizetext1: 18.sp,
                        sizetext2: 18.sp,
                      ),
                      Text(
                        data['pageNo'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextRich1(
                        text1: data['surahName'],
                        text2: data['surahNo'],
                        sizetext1: 18.sp,
                        sizetext2: 18.sp,
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white),
                ArbicText(text: data['tital'], textSize: 18.sp),
                const Divider(color: Colors.white),
                ArbicText(text: data['text'], textSize: 20.sp),
                const Divider(color: Colors.white),
              ],
            );
          },
        ),
      ),
    );
  }
}
