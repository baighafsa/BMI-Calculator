import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inchController=TextEditingController();
  var result="";
var bgColor=Colors.indigo[100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
             backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in kgs'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in ft'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in inches'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch =inchController.text.toString();
if(wt!="" && ft!="" && inch!=""){
  var intwt=int.parse(wt);
  var intft=int.parse(ft);
  var intInch=int.parse(inch);

  var totalInch=(intft*12)+intInch;
  var totalcm=totalInch*2.54;
  var totalm=totalcm/100;

  var bmi=intwt/(totalm*totalm);
  var msg="";
  if(bmi>25){
    msg='You are OverWeight';
    bgColor=Colors.orange.shade200;
  }else if(bmi<18){
    msg='You are UnderWeight';
    bgColor=Colors.red.shade200;
  }else{
    msg='You are Healthy';
    bgColor=Colors.green.shade200;
  }
setState((){
  result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
});
}
else{
  setState(() {
    result="Please fill all the required fields!";
  });
}
                },
                    child: Text('Calculate')),
                SizedBox(
                  height:11
                ),
                Text(result, style: TextStyle(fontSize: 19,
                color: Colors.black),)

              ],
            ),
          ),
        ),
      )
    );
  }
}
