import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double cm = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";



  void _calculateBMI(){
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);

      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age> 0)
      && ((_heightController.text.isNotEmpty || cm > 0)
          && (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (height * height);


        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Under Weight";
          print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 18.5
            && result < 25) {
          _resultReading = "Perfect";
          print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 25.0
            && result < 30) {
          _resultReading = "Over weight";
          print(_resultReading);
        }else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
          print(_resultReading);
        }
      }else {
          result = 0.0;
        }
      });
    _finalResult = "Your BMI is ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: Center(child: new Text("BMI")),
        backgroundColor: Colors.blue,
        
      ),
      body: new Container(
        alignment: Alignment.topCenter,
          child:new ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              new Image.asset("images/bmilogo.png",
              height: 100,
              width: 100,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Container(
                  width: 300,
                  height: 300,
                  color: Colors.blue,
                  
                  child: Card(
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new Column(
                        children: <Widget>[
                          new TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Age",
                              hintText: "yrs",
                              icon: new Icon(Icons.person),
                            ),
                          ),new TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              labelText: "Height in meters",
                              hintText: " m ",
                              icon: new Icon(Icons.linear_scale),
                            ),
                          ),new TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Weight in kgs",
                              hintText: "kgs",
                              icon: new Icon(Icons.line_weight),
                            ),
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Container(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              onPressed: _calculateBMI,
                              color: Colors.white,
                              child: new Text("Calculate"),
                              textColor: Colors.black,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: new Column(
                children: <Widget>[
                  new Text("Your BMI $_finalResult",
                  style: new TextStyle(
                      fontSize: 25,

                  fontWeight: FontWeight.w800),),

                  new  Text(" $_resultReading",
                      style: new TextStyle(
                      fontSize: 25,

                      fontWeight: FontWeight.w800))
                ],

                )
              )

            ],

          ),
      ),

    );

  }
}
