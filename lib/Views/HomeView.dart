import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memory_cards/Controller/HomeController.dart';

class HomeView extends StatefulWidget{
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var _controller=Get.put(HomeController());
    return Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Obx(() {
            if(_controller.finished.value){
              return  AlertDialog(
                  title: Text("Congratulations"),
                  content: Text("You won in ${_controller.turns} turns."),
                  actions: [
                    ElevatedButton(onPressed: () async {
                      await Get.deleteAll();
                      Get.offAll(HomeView());
                    }, child: Text("Restart"))
                  ]
              );
            }
            return SizedBox();
          }),
          for(int i=0;i<6;i++) Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize:MainAxisSize.max,children: [for(int j=0;j<3;j++) _controller.allcards[i*3+j]],)
        ],
      ))
    );
  }
}