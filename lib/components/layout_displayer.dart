import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:sidp_masters/components/layout_controller.dart';


class LayoutDisplayer extends StatefulWidget {
  const LayoutDisplayer(
      {Key? key, this.initialPageToDisplay = 0, required this.controller})
      : super(key: key);

  final int initialPageToDisplay;
  final LayoutController controller;

  @override
  State<LayoutDisplayer> createState() => _LayoutDisplayerState();
}

class _LayoutDisplayerState extends State<LayoutDisplayer> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = widget.controller.getPageController();
    super.initState();
  }

  void jumpToPage(int pageToDisplay) {
    setState(() {
      widget.controller.jumpToPage(pageToDisplay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Flexible(
        flex: 1,
        child: SideMenu(
          controller: _pageController,
          style: SideMenuStyle(
            // showTooltip: false,
            displayMode: SideMenuDisplayMode.auto,
            hoverColor: Colors.blue[100],
            selectedColor: Colors.lightBlue,
            selectedTitleTextStyle: const TextStyle(color: Colors.white),
            selectedIconColor: Colors.white,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            // backgroundColor: Colors.blueGrey[700]
          ),
          title: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  maxWidth: 150,
                ),
                child: Image.asset(
                  'images/sidp_logo_splash.png',
                ),
              ),
              const Divider(
                indent: 8.0,
                endIndent: 8.0,
              ),
            ],
          ),
          footer: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'mohada',
              style: TextStyle(fontSize: 15),
            ),
          ),
          items: [
            SideMenuItem(
              priority: 0,
              title: 'Dashboard',
              onTap: () {
                jumpToPage(0);
              },
              icon: const Icon(Icons.home),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              tooltipContent: "This is a tooltip for Dashboard item",
            ),
            SideMenuItem(
              priority: 1,
              title: 'Users',
              onTap: () {
                jumpToPage(1);
              },
              icon: const Icon(Icons.supervisor_account),
            ),
            SideMenuItem(
              priority: 2,
              title: 'Files',
              onTap: () {
                jumpToPage(2);
              },
              icon: const Icon(Icons.file_copy_rounded),
              trailing: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3),
                    child: Text(
                      'New',
                      style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                    ),
                  )),
            ),
            SideMenuItem(
              priority: 3,
              title: 'Download',
              onTap: () {
                jumpToPage(3);
              },
              icon: const Icon(Icons.download),
            ),
            SideMenuItem(
              priority: 4,
              title: 'Settings',
              onTap: () {
                jumpToPage(4);
              },
              icon: const Icon(Icons.settings),
            ),
            const SideMenuItem(
              priority: 7,
              title: 'Exit',
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      Flexible(flex: 2,child: widget.controller.initPageView())
    ]);
  }
}
