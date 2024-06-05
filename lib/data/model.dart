

import 'package:flutter/material.dart';

class TextModel {
  String type;
    String content;
    double fontsize;
    String color_code;
    String alignment;



    TextModel({
         required this.type,
     
        required this.content,
        required this.fontsize,
        required this.color_code,
        required this.alignment,

    });

}


class ButtonModel {
    String type;

    String content;
    double fontsize;
    String color_code;
    String background;
    String alignment;



    ButtonModel({
               required this.type,

        required this.content,
        required this.fontsize,
        required this.color_code,
         required this.background,
                 required this.alignment,

    });

}




class TextControlModel {
    TextEditingController content_controler;
    TextEditingController fontsize_controler;

    



    TextControlModel({
               required this.content_controler,
               required this.fontsize_controler,

       

    });

}

