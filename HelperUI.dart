import 'package:flutter/material.dart';

Widget circle(int count , String label){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(shape: BoxShape.circle , border: Border.all(color: Colors.grey.withOpacity(0.5)), color: label == 'Total' ? Colors.black  : Colors.white),
          child: Center(child: Text(count.toString() , style: TextStyle(color: label == 'Total' ? Colors.white : Colors.black),)),
        ),
        const SizedBox(height: 3,),
        Text(label , style: const TextStyle(fontSize: 14),),
      ]);
}


Widget onlyText({required String lable , required double fontSize, required Color color , required FontWeight fontWeight }) {

  return Text(lable , style: TextStyle(fontSize: fontSize, fontWeight: fontWeight , color: color , ));

}