import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget foodMenu(
    String img, String title, String price){

  return Container(

    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              img,
              height: 100.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Flexible(child: Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            )),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(child: Text("${price}",
                  style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,),
                ),
                ),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}