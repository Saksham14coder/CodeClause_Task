import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  bool _validate = false;

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos",style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xFFEEEFF9),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      backgroundColor: Color(0xFFEEEFF9),

      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              color: Colors.white,

              margin: EdgeInsets.all(20),
              child: TextField(

                autofocus: true,
                controller: title,
                maxLines: 4,
                style: TextStyle(fontFamily: 'Poppins',fontSize: 18),
                decoration: InputDecoration(
                    hintText: 'Write your task',
                    suffixText: "ToDos",
                    prefixIcon: Icon(Icons.task_alt_sharp,color: Colors.red,),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red
                        )
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black
                        )
                    ),
                    errorText: _validate ? 'Value Cant Be Empty' : null,
                ),

              ),
            ),

            Container(

              child: OutlinedButton(
                //color: Colors.indigo[900],
                onPressed: () {
                  if(title.text.isEmpty){
                    title.text.isEmpty ? _validate = true : _validate = false;
                  }else{
                    ref
                        .push()
                        .set(
                      title.text,
                    )
                        .asStream();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Home()));

                  }

                },
                child: Text(
                  "save",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}