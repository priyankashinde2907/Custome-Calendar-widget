import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_datepicker/util/Constants.dart';
import 'package:realtime_innovation_datepicker/util/MyFunctions.dart';
import 'package:realtime_innovation_datepicker/calendarview.dart';

void main() {
  runApp(DatePicker());
}

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(_,child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyDatePicker(),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key, this.firstDate, this.secondDate})
      : super(key: key);
  final DateTime? firstDate;
  final DateTime? secondDate;

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  late DateTime selectedDate;
  late MyFunctions myFunctions;
  DateTime? selectedDay;
  String? formatDateWithoutPreset;
  String? formatDate4Preset;
  String? formatDate6Preset;
  final ValueNotifier<bool> _notifier = ValueNotifier(false);

  @override
  void initState() {
    myFunctions = new MyFunctions();

    super.initState();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }


  String convertDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Custom Date Picker"),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                Text(
                  "Calendar Widgets",
                  style: titleText,
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                     child: ElevatedButton(
                        child: Text("Without preset"),
                       style: withandWithoutpreset,
                        onPressed: () async {
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(buttonCount:0,d)));
                          dynamic formatDate =  await showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
                              insetPadding: EdgeInsets.zero,
                              contentPadding: EdgeInsets.zero,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              content: CalendarView(
                                dateTime: DateTime.now(),
                                buttonCount: 0,
                              ),
                            ),
                          );
                          setState(() {
                            formatDateWithoutPreset = formatDate;
                          });
                        },
                      ),
                    ),
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (formatDateWithoutPreset != null)
                        ? Chip(
                        avatar: Icon(
                          Icons.event,
                          color: Color(0XFF1DA1F2),
                        ),
                        label: Text(
                          formatDateWithoutPreset!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0XFF1DA1F2),
                          ),
                        ),
                        deleteIcon: const Icon(
                          Icons.close,
                          color: Color(0XFF1DA1F2),
                        ),
                        backgroundColor: Colors.blue[50],
                        shadowColor: Colors.grey[60],
                        onDeleted: () {
                          setState(() {
                            formatDateWithoutPreset = null;
                          });
                        })
                        : SizedBox(),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: ElevatedButton(
                          style:withandWithoutpreset,
                          child: Text("With 4 presets"),
                          onPressed: () async {
                            dynamic formatDate =  await showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(16.0))),
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                content: CalendarView(
                                    buttonCount: 4,
                                    dateTime: DateTime.now()),
                              ),
                            );
                           setState(() {
                             formatDate4Preset = formatDate;
                           });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (formatDate4Preset != null)
                        ? Chip(
                        labelPadding: EdgeInsets.symmetric(horizontal: 15),
                        avatar: Icon(
                          Icons.event,
                          color: Color(0XFF1DA1F2),
                        ),
                        label: Text(
                          formatDate4Preset!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0XFF1DA1F2),
                          ),
                        ),
                        deleteIcon: const Icon(
                          Icons.close,
                          color: Color(0XFF1DA1F2),
                        ),
                        backgroundColor: Colors.blue[50],
                        shadowColor: Colors.grey[60],
                        onDeleted: () {
                          setState(() {
                            formatDate4Preset = null;
                          });
                        })
                        : SizedBox(),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                         padding:  EdgeInsets.symmetric(horizontal: 16.w),
                         child: ElevatedButton(
                           style: withandWithoutpreset,
                          child: Text("With 6 presets"),
                          onPressed: () async {
                            dynamic formatDate =  await showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(16.0))),
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                content: CalendarView(
                                    buttonCount: 6, dateTime: DateTime.now()),
                              ),
                            );
                            setState(() {
                              formatDate6Preset=  formatDate;
                            });
                          },
                      ),
                       ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (formatDate6Preset != null)
                        ? Chip(
                        avatar: Icon(
                          Icons.event,
                          color: Color(0XFF1DA1F2),
                        ),
                        label: Text(
                          formatDate6Preset!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0XFF1DA1F2),
                          ),
                        ),
                        deleteIcon: const Icon(
                          Icons.close,
                          color: Color(0XFF1DA1F2),
                        ),
                        backgroundColor: Colors.blue[50],
                        shadowColor: Colors.grey[60],
                        onDeleted: () {
                          setState(() {
                            formatDate6Preset = null;
                          });
                        })
                        : SizedBox(),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text("Priyanka Jay Shinde",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ),
    );
  }
}
