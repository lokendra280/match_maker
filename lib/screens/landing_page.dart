import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:we_chat/screens/setting_page.dart';

import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/widget/forms/buttons.dart';

import '../dashboard_controller.dart';
import 'home_screen.dart';
import 'main_page.dart';

final _unselectedColor = Colors.white54;
final _selectedColor = Colors.white;

class NavigationConstants {
  static const int nestedHomeNavigationId = 1;
  static const int nestedProjectNavigationId = 2;
  static const int subTabLaptopNavigatorId = 3;
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ListQueue<int> _navigationQueue = ListQueue();

  int index = 0;
  final DashboardController dashboardController =
      Get.put(DashboardController());

  final List<Widget> dashboardWidgets = [
    // HomeScreen(),
    // const ChatScreen(),
    // const SettingPage(),
    //  ProfilePage(),
  
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              alignment: Alignment.center,
              title: Text(
                'Exit App',
                style: Get.textTheme.bodyText2!.copyWith(
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              content: Text(
                'Do you want to exit an App?',
                style: Get.textTheme.bodyText2!.copyWith(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  fontSize: 12,
                ),
              ),
              actions: [
                PrimaryButton(
                  width: 100,
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  title: "No",
                ),
                PrimaryButton(
                  width: 100,
                  onPressed: () => Navigator.of(context).pop(true),
                  //return false when click on "NO"
                  title: "Yes",
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: () async {
        if (dashboardController.index.value == 0) {
          return showExitPopup();
        } else {
          dashboardController.index.value = 0;
          return false;
        }
      },
      child: Scaffold(
          body: Obx(() => IndexedStack(
                index: dashboardController.index.value,
                children: [
                  MainHomeScreen(),
                HomeScreen(),
                //   ChatScreen(),
                //   //SettingPage(),
                 ProfilePage(),
                ],
              )),
          bottomNavigationBar: Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: SC.sH, vertical: SC.sH),
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color.fromRGBO(25, 34, 70, 1),
                  currentIndex: dashboardController.index.value,
                  onTap: dashboardController.onBtnNavTap,
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      color: Colors.green),
                  // color: AppColors.secondaryTextColor),
                  selectedIconTheme: const IconThemeData(),
                  unselectedIconTheme: IconThemeData(color: _unselectedColor),
                  selectedItemColor: _selectedColor,
                  unselectedItemColor: _unselectedColor,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/svg/home_trend.svg",
                        color: dashboardController.index.value == 0
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                      label: "Home".tr,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/svg/message_notification.svg",
                        color: dashboardController.index.value == 1
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                      label: "Inbox".tr,
                    ),
                    // BottomNavigationBarItem(
                    //   icon: SvgPicture.asset(
                    //     "assets/icons/svg/home_trend.svg",
                    //     color: dashboardController.index.value == 2
                    //         ? _selectedColor
                    //         : _unselectedColor,
                    //   ),
                    //   label: "Event".tr,
                    // ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/svg/Activity.svg",
                        color: dashboardController.index.value == 4
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                      label: "Account".tr,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/icons/svg/project.svg",
                        color: dashboardController.index.value == 3
                            ? _selectedColor
                            : _unselectedColor,
                      ),
                      label: "Profile".tr,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
