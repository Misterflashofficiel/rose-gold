import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rose_gold/accueil/postreservt.dart';
import 'package:rose_gold/reservation/admin%20reservation.dart';

import '../providers/user_provider.dart';
import '../utils/colors.dart';
import '../widgets/post_card.dart';
class DrawerRS extends StatefulWidget {
  const DrawerRS({Key? key}) : super(key: key);

  @override
  State<DrawerRS> createState() => _DrawerRSState();
}

class _DrawerRSState extends State<DrawerRS> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black, Colors.pink,Colors.black])
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  DrawerHeader(child:
                  Container(
                    width:190 ,
                    decoration : BoxDecoration(
                        gradient: LinearGradient(colors: [ Colors.black,Colors.pink]),
                      borderRadius: BorderRadius.circular(34)
                    ) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            userProvider.getUser.photoUrl,
                          ),
                        ),
                        SizedBox(height: 0,),
                        Text(userProvider.getUser.email, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text(userProvider.getUser.username, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                      ],
                    ),
                  )
                  ),
                  Expanded(child:
                  ListView(
                    children: [
                      Container(
                        decoration : BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(34)
                        ) ,
                        child: ListTile(
                          onTap: (){},
                          leading: Icon(Icons.home,size: 28,),
                          title: Text("Home", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration : BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(34)
                        ) ,
                        child: ListTile(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AdminReservation()),
                            );
                          },
                          leading: Icon(Icons.subscriptions, size: 28,),
                          title: Text("Reservation", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration : BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(34)
                        ) ,
                        child: ListTile(
                          onTap: (){},
                          leading: Icon(Icons.announcement_rounded, size: 28,),
                          title: Text("Annonce", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration : BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(34)
                        ) ,
                        child: ListTile(
                          onTap: (){},
                          leading: Icon(Icons.add_call, size: 28,),
                          title: Text("A propos de nous", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                      ),
                      Container(
                        decoration : BoxDecoration(
                            gradient: LinearGradient(colors: [ Colors.black,Colors.pink]),
                            borderRadius: BorderRadius.circular(34)
                        ) ,
                        child: ListTile(
                          onTap: (){},
                          leading: Icon(Icons.logout, size: 28,),
                          title: Text("Log out",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),),

                ],
              ),
            ),
          ),
          TweenAnimationBuilder(tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_,double val,__){
                return(
                Transform(
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi/6) * val)
                  ,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar:
                    AppBar(
                        backgroundColor:  Colors.pink,
                        centerTitle: true,
                        title: Text('rose gold', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [ Colors.black,Colors.black,Colors.pink,Colors.black,Colors.black]),
                          ),
                        ),
                        leading:
                          GestureDetector(
                            onTap:() {
                              setState(() {
                                value == 0 ? value = 1 : value = 0;
                              });
                            } ,
                            child:
                               Icon(
                                Icons.menu,
                                color: Colors.white,
                            ),
                          )

                    ),
                    body:SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 140,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                     image: AssetImage('assets/RG-LOGO.png', ),
                                        fit:BoxFit.cover
                                    ),
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(
                                      45
                                       ),
                                  ),
                                    child: Column(
                                      children: [
                                       ],
                                    ) ,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Wrap(
                            children: [
                              Container(
                                height: 100,
                                width: 150,
                                color: Colors.black,
                                child: FlatButton(
                                    onPressed: (){},
                                    child: Column(
                                      children: [
                                        Text('Abonnement VIP'),
                                        Text('54000 XOF')
                                      ],
                                    )),
                              ),ElevatedButton(
                                  onPressed: (){},
                                  child: Column(
                                    children: [
                                      Text('Abonnement VIP'),
                                      Text('54000 XOF')
                                    ],
                                  )),ElevatedButton(onPressed: (){},
                                  child: Column(
                                    children: [
                                      Text('Abonnement VIP'),
                                      Text('54000 XOF')
                                    ],
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                )
                );
              },
          ),

        ],
      ),
    );
  }
}
