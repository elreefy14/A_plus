import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget courseContainer({context,image,route,isDataExist=true}) {
  return   Padding(
    padding:EdgeInsets.symmetric(
      horizontal: //.1*width screen
      0.05*MediaQuery.of(context).size.width,
    ),
    child: InkWell(
      onTap: (){
        if(isDataExist){
          Navigator.pushNamed(context, route);
        }
        else{
       //   showToast2(msg: 'coming soon', state: ToastStates.ERROR);
        }
      },
      child: Container(
        height: 0.1*MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          //circular edges with radius 10
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),

    ),
  );
}

