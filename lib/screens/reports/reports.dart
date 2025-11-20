import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:students/screens/reports/components/achievement.dart';

import '../../services/routes.dart';
import '../../utils/palettes/app_colors.dart' hide Colors;
import 'components/pie_chart.dart';

class Reports extends StatefulWidget {
  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  final Routes _routes = new Routes();
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("MONTHLY REPORT",style: TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.w800),),
              Spacer(),
              InkWell(
                child: Row(
                  children: [
                    Text("${DateFormat("MMMM").format(_selectedDate)}",style: TextStyle(fontFamily: "OpenSans",fontSize: 15, color: colors.blue,fontWeight: FontWeight.w700),),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.calendar_month,color: colors.blue,size: 20,)
                  ],
                ),
                onTap: (){
                  _selectYear(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          PieChartPage(),
          SizedBox(
            height: 20,
          ),
          Achievement()
        ],
      ),
    );
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
