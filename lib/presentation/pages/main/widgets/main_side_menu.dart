import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/about/about.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/image_searcher/image_searcher_page.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/log_out_widget.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/main_gradient.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/presentation_constants.dart';
import 'package:interfaces_fedorov_coursework_nao/presentation/pages/main/widgets/profile_image.dart';

class MainSideMenuWidget extends StatefulWidget {
  const MainSideMenuWidget({super.key});

  @override
  State<MainSideMenuWidget> createState() => _MainSideMenuWidgetState();
}

class _MainSideMenuWidgetState extends State<MainSideMenuWidget> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: desktopBoxGradient,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              style: SideMenuStyle(
                displayMode: SideMenuDisplayMode.auto,
                decoration: const BoxDecoration(),
                openSideMenuWidth: 220,
                hoverColor: Colors.blue[100],
                selectedColor: buttonMainColor,
                selectedIconColor: Colors.white,
                unselectedIconColor: Colors.black54,
                backgroundColor: Colors.grey,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                unselectedTitleTextStyle:
                    const TextStyle(color: Colors.black54),
                //iconSize: 20,
                itemBorderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
                showTooltip: true,
                itemHeight: 50.0,
                itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                toggleColor: Colors.black54,
              ),
              // Page controller to manage a PageView
              controller: sideMenu,
              // Will shows on top of all items, it can be a logo or a Title text
              title: const Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  profileImage,
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              footer: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'FEDOROV S.A.',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
              // Notify when display mode changed
              onDisplayModeChanged: (mode) {
                if (kDebugMode) {
                  print(mode);
                }
              },
              // List of SideMenuItem to show them on SideMenu
              items: [
                SideMenuItem(
                  priority: 0,
                  title: 'Главная',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.home),
                ),
                SideMenuItem(
                  priority: 1,
                  title: 'О нас',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.person),
                ),
                SideMenuItem(
                  priority: 2,
                  title: 'Выйти',
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: const [
                  Center(
                    child: ImageSearcherWidget(),
                  ),
                  Center(
                    child: AboutPage(),
                  ),
                  Center(
                    child: LogoutPlaceholderWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
