import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mondaytest/Views/screens/screen_log_in.dart';

import '../../homepagestf.dart';
import '../layouts/layout_calls.dart';
import '../layouts/layout_community.dart';
import '../layouts/screen_status.dart';

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 1; // Set the initial tab index (0 for LayoutCommunity, 1 for HomePage, etc.)
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
          // toolbarHeight: 100,
          backgroundColor: Color(0xFF075e55),
      floating: true,
      pinned: true,
      title: Text('Whatsapp'),
      actions: [
        Container(
          width: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.camera_alt_outlined),
              Icon(Icons.search),
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 'logout') {
                    FirebaseAuth.instance.signOut().then((value) => Get.offAll(ScreenLogIn()));
                  }
                  if (value == 'New group') {
                    Get.offAll(ScreenLogIn());
                  }
                  // You can add more items and their corresponding actions here
                },
                itemBuilder: (BuildContext context) {
                  return [
                    'Logout',
                    'New group',
                    'Setting',
                    'Advertise',
                    'Linked Device',
                  ].map((String option) {
                    return PopupMenuItem<String>(
                      value: option.toLowerCase(),
                      child: Text(option),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),

      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          controller: _tabController, // Set the TabController
          tabs: [
            Tab( icon: Icon(Icons.groups),),
            Tab( text: 'Chat',),
            Tab(  text: 'Status',),
            Tab( text: 'Calls',),
          ],
        ),
      ),
    ),
    ], body:TabBarView(
        controller: _tabController, // Set the TabController
        children: [
          LayoutCommunity(),
          HomePage(),
          ScreenStatus(),
          LayoutCalls(),
        ],
      ),
  )
  )
  );



  @override
  void dispose() {
    _tabController.dispose(); // Remember to dispose the TabController to prevent memory leaks.
    super.dispose();
  }
}
