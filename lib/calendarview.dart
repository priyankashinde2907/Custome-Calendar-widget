import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realtime_innovation_datepicker/util/Constants.dart';
import 'package:realtime_innovation_datepicker/util/MyFunctions.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  final int buttonCount;
  final DateTime dateTime;

  const CalendarView(
      {required this.buttonCount, required this.dateTime, Key? key})
      : super(key: key);

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime selectedDate;
  late MyFunctions myFunctions;
  DateTime? selectedDay;
  late String formatDate;
  final ValueNotifier<bool> _notifier = ValueNotifier(false);
  late int sundaydate = DateTime.daysPerWeek - selectedDate.weekday;
  int intSelectedIndex = 0;
  int intSelected6Index = 0;
  int clickindex =0;


  @override
  void initState() {
    //(widget.buttonCount == 4) ?  set4Buttons() : (widget.buttonCount == 6)?set6Buttons():set0Buttons();

    myFunctions = MyFunctions();
    setState(() {
      selectedDate = widget.dateTime;
      formatDate = myFunctions.convertDate(selectedDate);
    });
    setHeader();
    super.initState();
  }

  void setHeader()
  {
    if (widget.buttonCount == 4) {
      set4Buttons();
    } else if (widget.buttonCount == 6) {
      set6Buttons();
    } else {
      set0Buttons();
    }
  }
  late List<Widget> setButtons;

  void set0Buttons() {
      setButtons = [
    ];
  }

  void set4Buttons() {
    setButtons = [
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelectedIndex = 0;
              setHeader();
            });
          },
          child: Text("Never ends"),
          style: (intSelectedIndex == 0)
              ? selectedButton
              : unSelectedButton

      ),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: 15));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelectedIndex = 1;
              setHeader();
            });
          },
          child: Text("15 days later"),
          style: (intSelectedIndex == 1)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: 30));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelectedIndex = 2;
              setHeader();
            });
          },
          child: Text("30 days later"),
          style: (intSelectedIndex == 2)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: 60));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelectedIndex = 3;
              setHeader();
            });
          },
          child: Text("60 days later"),
          style: (intSelectedIndex == 3)
              ? selectedButton
              : unSelectedButton),
    ];
  }

  void set6Buttons() {
    setButtons = [
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: -1));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelected6Index = 0;
              setHeader();
            });
          },
          child: Text("Yesterday"),
          style: (intSelected6Index == 0)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              //selectedDate = selectedDate.add(Duration(days: 0));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelected6Index = 1;
              setHeader();
            });
          },
          child: Text("Today"),
          style: (intSelected6Index == 1)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: 1));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelected6Index = 2;
              setHeader();
            });
          },
          child: Text("Tomorrow"),
          style: (intSelected6Index == 2)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: sundaydate - 1));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelected6Index = 3;
              setHeader();
            });
          },
          child: Text("This Saturday"),
          style: (intSelected6Index == 3)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: sundaydate));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelected6Index = 4;
              setHeader();
            });
          },
          child: Text("This Sunday"),
          style: (intSelected6Index == 4)
              ? selectedButton
              : unSelectedButton),
      ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = DateTime.now();
              selectedDate = selectedDate.add(Duration(days: sundaydate + 2));
              formatDate = myFunctions.convertDate(selectedDate);
              _notifier.value = !_notifier.value;
              intSelected6Index = 5;
              setHeader();
            });
          },
          child: Text("Next Tuesday"),
          style: (intSelected6Index == 5)
              ? selectedButton
              : unSelectedButton),
    ];
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
      formatDate = myFunctions.convertDate(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        //padding: const EdgeInsets.all(9.0),
        child: Column(
          children: [
            (widget.buttonCount != 0)?
              GridView.count(
              padding: const EdgeInsets.all(24),
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3,
              children: setButtons,
              ):SizedBox(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ValueListenableBuilder(
                    valueListenable: _notifier,
                    builder: (context, value, child) {
                      return TableCalendar(
                        focusedDay: selectedDate,
                        firstDay: DateTime.utc(2010),
                        lastDay: DateTime.utc(2030),
                        calendarFormat: CalendarFormat.month,
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, selectedDate),
                        calendarStyle: const CalendarStyle(
                          cellMargin: const EdgeInsets.all(8),
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                        onDaySelected: _onDaySelected,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          rightChevronIcon: Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Colors.grey,
                          ),
                          leftChevronIcon: Icon(
                            Icons.arrow_left,
                            size: 30,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.event_outlined,
                      color: Color(0XFF1DA1F2),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        formatDate,
                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                        style: (clickindex == 0) ? unSelectedButton:selectedButton,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, formatDate);
                          //print(formatDate);
                        },
                        child: const Text("Save"),
                        style: (clickindex == 1) ? unSelectedButton:selectedButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
