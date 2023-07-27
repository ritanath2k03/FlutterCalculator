import 'package:flutter/material.dart';

void main(){
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      title: 'Calculator',
      home: SimpleCalculator(),
    );
  }
}
class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});
  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}
class _SimpleCalculatorState extends State<SimpleCalculator> {
String equation="0";
String result ="0";
String expression="";
double equationfontsize=38.0;
double resultfontsize=48.0;

  buttonPressed(String text){
setState(() {
print(text);
});
  }
  Widget buildButton(String text,double height,Color color){
    return Container(
      margin: EdgeInsets.all(1.0),
      padding:EdgeInsets.all(12.0),
      height: MediaQuery.of(context).size.height*0.1*height,
      color: color,
      child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () =>  buttonPressed(text),
          child: Text(text,
            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.normal,color: Colors.white),)),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BlackHole Calculator',style: TextStyle(fontStyle: FontStyle.italic),)),
      body: Column(
        children: <Widget>[
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.fromLTRB(10, 20,10,0),
        child: Text(equation,style: TextStyle(fontSize: equationfontsize),),
      ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20,10,0),
            child: Text(result,style: TextStyle(fontSize:resultfontsize),),
          ),
            Expanded(child: Divider()
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                          buildButton("C",1,Colors.redAccent),
                          buildButton("⌫",1 , Colors.blue),
                          buildButton("÷",1 , Colors.blue), 
                      ]
                    ),       TableRow(
                        children: [
                          buildButton("7",1,Colors.black45),
                          buildButton("8",1 , Colors.black45),
                          buildButton("9",1 , Colors.black45),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4",1,Colors.black45),
                          buildButton("5",1 , Colors.black45),
                          buildButton("6",1 , Colors.black45),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1",1,Colors.black45),
                          buildButton("2",1 , Colors.black45),
                          buildButton("3",1 , Colors.black45),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".",1,Colors.black45),
                          buildButton("0",1 , Colors.black45),
                          buildButton("00",1 , Colors.black45),
                        ]
                    ),
                  ],
                ),
              )
              ,
              Container(
                width:MediaQuery.of(context).size.width*0.25,
                child: Table(
                  children: [
                    TableRow(
                        children:[
                          buildButton("×",1 , Colors.blue)
                        ]
                    ),
                    TableRow(
                        children:[
                          buildButton("+",1 , Colors.blue)
                        ]
                    )
                    ,    TableRow(
                        children:[
                          buildButton("-",1 , Colors.blue)
                        ]
                    ),
                    TableRow(
                        children:[
                          buildButton("=",2 , Colors.redAccent)
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),


      ],
      ),
    );
  }


}

