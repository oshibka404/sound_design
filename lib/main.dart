import 'package:flutter/material.dart';
import 'dsp_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _gate = false;

  double _osc1Level = 0;

  double _osc2Level = 0;

  @override
  void initState() {
    initDsp();

    super.initState();
  }

  void initDsp() async {
    await DspApi.start();
    var initGate = await DspApi.getParamInitByPath("/Sound_Design/gate");
    var initOsc1 = await DspApi.getParamInitByPath("/Sound_Design/osc1_level");
    var initOsc2 = await DspApi.getParamInitByPath("/Sound_Design/osc2_level");

    setState(() {
      _gate = initGate != 0;
      _osc1Level = initOsc1;
      _osc2Level = initOsc2;
    });
  }

  void _toggleBeep() {
    setState(() {
      _gate = !_gate;
    });

    DspApi.setParamValueByPath("/Sound_Design/gate", _gate ? 1 : 0);
  }

  void setOsc1Level(double level) {
    setState(() {
      _osc1Level = level;
    });

    DspApi.setParamValueByPath("/Sound_Design/osc1_level", level);
  }

  void setOsc2Level(double level) {
    setState(() {
      _osc2Level = level;
    });

    DspApi.setParamValueByPath("/Sound_Design/osc2_level", level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Oscillator 1"),
          Slider(value: _osc1Level, onChanged: setOsc1Level),
          Text("Oscillator 2"),
          Slider(value: _osc2Level, onChanged: setOsc2Level),
          RaisedButton(
            onPressed: _toggleBeep,
            child: Text(_gate ? 'Stop' : 'Beep'),
            color: _gate ? Colors.red : Colors.amber,
          ),
        ],
      ),
    );
  }
}
