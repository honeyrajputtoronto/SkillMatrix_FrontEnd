import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/competition_controller.dart';

//List<DateTime> competitionDateTime = [];

class CompetitionView extends GetView<CompetitionController> {
  const CompetitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.offAllNamed(Routes.LOGIN),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Competitions'),
        ),
        body: Obx(
          () => controller.isLoading.isFalse
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        FutureBuilder(
                            future: controller.getCompetitionData(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100),
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: controller.competitions.length,
                                  itemBuilder: (context, index) {
                                   // competitionDateTime[index] =
                                     //   controller.competitions[index].time! as DateTime;
                                    return Card(
                                      color: Colors.white,
                                      child: SizedBox(
                                        height: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                controller.competitions[index]
                                                    .competition
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Competition will start at : ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),

                                                Text(
                                                    controller.competitions[index].time
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                if(DateTime.parse(controller.competitions[index].time!).isAfter(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes: controller.competitions[index].roomTime!)).isBefore(DateTime.now()))){
                                                  Get.showSnackbar(const GetSnackBar(
                                                    message: "Competition not started yet",
                                                    duration: Duration(seconds: 2),
                                                  ));
                                                  return;
                                                }
                                                else if(DateTime.parse(controller.competitions[index].time!).isBefore(DateTime.now()) && !(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now()))) {
                                                await controller.registerParticipant( controller.competitions[index].competitionId!) ;
                                                controller.competitionTime(DateTime.parse(controller.competitions[index].time!) , controller.competitions[index].roomTime! );
                                                Get.toNamed(Routes.DASHBOARD, arguments: controller.competitions[index].roomTime);
                                                controller.onClose();
                                                return;
                                              }
                                               else if(DateTime.parse(controller.competitions[index].time!).add(Duration(minutes:controller.competitions[index].roomTime!)).isBefore(DateTime.now())){
                                                  Get.showSnackbar(const GetSnackBar(
                                                    message: "Competition has begun....",
                                                    duration: Duration(seconds: 2),
                                                  ));
                                                  return;
                                                }
                                                },
                                              style: ElevatedButton
                                                  .styleFrom(
                                                  backgroundColor:
                                                  Colors.green),
                                              child: const Padding(
                                                padding: EdgeInsets.all(
                                                    10.0),
                                                child: Text("Join"),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            })
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Loading Competitions",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
        ));
  }
}
