
import 'dart:async';

import 'package:flutter/material.dart';


Widget buildTime(Duration duration){
  String twoDigits(int n) => n.toString().padLeft(2,'0');
  var minutes =twoDigits(duration.inMinutes.remainder(60));
  var seconds =twoDigits(duration.inSeconds.remainder(60));
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 8,),
        buildTimeCard(time: seconds, header:'SECONDS'),
        const SizedBox(width: 8,),
        buildTimeCard(time: minutes, header:'MINUTES'),
      ]
  );
}

Widget buildTimeCard({required String time, required String header}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black,fontSize: 25),),
        ),
        const SizedBox(height: 15,),
        Text(header,style: const TextStyle(color: Colors.black45)),
      ],
    );