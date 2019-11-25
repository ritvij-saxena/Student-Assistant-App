import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>();
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Student Assistant App',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {},
              color: Colors.white,
              child: Text(
                'Register / Sign In',
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Container(
            height: 300,
            width: 400,
            child: Card(
              elevation: 5.0,
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login Page',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) => email = value,
                        decoration: InputDecoration(
                            labelText: "Email ID", hintText: "Email ID"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter EMAIL ID';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onSaved: (value) => password = value,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Some string';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Password", hintText: "Password"),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Flexible(
                      child: RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (key.currentState.validate()) {
                            key.currentState.save();
                            print(email);
                            print(password);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.white])),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Widget bodyWidget;
  bool set = false;

  Widget schedule() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: Container(
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Time/Days')),
                  DataColumn(label: Text('Monday')),
                  DataColumn(label: Text('Tuesday')),
                  DataColumn(label: Text('Wednesday')),
                  DataColumn(label: Text('Thursday')),
                  DataColumn(label: Text('Friday')),
                  DataColumn(label: Text('Saturday')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('9:30 AM')),
                    DataCell(Text('Machine Learning')),
                    DataCell(Text('-')),
                    DataCell(Text('Biometrics')),
                    DataCell(Text('Machine Learning')),
                    DataCell(Text('-')),
                    DataCell(Text('Biometrics')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('11:00 AM')),
                    DataCell(Text('Machine Learning')),
                    DataCell(Text('-')),
                    DataCell(Text('Biometrics')),
                    DataCell(Text('Machine Learning')),
                    DataCell(Text('-')),
                    DataCell(Text('Biometrics')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('12:30 AM')),
                    DataCell(Text('-')),
                    DataCell(Text('Software Engineering')),
                    DataCell(Text('Biometrics')),
                    DataCell(Text('Machine Learning')),
                    DataCell(Text('-')),
                    DataCell(Text('Biometrics')),
                  ]),
                ],
              )),
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                color: Colors.white,
                child: DataTable(
                  columns: [DataColumn(label: Text('Your TAs'))],
                  rows: [
                    DataRow(cells: [DataCell(Text('John Smith'))]),
                    DataRow(cells: [DataCell(Text('Bea Tron'))]),
                    DataRow(cells: [DataCell(Text('Carl Shay'))])
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                color: Colors.white,
                child: DataTable(
                  columns: [DataColumn(label: Text('Your Professors'))],
                  rows: [
                    DataRow(cells: [DataCell(Text('Spencer Smith'))]),
                    DataRow(cells: [DataCell(Text('Jay Cooper'))]),
                    DataRow(cells: [DataCell(Text('Mario Slyborn'))])
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                color: Colors.white,
                child: DataTable(
                  columns: [DataColumn(label: Text('Your Appointments'))],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('10AM @ SB 202 with John Smith'))
                    ]),
                    DataRow(cells: [
                      DataCell(Text('12:30 AM @ SB 209 with Dennis Hood'))
                    ]),
                    DataRow(cells: [DataCell(Text(''))])
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget professorSchedule() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('Your Professors')),
                  DataColumn(label: Text('')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Department')),
                    DataCell(Text('Class')),
                    DataCell(Text('Name')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('CS')),
                    DataCell(Text('487')),
                    DataCell(Text('Dennis Hood')),
                  ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 400,
                    width: 400,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(hintText: 'Email'),
                            ),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text(
                            'Send Mail To Professor',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    height: 400,
                    width: 400,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Text('Calendar +  Day + Time')),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text(
                            'Schedule Appointment',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget taSchedule() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('Your TAS')),
                  DataColumn(label: Text('')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Department')),
                    DataCell(Text('Class')),
                    DataCell(Text('Name')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('CS')),
                    DataCell(Text('487')),
                    DataCell(Text('Mike Sanchez')),
                  ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 400,
                    width: 400,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(hintText: 'Email'),
                            ),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text(
                            'Send Mail To TAs',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Container(
                    height: 400,
                    width: 400,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Text('Calendar +  Day + Time')),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text(
                            'Schedule Appointment',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget settings() {
    return Center(child: Column(children: [
      SizedBox(height: 20.0,),
       Row(
            children: <Widget>[
              Flexible(
                child: Container(color: Colors.white,
                    child: Column(
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: "New Password",hintText: "New Password"),),
                    TextField(decoration: InputDecoration(labelText: "Confirm Password",hintText: "Confirm Password"),),
                    RaisedButton(
                      color: Colors.red,
                      child: Text('Change Password',style: TextStyle(color: Colors.white),),
                      onPressed: (){},
                    )
                  ],
                )),
              ),
              SizedBox(width: 10.0,),
              Flexible(
                child: Container(color:Colors.white,child: Column(
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: "New Username",hintText: "New Username"),),
                    RaisedButton(
                      color: Colors.red,
                      child: Text('Change Password',style: TextStyle(color: Colors.white),),
                      onPressed: (){},
                    )
                  ],
                )),
              ),
            ],
       ),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Student Assistant App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Center(child: Text('Detail Schedule')),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    set = true;
                    bodyWidget = schedule();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Center(child: Text('Professors')),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    set = true;
                    bodyWidget = professorSchedule();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Center(child: Text('Teaching Assistants')),
                onPressed: () {
                  setState(() {
                    set = true;
                    bodyWidget = taSchedule();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Center(child: Text('Settings')),
                onPressed: () {
                  setState(() {
                    set = true;
                    bodyWidget = settings();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Center(child: Text('Logout')),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Colors.white])),
        child: set ? bodyWidget : schedule(),
      ),
    );
  }
}
