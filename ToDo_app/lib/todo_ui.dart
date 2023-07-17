import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TodoUI extends StatefulWidget {
  const TodoUI({Key? key}) : super(key: key);

  @override
  _TodoUIState createState() => _TodoUIState();
}

class _TodoUIState extends State<TodoUI> {

  var _height = 200.0;
  bool flag = true;
  var time = DateTime.now();
  Color bgColor = Colors.blueGrey;
  var skilllevel = TextEditingController();

  Icon checkIcon = Icon(
    Icons.check_box_outline_blank,
    color: Colors.red[900],
  );
  TextDecoration crossLine = TextDecoration.none;

  //late DatabaseReference ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  ref = FirebaseDatabase.instance.reference();
  }
  //final databaseRef = FirebaseDatabase.instance.ref('Task');
  var yourTask = TextEditingController();
 // var randomNo = Random().nextInt(1000);
  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    var arrRoutine = [
      'dsa Day1',
      'dsa Day2',
      'dsa Day3',
      'dsa Day4',
      'dsa Day5',
      'dsa Day6',
      'dsa Day7',
      'dsa Day8',
      'dsa Day9',
      'dsa Day10',
      'dsa Day11',
      'dsa Day12',
    ];


     return  Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0xFFEEEFF5),
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Icon(
               Icons.menu,
               color: Color(0xFFEEEFF5),
               size: 27,
             ),
             Container(
               height: 40,
               child: CircleAvatar(
                 backgroundImage: AssetImage('assets/images/avatar.png'),
               ),
             )
           ],
         ),
       ),

       backgroundColor: Color(0xFFEEEFF9),

       body: SlidingUpPanel(
         color: Color(0xFFEEEFF9),
         panel: Center(
           child: Column(

             children: [
               Container(
                   margin: EdgeInsets.only(top: 20,bottom: 30),
                   child: Text('ToDos',style: TextStyle(fontSize: 40,fontFamily: 'Poppins'),)),
               Container(
                 color: Colors.white,

                 margin: EdgeInsets.all(20),
                 child: TextField(
                   controller: yourTask,
                   style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                   decoration: InputDecoration(
                       hintText: 'Write your task',
                       suffixText: "ToDos",
                       prefixIcon: Icon(Icons.task_alt_sharp),
                       focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.red
                           )
                       ),
                       border: OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.black
                           )
                       )
                   ),
                 ),
               ),
               Container(
                   margin: EdgeInsets.only(top: 130,),
                   child: Text('Add',style: TextStyle(fontSize: 20,fontFamily: 'Poppins'),)),
               Container(
                   child: Icon(Icons.arrow_downward_sharp,size: 30,))
             ],
           ),
         ),
         collapsed: Container(
           decoration: BoxDecoration(
             color: Colors.red[400],
             // changing radius that we define above
             borderRadius:  BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
           ),
           // collapsed text
           child: Center(
             child: Text(
               "",
               style: TextStyle(color: Colors.white),
             ),
           ),
         ),



         body: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 margin: EdgeInsets.all(20),
                 decoration: BoxDecoration(
                     color: Colors.white, borderRadius: BorderRadius.circular(40)),
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: 'search',
                     prefixIcon: Icon(Icons.search),
                     border: InputBorder.none,
                   ),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Container(
                   child: Text(
                     'All ToDos new',
                     style: TextStyle(
                         fontSize: 30, fontFamily: 'Poppins', color: Colors.black),
                   ),
                 ),
               ),

               Container(
                 height: 500,
                 child: ListView.builder(
                     itemCount: arrRoutine.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Container(
                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30)),
                         child: ListTile(
                           onTap: () {
                             if (flag) {
                               checkIcon = Icon(
                                 Icons.check_box,
                                 color: Colors.red[900],
                               );
                               crossLine = TextDecoration.lineThrough;
                               flag = false;
                             } else {
                               checkIcon = Icon(
                                 Icons.check_box_outline_blank,
                                 color: Colors.red[900],
                               );
                               crossLine = TextDecoration.none;
                               flag = true;
                             }
                             setState(() {});
                           },
                           tileColor: Colors.white,
                           title: Text(arrRoutine[index],
                               style: TextStyle(
                                 fontSize: 15,
                                 fontFamily: 'Poppins',
                                 color: Colors.black,
                                 decoration: crossLine,
                               )),
                           leading: checkIcon,
                           trailing: InkWell(
                               onTap: () {
                                 print('delete');
                               },
                               child: Icon(
                                 Icons.delete_outline_sharp,
                                 color: Colors.red[900],
                               )),
                         ),
                       );
                     }),
               ),

               /* Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ListTile(
                onTap: () {
                  if (flag) {
                    checkIcon = Icon(
                      Icons.check_box,
                      color: Colors.red[900],
                    );
                    crossLine = TextDecoration.lineThrough;
                    flag = false;
                  } else {
                    checkIcon = Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.red[900],
                    );
                    crossLine = TextDecoration.none;
                    flag = true;
                  }
                  setState(() {});
                },
                tileColor: Colors.white,
                title: Text('Select all',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Colors.black)),
                leading: checkIcon,
                trailing: InkWell(
                    onTap: () {
                      print('delete');
                    },
                    child: Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.red[900],
                    )),
              ),
            ),*/

               // Container(
               //       height: 70,
               //       color: Colors.black,
               //       margin: EdgeInsets.only(top: 10),
               //       child: SingleChildScrollView(
               //         scrollDirection: Axis.horizontal,
               //         child: Row(
               //         children: [
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //           Padding(
               //             padding: const EdgeInsets.all(8.0),
               //             child: Container(
               //               width: 55,
               //               child: Column(
               //                 mainAxisAlignment: MainAxisAlignment.center,
               //                 children: [
               //                   Container(
               //                       height: 25,
               //                       child: Image.asset('assets/images/avatar.png')),
               //                   Container(
               //
               //                       child: Text('Avatar',style: TextStyle(color: Colors.white,fontSize: 10),))
               //                 ],
               //               ),
               //               decoration: BoxDecoration(
               //                   borderRadius: BorderRadius.circular(40),
               //                   color: Colors.blue
               //               ),),
               //           ),
               //
               //         ],),
               //       ),
               //     ),

               // Container(
               //   margin: EdgeInsets.only(top: 15),
               //   height: 200,
               //   child: ListView(
               //     children: [
               //       CarouselSlider(
               //         items: [
               //
               //           Container(
               //             width: 400,
               //             margin: EdgeInsets.all(6.0),
               //            //    child:  Image.asset('assets/images/i5.jpeg'),
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(8.0),
               //               color: Colors.blueGrey,
               //               image: DecorationImage(
               //                 image: AssetImage('assets/images/i5.jpeg'),
               //                 fit: BoxFit.cover,
               //               ),
               //
               //             ),
               //           ),
               //
               //           Container(
               //             width: 400,
               //             margin: EdgeInsets.all(6.0),
               //             //  child:  Image.asset('assets/images/avatar.png'),
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(8.0),
               //               color: Colors.redAccent,
               //               image: DecorationImage(
               //                 image: AssetImage('assets/images/i5.jpeg'),
               //                 fit: BoxFit.cover,
               //               ),
               //
               //             ),
               //           ),
               //
               //           Container(
               //             width: 400,
               //             margin: EdgeInsets.all(6.0),
               //             //  child:  Image.asset('assets/images/avatar.png'),
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(8.0),
               //               color: Colors.redAccent,
               //               image: DecorationImage(
               //                 image: AssetImage('assets/images/i5.jpeg'),
               //                 fit: BoxFit.cover,
               //               ),
               //
               //             ),
               //           ),
               //
               //           Container(
               //             width: 400,
               //             margin: EdgeInsets.all(6.0),
               //             //  child:  Image.asset('assets/images/avatar.png'),
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(8.0),
               //               color: Colors.redAccent,
               //               image: DecorationImage(
               //                 image: AssetImage('assets/images/i5.jpeg'),
               //                 fit: BoxFit.cover,
               //               ),
               //
               //             ),
               //           ),
               //
               //           Container(
               //             width: 400,
               //             margin: EdgeInsets.all(6.0),
               //             //  child:  Image.asset('assets/images/avatar.png'),
               //             decoration: BoxDecoration(
               //               borderRadius: BorderRadius.circular(8.0),
               //               color: Colors.redAccent,
               //               image: DecorationImage(
               //                 image: AssetImage('assets/images/i5.jpeg'),
               //                 fit: BoxFit.cover,
               //               ),
               //
               //             ),
               //           ),
               //
               //         ],
               //
               //         //Slider Container properties
               //         options: CarouselOptions(
               //           height: 180.0,
               //           enlargeCenterPage: true,
               //           autoPlay: true,
               //           aspectRatio: 16 / 9,
               //           autoPlayCurve: Curves.fastOutSlowIn,
               //           enableInfiniteScroll: true,
               //           autoPlayAnimationDuration: Duration(milliseconds: 500),
               //           viewportFraction: 0.8,
               //         ),
               //       ),
               //     ],
               //   ),
               // ),
               //
               //
               // Container(height: 200,color: Colors.blue,) ,
               // AnimatedContainer(
               //   height:  _height,
               //   color: bgColor,
               //   duration: Duration(milliseconds: 500),
               // ),
               // Text('Result: ${skilllevel.text.toString()}',style: TextStyle(color: Colors.white),),
               // TextField(
               //   controller: skilllevel,
               //
               //   decoration: InputDecoration(
               //     focusedBorder: OutlineInputBorder(
               //       borderSide: BorderSide(
               //         color: Colors.blue
               //       )
               //     ),
               //     border: OutlineInputBorder(
               //        borderSide: BorderSide(
               //        )
               //     )
               //   ),
               //
               // ),
               // Container(
               //   margin: EdgeInsets.all(10),
               //   child: ElevatedButton(onPressed: (){
               //
               //
               //     setState(() {
               //
               //       // if(flag){
               //       //   _height = 100.0;
               //       //   flag = false;
               //       //   bgColor = Colors.green;
               //       // }
               //       // else{
               //       //   _height = 200.0;
               //       //   flag = true;
               //       //   bgColor = Colors.blueGrey;
               //       // }
               //
               //     });
               //
               //
               //   }, child: Text('Button')),
               // ),
               // Container(height: 300,color: Colors.red,) ,
               // Container(height: 200,color: Colors.greenAccent,),
             ],
           ),
         ),
       ),


       drawer: Drawer(
         child: ListView(
           padding: const EdgeInsets.all(0),
           children: [
             const DrawerHeader(
               decoration: BoxDecoration(
                 color: Colors.red,
               ), //BoxDecoration
               child: UserAccountsDrawerHeader(
                 decoration: BoxDecoration(color: Colors.red),
                 accountName: Text(
                   "Saksham Tandel",
                   style: TextStyle(fontSize: 18),
                 ),
                 accountEmail: Text("sakshamtandel@gmail.com"),
                 currentAccountPictureSize: Size.square(40),
                 currentAccountPicture: CircleAvatar(
                   backgroundColor: Colors.blue,
                   child: Text(
                     "S",
                     style: TextStyle(fontSize: 27.0, color: Colors.black),
                   ), //Text
                 ), //circleAvatar
               ), //UserAccountDrawerHeader
             ), //DrawerHeader
             ListTile(
               leading: const Icon(Icons.person),
               title: const Text(' My Profile '),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: const Icon(Icons.book),
               title: const Text(' My ToDos '),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: const Icon(Icons.workspace_premium),
               title: const Text(' Go Premium '),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: const Icon(Icons.video_label),
               title: const Text(' Past ToDos '),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: const Icon(Icons.edit),
               title: const Text(' Edit Profile '),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: const Icon(Icons.logout),
               title: const Text('LogOut'),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
           ],
         ),
       ),

       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       floatingActionButton: Padding(
         padding: const EdgeInsets.all(15),
         child: FloatingActionButton(
           // isExtended: true,
           child: Icon(Icons.add,color: Colors.white,),
           backgroundColor: Colors.red[900],
           onPressed: () {
             print('hello');


             // setState(() {
             //   ref.child("todos").child("$randomNo").set({
             //     'title':  "Task1" ,
             //     'subtitle': "${yourTask.text}",
             //   });
             // });

           },
         ),
       ),

     );
  }
}