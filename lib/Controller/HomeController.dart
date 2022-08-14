import 'package:flutter/material.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:memory_cards/Widgets/CardItem.dart';
import 'dart:developer' as dev;

class HomeController extends GetxController {
  List<int> arr = List.generate(18, (index){
    var val=index+1;
    if(val>9){
      return val-9;
    }
    return val;
  });
  var isMoving=false;
  var finished=false.obs;
  var isDone=[];
  List<FlipCardController> controllers =[] ;
  late var allcards;
  int selected1 = 99;
  int selected2 = 99;
  var turns=0;
  @override
  void onInit() {
    super.onInit();
    isDone=List.generate(18, (index) => false);
    controllers=List.generate(18, (index) => FlipCardController());
    arr.shuffle();
    allcards = List.generate(18,
        (index) => InkWell(onTap: () async {
          if(!isDone[index] && !isMoving){
            turns++;
          if(selected1==99 && selected2==99){
              selected1=index;
              controllers[index].toggleCard();
            }
            else if(index!=selected1 && selected2==99){
              selected2=index;
              controllers[index].toggleCard();
              isMoving=true;
              await Future.delayed(Duration(milliseconds: 1000));
              isMoving=false;
              if(arr[selected1]!=arr[selected2]){
                controllers[selected1].toggleCard();
                controllers[selected2].toggleCard();
                selected1=99;
                selected2=99;
              }
              else{
                isDone[selected1]=true;
                isDone[selected2]=true;
                selected1=99;
                selected2=99;
                if(isDone.where((element) => element).length==18){
                 finished.value=true;
                }
              }
            }
            else if(index==selected1){
              controllers[selected1].toggleCard();
              selected1=99;
          }
            dev.log("selected1 : "+selected1.toString()+" selected2 : "+selected2.toString());
        }}, child: CardItem(controller: controllers[index],itemNo: arr[index])));
  }
  @override
  void dispose() {
    turns=0;
    finished.value=false;
    selected1=99;
    selected2=99;
    allcards=[];
    super.dispose();
  }
}
