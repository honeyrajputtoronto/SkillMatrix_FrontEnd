import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_data.dart';
import 'dart:async';
import 'dart:convert';
//import '../../login/views/login_view.dart';
import '../controllers/leaderboard_controller.dart';
//import '../../../routes/app_pages.dart';
//import 'package:flutter_svg/svg.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.startTimer();
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("assets/images/virtual.jpg"),
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
        child : Obx(()=>controller.isLoaded.isTrue ? Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 4 , vertical : Get.height / 8),
          child: SizedBox(
            height: Get.height / 3,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 2,
            //         blurRadius: 4,
            //         offset: const Offset(0, 2),
            //       ),
            //     ]),
            child: Column(
              children :[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          // spreadRadius: 2,
                          // blurRadius: 4,
                          // offset: const Offset(0, 2),
                        ),
                      ]),
                  child:  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children :[
                        const Text("Competition",style: TextStyle(color: Colors.white, fontSize: 40),),
                        const SizedBox(width: 40,),
                        const Text("Ranking",style: TextStyle(color: Colors.white, fontSize: 20),),
                        const SizedBox(width: 30,),
                        Text("${controller.responseData["score"].length}",style: const TextStyle(color: Colors.white, fontSize: 20),),
                        const SizedBox(width: 10,),
                        const Text("(No. of Participants)",style: TextStyle(color: Colors.white, fontSize: 20),),
                      ]
                    ),
                  ),
                ),
                 Container(
                   decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           // spreadRadius: 2,
                           // blurRadius: 4,
                           // offset: const Offset(0, 2),
                         ),
                       ]),
                   height: Get.height *0.5 ,
                   width: Get.width / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 50.0),
                    child: ListView.builder(
                        itemCount: controller.responseData["score"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: Text("${index+1}",style: const TextStyle(color: Colors.white, fontSize: 25),),
                              title: Text(
                                "${controller.responseData["score"][index]["user__username"]}",
                                style: const TextStyle(color: Colors.green, fontSize: 25),
                              ),
                             trailing: Text(
                                "${controller.responseData["score"][index]["Score"]}",
                                style: const TextStyle(color: Colors.white, fontSize: 25),
                              ),
                          );
                        }),
                  ),
                 ),
                const SizedBox(height: 20,),
                Obx(()=>Text("Redirecting in ${controller.current.value} seconds..." ,style: const TextStyle(color: Colors.white, fontSize: 40),),)
              ]
          ),
        )
      ): const Center(child: CircularProgressIndicator(),),
      ),
      ),
    );
  }
}
