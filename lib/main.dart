import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(home:Todo())
  );
}

  class About extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.blue[900],
          appBar: AppBar(
            title: Text('About'),
            backgroundColor: Colors.blue[900],
          ),
          body:SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius:100.0,
                      backgroundImage: AssetImage('images/Taf.jpg'),
                    ),
                    Text('Tafari Beckford',
                    style:TextStyle(
                      fontFamily: 'Permanent Marker',
                      fontSize:40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    )
                    ),
                    Text('Full-Stack Developer',
                        style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                      ),
                    ),
                    Container(


                      padding: EdgeInsets.all(10.0),
                      margin:EdgeInsets.symmetric(vertical: 25.0,horizontal: 25.0),
                      color: Colors.white,

                        child: Row(
                          children:<Widget>[
                            Expanded(
                              child: Text(
                              "Aspiring Full-Stack Developer competent in various stages of web development who is equipped with a diverse and promising skill-set.",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 20.0 ,
                                      fontWeight:FontWeight.bold,
                                      color: Colors.blue[900])
                              ),
                            )
                          ]
                        ),
                      ),
                  ],
                ),
              ),

          ),

        );
    }
  }

bool _check=true;

class _strikeThrough extends StatelessWidget{
  bool toDoChecked;
  String toDoText;
  _strikeThrough({this.toDoChecked, this.toDoText}) : super();

  Widget _strikewidget(){
    if(toDoChecked==false){
      return Text(
        toDoText,
        style: TextStyle(
            fontSize: 20.0
        ),
      );
    }
    else{
      return Text(
        toDoText,
        style: TextStyle(
            fontSize: 20.0,
            decoration: TextDecoration.lineThrough,
            color: Colors.redAccent,
            fontStyle: FontStyle.italic
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _strikewidget();
  }
}

final TextEditingController _textFieldController = TextEditingController();
final List<String> items = [];

@override
void dispose() {
  _textFieldController.dispose();
}
class Todo extends StatefulWidget{
  @override
  TodoState createState() {
    return TodoState();
  }
}

class TodoState extends State<Todo> {

  void addToList(){
    setState(() {
      items.insert(0,_textFieldController.text);
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("My Supermarket Shopping List"),
        backgroundColor: Colors.blue.shade900,
      ),
      body:
     Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(children:<Widget>[
           Form(
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 TextField(
                    controller: _textFieldController,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 labelText: 'Add Item',
                 focusColor: Colors.blue[900]
               ),
                 ),
    Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue[900],
              onPressed: () {
                addToList();
              },
              child: Text('Submit'),
            ),
          )
    ),
               ]
           )
       ),
        Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: items.map((text) => CheckboxListTile(
                  title: _strikeThrough(toDoText:text,toDoChecked: _check),
                  value:_check,
                  onChanged: (bool){
                    setState(() {
                      if(bool){
                        _check = true;
                      }
                      else{
                        _check =  false;
                      }
                    });
                  },


                )
                ).toList(),

              ),

    ),

Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Center(

    child:   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          textColor: Colors.white,
          color: Colors.blue[900],
          child: Text('About'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          },
        ),
      ],
    ),
  ),
),
            ],
          ),
    )
    );

  }
}






