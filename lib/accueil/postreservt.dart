import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rose_gold/resources/abonnementvip.dart';
import '../models/user.dart'as model;
import '../providers/user_provider.dart';
class Postreservt extends StatefulWidget {
  final snap;
  const Postreservt({
    Key? key,
    required this.snap
  }) : super(key: key);

  @override
  State<Postreservt> createState() => _PostreservtState();
}

class _PostreservtState extends State<Postreservt> {
  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;

    return Container(
      // boundary needed for web
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [ Colors.black,Colors.pink,Colors.black]),

        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          // HEADER SECTION OF THE POST
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.snap['username'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '(0759487025)',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("Date :          ",style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                Text(
                  widget.snap['DateBooking'].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text("Heure :          ",style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
                Text(
                  widget.snap['heureBooking'].toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}
