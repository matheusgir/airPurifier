import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          color: Colors.white,
          child: CircularPercentIndicator(
            radius: 280,
            lineWidth: 13,
            animation: true,
            percent: 0.7,
            center: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Filter Usage',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '70% Remaining',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.lightBlueAccent,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Text(
                    '29',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    'Temperature (°C)',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
                child: VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: const [
                  Text(
                    '73',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    'Humidity (°C)',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            button(label: 'A'),
            button(label: 'Freeze', icon: Icons.ac_unit),
            button(label: 'Night', icon: Icons.nightlife_rounded),
            button(label: 'Circulation', icon: Icons.wifi_protected_setup),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Icon(
            Icons.power_settings_new,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget button({String? label, IconData? icon}) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Align(
              alignment: Alignment.center,
              child: icon != null
                  ? Icon(icon)
                  : const Text(
                      'A',
                      style: TextStyle(fontSize: 25),
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(label!)
        ],
      ),
    );
  }
}
