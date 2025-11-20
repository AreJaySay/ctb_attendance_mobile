import 'dart:convert';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:students/services/routes.dart';
import 'package:students/utils/palettes/app_colors.dart' hide Colors;

class Attendances extends StatefulWidget {
  @override
  State<Attendances> createState() => _AttendancesState();
}

class _AttendancesState extends State<Attendances> {
  final _AttendancesRef = FirebaseDatabase.instance.ref().child('attendances');
  final Routes _routes = new Routes();
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.8;
    final double itemWidth = size.width / 2;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text("Monthly Record",style: TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.w700,fontSize: 16),),
              Spacer(),
              TextButton(
                child: Row(
                  children: [
                    Text("${_selectedDate.year}",style: TextStyle(fontFamily: "OpenSans",fontSize: 16, color: colors.blue,fontWeight: FontWeight.w700),),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.calendar_month,color: colors.blue,)
                  ],
                ),
                onPressed: (){
                  _selectYear(context);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_left_sharp,size: 35,),
                onPressed: _previousMonth,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${_getMonthName(_selectedDate.month - 1)}',
                    style: TextStyle(fontFamily: "OpenSans", color: Colors.grey.shade400),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${_getMonthName(_selectedDate.month)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${_getMonthName(_selectedDate.month + 1)}',
                    style: TextStyle(fontFamily: "OpenSans", color: Colors.grey.shade400),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.keyboard_arrow_right_sharp,size: 35,),
                onPressed: _nextMonth,
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index){
                  return Container(
                    width: double.infinity,
                    height: 90,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: index == 0 ? colors.blue : colors.lightblue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("$index",style: TextStyle(fontFamily: "OpenSans",fontSize: 17,fontWeight: FontWeight.w700),),
                              Text("MON",style: TextStyle(fontFamily: "OpenSans",fontSize: 13),),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Time In",style: TextStyle(fontFamily: "OpenSans",color: index == 0 ? Colors.white : Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("07:00 AM",style: TextStyle(fontFamily: "OpenSans",color: index == 0 ? Colors.white54 : Colors.black54),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Time Out",style: TextStyle(fontFamily: "OpenSans",color: index == 0 ? Colors.white : Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                            SizedBox(
                              height: 5,
                            ),
                            Text("05:00 PM",style: TextStyle(fontFamily: "OpenSans",color: index == 0 ? Colors.white54 : Colors.black54),),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  );
                },
              )
          )
        ],
      ),
    );
  }
  String _getMonthName(int month) {
    switch (month) {
      case 1: return 'January';
      case 2: return 'February';
      case 3: return 'March';
      case 4: return 'April';
      case 5: return 'May';
      case 6: return 'June';
      case 7: return 'July';
      case 8: return 'August';
      case 9: return 'September';
      case 10: return 'October';
      case 11: return 'November';
      case 12: return 'December';
      default: return '';
    }
  }

  Future<void> _selectYear(BuildContext context) async {
    final selectedDate = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: colors.blue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }
}
