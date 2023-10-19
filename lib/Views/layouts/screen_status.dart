import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';


import '../../controller/status_controller.dart';

class ScreenStatus extends StatelessWidget {
  StatusController statusController = Get.put(StatusController());
  // const ScreenStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
            children: [
              ListTile(
                title: Text(
                  'Status',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black),
                ),
                trailing: Icon(
                  Icons.more_vert_outlined,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: Obx(() {
                  // Use Obx to observe changes to selectedStatus
                  if (statusController.selectedStatus.value != null) {
                    // Check if there is a selected status
                    return CircleAvatar(
                      radius: 23,
                      backgroundImage: statusController.selectedStatus.value!.imageStatusPath != null
                          ? FileImage(File(statusController.selectedStatus.value!.imageStatusPath!))
                          : null,
                    );
                  } else {
                    return CircleAvatar(
                      radius: 23,
                    );
                  }
                }),
                title: Text(
                  'My Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Tap to add status update',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Text('Recent update',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.grey),),

                  ],
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 23,
                ),
                title: Text(
                  'User name',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                subtitle: Text(
                  '33 mintes ago',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
        ),
          ),
          Positioned(
            right: 16,
              bottom: 10,
              child: Column(
                children: [
                  // Container(
                  //   height: 60,
                  //   width: 60,
                  //   child: FloatingActionButton(
                  //     mini: true,
                  //     onPressed: () {
                  //
                  //     },
                  //     backgroundColor: Colors.grey.shade300,
                  //     child: Icon(Icons.edit, color: Colors.black, size: 25, ),
                  //   ).paddingOnly(bottom: 15),
                  // ),
                  FloatingActionButton(
                    onPressed: () {
                     statusController.pickImageStatus();
                    },
                    backgroundColor: Color(0xFF075e55),
                    child: Icon(Icons.camera_alt, ),
                  ),

                ],
              ))
        ]
      ),


    );
  }
}
