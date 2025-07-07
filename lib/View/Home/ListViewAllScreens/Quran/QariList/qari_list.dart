import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/QariModel/qari_model.dart';
import 'package:iqra360/View/Home/ListViewAllScreens/Quran/QariList/qari_view_model.dart';

class QariList extends StatefulWidget {
  const QariList({super.key});

  @override
  State<QariList> createState() => _QariListState();
}

class _QariListState extends State<QariList> {
  QariViewModel qariViewModel = QariViewModel();
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
          'Quran'.tr,
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
                future: qariViewModel.getQariList(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<QariModel>> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Center(child: Text('No Qari Data is Found'));
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator(color: Colors.white);
                  }
                  return ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: 100.h,
                    ), // avoid splash image overlap
                    itemCount: qariViewModel.qariList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: InkWell(
                          onTap: () {
                            
                          },
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white.withOpacity(0.1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 12.w),
                                CircleAvatar(
                                  radius: 25.r,
                                  // backgroundImage: AssetImage(
                                  //   'assets/qari_placeholder.png',
                                  // ), // Optional
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        qariViewModel.qariList[index].name
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        qariViewModel.qariList[index].name
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 10.sp,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
