import 'package:flutter/material.dart';
import 'package:flutter_sales_graph/flutter_sales_graph.dart';

class Achievement extends StatefulWidget {
  @override
  State<Achievement> createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Achievement",style: TextStyle(fontFamily: "OpenSans",fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.shade400),),
                  Spacer(),
                  Text("42",style: TextStyle(fontFamily: "OpenSans",fontSize: 35),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("MEDAL POINTS",style: TextStyle(fontFamily: "OpenSans",fontSize: 13,fontWeight: FontWeight.w600,color: Colors.grey.shade400),),
                ],
              ),
            ),
          ),
          FlutterSalesGraph(
            salesData: [65, 35, 40],
            labels: ['Gold', 'Silver', 'Bronze'],
            maxBarHeight: 100.0,
            barWidth: 35.0,
            colors: [Colors.yellowAccent, Colors.grey, Colors.orange],
            dateLineHeight: 20.0,
          ),
        ],
      ),
    );
  }
}
