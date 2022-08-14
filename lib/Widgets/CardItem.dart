import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  int itemNo = 0;
  FlipCardController controller=FlipCardController();
  CardItem({Key? key, required this.itemNo,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      controller: controller,
          flipOnTouch: false,
          front: Container(
            height: 70,
            width: 70,
            child: Icon(Icons.question_mark,color: Colors.blue,size: 50,),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade400),
          ),
          back: Container(
            height: 70,
            width: 70,
            child: Center(child: Text(itemNo.toString(),style: TextStyle(fontSize: 30,color: Colors.white),)),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red.shade400),
          ));
  }
}
