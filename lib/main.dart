
import 'package:calculator/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
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
      home: SplashScreen(),
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
int flag=0;
  buttonPressed(String buttonText){
setState(() {
  if(flag==1)equation="0";
  if(buttonText=="C"){
equation="0";
result="0";
 equationfontsize=38.0;
 resultfontsize=48.0;
  }else if(buttonText=="⌫"){
    equationfontsize=48.0;
    resultfontsize=38.0;
equation=equation.substring(0,equation.length-1);
if(equation=="")equation="0";
  }
  else if(buttonText=="="){
    equationfontsize=38.0;
    resultfontsize=48.0;
    expression=equation;
    expression=expression.replaceAll('÷','/');
    expression=expression.replaceAll('×','*');
    try{
      Parser p=new Parser();
      Expression exp=p.parse(expression);
ContextModel cm=ContextModel();
result='${exp.evaluate(EvaluationType.REAL,cm )}';
    }catch(e){
      result="Error";
    }
    flag=1;
  }else{
    equationfontsize=38.0;
    resultfontsize=48.0;
    if(equation=="÷"||equation=="×"||equation=="+"||equation=="-")equation=result+equation;
    if(equation=="0")equation=buttonText;
    else equation=equation+buttonText;
    flag=0;

  }
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
          child: Text(text, style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w400,color: Colors.white),)

      ),
    );
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
                    ),
                    TableRow(
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
              ),
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

