import 'package:flutter/material.dart';
import 'package:flutterapps/Utils/myStyle.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 170),
      width: double.infinity,
      height: 350,
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80.0))),
      child:  const Column(
        children: [
          CircleAvatar(),
          SizedBox(
            height: 10,
          ),
          Text("Sainath Hiwale", style: titleprofile),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 16.0,
                color: Colors.grey,
              ),
              Text(
                "Pune",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "121",
                    style: countText,
                  ),
                  Text(
                    "posts",
                    style: followText,
                  ),
                ],
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                children: [
                  Text(
                    "121",
                    style: countText,
                  ),
                  Text(
                    "posts",
                    style: followText,
                  ),
                ],
              ),
              SizedBox(
                width: 24.0,
              ),
              Column(
                children: [
                  Text(
                    "121",
                    style: countText,
                  ),
                  Text(
                    "posts",
                    style: followText,
                  ),
                ],
              ),
              SizedBox(
                width: 24.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
