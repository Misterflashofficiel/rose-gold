import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rose_gold/utils/utils.dart';

import '../models/abVip.dart';
import '../providers/user_provider.dart';
import '../resources/abonnementvip.dart';
import 'finallbook.dart';
import 'util.dart';



class BookingCalendarRS extends StatefulWidget {
  BookingCalendarRS({Key? key}) : super(key: key);

  @override
  _BookingCalendarRSState createState() => _BookingCalendarRSState();
}

class _BookingCalendarRSState extends State<BookingCalendarRS> {
  DatePickerController _controller = DatePickerController();
  TextEditingController _controllerr = TextEditingController();
  DateTime _selectedValue = DateTime.now();
  int selectedCard = 1;
  bool isLoading = false;

  void postbook(String uid, String username, String email,String postId) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      var res = await FireStoreMethodsRS().uploadBookRS(
          uid,
          username,
          email,
          postId,
          _controllerr.text,
          TIME_SLOT.elementAt(selectedCard));
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Publication en ligne!',
        );
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
   return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.send),
          onPressed: ()=> postbook(
            userProvider.getUser.uid,
            userProvider.getUser.username,
            userProvider.getUser.email,
            userProvider.getUser.photoUrl,
          )
        ),

        body: Container(
          padding: EdgeInsets.all(20.0),
          decoration : BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black,Colors.pink, Colors.white70,Colors.pink]
              ),
              borderRadius: BorderRadius.circular(34)
          ) ,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                      _controllerr.text = date.toString();
                    });
                  },
                ),
              ),
              Expanded(
                child: GridView.builder(
                        itemCount:TIME_SLOT.length ,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index)=>Card(
                          color:  selectedCard == index ? Colors.pink : Colors.black ,
                          child: GridTile(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:MainAxisAlignment.center ,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    setState(() {
                                      selectedCard = index;
                                    });
                                  },
                                  child: Column(
                                  children: [
                                  Text('${TIME_SLOT.elementAt(index)}',style: TextStyle(color: Colors.white),),
                                  Text(selectedCard == index?'Reservation':'Disponible',style: TextStyle(color: Colors.amber),),],
                                     ),
                                  ),

                              ],
                            ),
                          ),
                        )
                ),


              ),

            ],
          ),
        )
   );
  }
}