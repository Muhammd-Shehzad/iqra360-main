import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iqra360/Model/Setting/setting_view_model.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingViewModel = Provider.of<SettingViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1).withOpacity(0.9),

        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          'Setting'.tr,
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
            colors: [
              Color(0xFF0D47A1).withOpacity(0.9), // Slightly lighter blue
              Color(0xFF1A237E), // Dark blue
            ],
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  const Divider(),

                  // Account
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'Account'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:  Text(
                      'Privacy, security, change number'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Navigate to account settings
                    },
                  ),
                  const Divider(),

                  // Notifications
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    title:  Text(
                      'Notifications'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Message, group & call tones'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Navigate to notifications
                    },
                  ),
                  const Divider(),

                  // Language
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.white),
                    title: Text(
                      'Language'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:  Text(
                      'App language'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Show language selection dialog
                    },
                  ),
                  const Divider(),

                  // Theme
                  ListTile(
                    leading: const Icon(Icons.palette, color: Colors.white),
                    title: Text(
                      'Theme'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:Text(
                      'Light / Dark mode'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Theme change logic
                    },
                  ),
                  const Divider(),

                  // About
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.white),
                    title: Text(
                      'About'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'App version, developer info'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Show about info
                    },
                  ),
                  const Divider(),

                  // Logout
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title:  Text(
                      'Logout'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      settingViewModel.logOut();
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
