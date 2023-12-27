import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HelperUI.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with SingleTickerProviderStateMixin {

  /// toggle Button Variables

  BehaviorSubject<bool> buttonClick = BehaviorSubject();
  bool button = false;

  /// Calender Variable

  /// Single Date Variables

  static final kToday = DateTime.now();
  final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
  final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

  DateTime  today = DateTime.now();

  DateTime? _selectedDay;

  CalendarFormat _calendarFormat = CalendarFormat.week;

  /// Multi Date Select Varibale

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  /// tabs Variable

  late TabController _tabController;

  List<Tab> tabLable = const [
    Tab(text: 'All${' (10) '}',),
    Tab(text: 'HRD${' (10) '}',),
    Tab(text: 'Tech ${' (10) '}',),
    Tab(text: 'Follow up ${' (10) '}',),
  ];

  List<Widget> dayTabView = [
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          onlyText(lable: 'Balram Naidu', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          const SizedBox(height: 3,),
                          onlyText(lable: 'ID: LOREM123456354 ', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          Uri url = Uri(scheme: "tel", path: '1234567890');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("Can't open dial pad.");
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle , border: Border.all(color: Colors.grey.withOpacity(0.5))),
                          child: const Icon(Icons.dialer_sip_rounded , color: Colors.blue,),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children:  [
                      onlyText(lable: 'Offered:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                      onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(width: 3,),
                  Row(
                    children:  [
                      onlyText(lable: 'Current:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                      onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(shape: BoxShape.circle , color: Colors.orange )),
                      const SizedBox(width: 3,),
                      onlyText(lable: 'Medium Priority', fontSize: 12, color: Colors.orange, fontWeight: FontWeight.normal),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children:  [
                          onlyText(lable: 'Due Date', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '05 Jan 23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Column(
                        children:  [
                          onlyText(lable: 'Level', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '10', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Column(
                        children:  [
                          onlyText(lable: 'Days Left', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          );
        }),
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    onlyText(lable: 'Balram Naidu', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    const SizedBox(height: 3,),
                    onlyText(lable: 'ID: LOREM123456354 ', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                  ],
                ),
                InkWell(
                  onTap: () async {
                    Uri url = Uri(scheme: "tel", path: '1234567890');
                    if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                    } else {
                    print("Can't open dial pad.");
                    }
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(shape: BoxShape.circle , border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: const Icon(Icons.dialer_sip_rounded),
                  ),
                )
              ],
            ),
           const SizedBox(height: 10,),
            Row(
              children:  [
                onlyText(lable: 'Offered:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
              ],
            ),
            const SizedBox(width: 3,),
            Row(
              children:  [
                onlyText(lable: 'Current:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
              ],
            ),
           const SizedBox(height: 10,),
            Row(
              children: [
                Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(shape: BoxShape.circle , color: Colors.orange )),
               const SizedBox(width: 3,),
                onlyText(lable: 'Medium Priority', fontSize: 12, color: Colors.orange, fontWeight: FontWeight.normal),
              ],
            ),
           const SizedBox(height: 10,),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [
                    onlyText(lable: 'Due Date', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                   const SizedBox(height: 3,),
                    onlyText(lable: '05 Jan 23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ],
                ),
                Column(
                  children:  [
                    onlyText(lable: 'Level', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                    const SizedBox(height: 3,),
                    onlyText(lable: '10', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ],
                ),
                Column(
                  children:  [
                    onlyText(lable: 'Days Left', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                    const SizedBox(height: 3,),
                    onlyText(lable: '23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
      }),
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          onlyText(lable: 'Balram Naidu', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          const SizedBox(height: 3,),
                          onlyText(lable: 'ID: LOREM123456354 ', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          Uri url = Uri(scheme: "tel", path: '1234567890');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("Can't open dial pad.");
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle , border: Border.all(color: Colors.grey.withOpacity(0.5))),
                          child: const Icon(Icons.dialer_sip_rounded),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children:  [
                      onlyText(lable: 'Offered:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                      onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(width: 3,),
                  Row(
                    children:  [
                      onlyText(lable: 'Current:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                      onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(shape: BoxShape.circle , color: Colors.orange )),
                      const SizedBox(width: 3,),
                      onlyText(lable: 'Medium Priority', fontSize: 12, color: Colors.orange, fontWeight: FontWeight.normal),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children:  [
                          onlyText(lable: 'Due Date', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '05 Jan 23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Column(
                        children:  [
                          onlyText(lable: 'Level', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '10', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Column(
                        children:  [
                          onlyText(lable: 'Days Left', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          );
        }),
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: MediaQuery.of(context).size.height / 3.5,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          onlyText(lable: 'Balram Naidu', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          const SizedBox(height: 3,),
                          onlyText(lable: 'ID: LOREM123456354 ', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          Uri url = Uri(scheme: "tel", path: '1234567890');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("Can't open dial pad.");
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle , border: Border.all(color: Colors.grey.withOpacity(0.5))),
                          child: const Icon(Icons.dialer_sip_rounded),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children:  [
                      onlyText(lable: 'Offered:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                      onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(width: 3,),
                  Row(
                    children:  [
                      onlyText(lable: 'Current:', fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
                      onlyText(lable: '₹X,XX,XXX', fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(shape: BoxShape.circle , color: Colors.orange )),
                      const SizedBox(width: 3,),
                      onlyText(lable: 'Medium Priority', fontSize: 12, color: Colors.orange, fontWeight: FontWeight.normal),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children:  [
                          onlyText(lable: 'Due Date', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '05 Jan 23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Column(
                        children:  [
                          onlyText(lable: 'Level', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '10', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),
                      Column(
                        children:  [
                          onlyText(lable: 'Days Left', fontSize: 14, color: Colors.grey, fontWeight: FontWeight.normal),
                          const SizedBox(height: 3,),
                          onlyText(lable: '23', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
          );
        }),
  ];

  List<Widget> weekTabView = [

    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: MediaQuery.of(context).size.height / 10,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ]
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 3,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.red),
                ),
                const SizedBox(width: 16,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    onlyText(lable: '27', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    onlyText(lable: 'Dec', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)
                  ],
                ),
                const SizedBox(width: 16,),
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circle(20, "HRD"),
                      circle(15, "Tech 1"),
                      circle(03, "Follow up"),
                      circle(50, "Total"),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: 80,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ]
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 3,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.red),
                ),
                const SizedBox(width: 16,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    onlyText(lable: '27', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    onlyText(lable: 'Dec', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)
                  ],
                ),
                const SizedBox(width: 16,),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circle(20, "HRD"),
                      circle(15, "Tech 1"),
                      circle(03, "Follow up"),
                      circle(50, "Total"),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: 80,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ]
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 3,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.red),
                ),
                const SizedBox(width: 16,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    onlyText(lable: '27', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    onlyText(lable: 'Dec', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)
                  ],
                ),
                const SizedBox(width: 16,),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circle(20, "HRD"),
                      circle(15, "Tech 1"),
                      circle(03, "Follow up"),
                      circle(50, "Total"),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
    ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context , index) {
          return Container(
            height: 80,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ]
            ),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 3,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.red),
                ),
                const SizedBox(width: 16,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    onlyText(lable: '27', fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    onlyText(lable: 'Dec', fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)
                  ],
                ),
                const SizedBox(width: 16,),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circle(20, "HRD"),
                      circle(15, "Tech 1"),
                      circle(03, "Follow up"),
                      circle(50, "Total"),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

  ];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _tabController = TabController(length: tabLable.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          calendar(),
          tabsDesign(),
        ],
      ),
    );
  }

  AppBar appBar(){
    return AppBar(
      elevation: 1,
      title: const Text('My Calendar' , style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: toggleButtonDesign(),
        ),
      ],
    );
  }

  Widget toggleButtonDesign(){
    return Center(
      child: Container(
        height: 30,
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.blueAccent),
        ),
        child: StreamBuilder<bool>(
          stream: buttonClick.stream,
          builder: (context, snapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    if(button == true) {

                      button = false;

                      buttonClick.sink.add(button);

                    } else if(button == false) {

                      button = false;

                      buttonClick.sink.add(button);

                    } else {

                      button = true;

                      buttonClick.sink.add(button);

                    }

                  },
                  child: Container(
                    height: 30,
                    width: button == false ? 60 : 50,
                    decoration: button == false ? BoxDecoration(borderRadius: BorderRadius.circular(3) , color: Colors.blueAccent) : BoxDecoration() ,
                    child: Center(child: Text('Day' ,style: TextStyle(color: button == false ?  Colors.white : Colors.blueAccent),)),
                  ),
                ),
                InkWell(
                  onTap: () {

                    if(button == false) {

                      button = true;

                      buttonClick.sink.add(button);
                    } else if(button == true ) {

                      button = true;

                      buttonClick.sink.add(button);

                    } else {

                      button = false;

                      buttonClick.sink.add(button);

                    }

                  },
                  child: Container(
                      height: 30,
                      width: button == true ? 60 : 50,
                      decoration: button == true ? BoxDecoration(borderRadius: BorderRadius.circular(3) , color: Colors.blueAccent) : BoxDecoration(),
                    child: Center(child: Text('Week' , style: TextStyle(color: button == false ?  Colors.blueAccent : Colors.white),)),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );

  }

  Widget calendar(){
    return StreamBuilder<Object>(
      stream: buttonClick.stream,
      builder: (context, snapshot) {
        return button == false ? TableCalendar(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: today,
          calendarFormat: _calendarFormat,
          headerStyle: HeaderStyle(
            formatButtonDecoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(22.0)
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.blueAccent),
            formatButtonShowsNext: false,
          ),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                today = focusedDay;
              });
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            today = focusedDay;
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: true,
          daysOfWeekVisible: true,
        )
            : TableCalendar(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: today,
          calendarFormat: _calendarFormat,

          headerStyle: HeaderStyle(
            formatButtonDecoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(22.0)
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.blueAccent),
            formatButtonShowsNext: false,
          ),
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {

            today = focusedDay;
          },
          onRangeSelected: (start, end, focusedDay) {
            setState(() {
              _selectedDay = null;
              today = focusedDay;
              _rangeStart = start;
              _rangeEnd = end;
              _rangeSelectionMode = RangeSelectionMode.toggledOn;
            });
          },
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: true,
          daysOfWeekVisible: true,
          rangeSelectionMode: _rangeSelectionMode,
        );
      }
    );
  }

  Widget tabsDesign() {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TabBar(
            controller: _tabController,
            labelStyle: const TextStyle(color: Colors.black),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            tabs: tabLable
          ),
        ),
        StreamBuilder<bool>(
          stream: buttonClick.stream,
          builder: (context, snapshot) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                physics: const AlwaysScrollableScrollPhysics(),
                children: button == false ? dayTabView  : weekTabView
              ),
            );
          }
        ),
       const SizedBox(height: 300,),
      ],
    );
  }

}
