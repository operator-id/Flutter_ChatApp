import 'dart:ui';

import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255,0, 0, 170);
const kPrimaryLightColor = Color.fromARGB(255, 127, 255, 212); //rgb(77,77,255)  azure - rgb(0,127,255)
const kPrimaryGradient = BoxDecoration(

    gradient: LinearGradient(
  colors: [
    Color.fromRGBO(0, 159, 255, 1),
    Color.fromRGBO(236, 47, 75, 1),
  ],
      begin: Alignment.centerRight,
      end: Alignment.topLeft
//
));
 final kSecondaryGradient = BoxDecoration(

    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(121,194,243,1),
        Color.fromRGBO(255,180,239,1),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,

// background-image: linear-gradient( 114.2deg,  rgba(121,194,243,1) 22.6%, rgba(255,180,239,1) 67.7% );
    ),
    borderRadius: BorderRadius.circular(10),
);