import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/home_page.dart';
import '../theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: Colors.black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Center(
        child: Text(
          'search page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          "Upload Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          "Activity Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      ),
      Center(
        child: Text(
          "Account Page",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: white),
        ),
      )
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: appBarColor,
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     Text(
        //       "Instagram",
        //       style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
        //     ),
        //     Expanded(
        //       child: Container(),
        //     ),
        //     SvgPicture.asset(
        //       "assets/images/upload_icon.svg",
        //       width: 30,
        //     ),
        //     SizedBox(
        //       width: 20,
        //     ),
        //     SvgPicture.asset(
        //       "assets/images/love_icon.svg",
        //       width: 30,
        //     ),
        //     SizedBox(
        //       width: 20,
        //     ),
        //     SvgPicture.asset(
        //       "assets/images/message_icon.svg",
        //       width: 30,
        //     ),
        //   ],
        // ),
      );
    } else if (pageIndex == 1) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Search"),
      );
    } else if (pageIndex == 2) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Upload"),
      );
    } else if (pageIndex == 3) {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Activity"),
      );
    } else {
      return AppBar(
        backgroundColor: appBarColor,
        title: Text("Account"),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      "",
      "",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // children: List.generate(
          //   bottomItems.length,
          //   (index) {
          //     return InkWell(
          //       onTap: () {
          //         setState(() {
          //           pageIndex = index;
          //         });
          //       },
          //       child: index == 2
          //           ? Container(
          //               width: 27,
          //               height: 27,
          //               child: Image.asset(
          //                   "assets/images/instagram-reels-dark.png"),
          //             )
          //           : index == 3
          //               ? Container(
          //                   width: 27,
          //                   height: 27,
          //                   child:
          //                       Image.asset("assets/images/instagram-shop.png"),
          //                 )
          //               : SvgPicture.asset(
          //                   bottomItems[index],
          //                   width: 27,
          //                 ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
