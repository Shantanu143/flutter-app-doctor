import 'package:flutter/material.dart';
// import 'package:flutter_excel/flutter_excel.dart';

// import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Doctor App',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorListPage()),
                );
              },
              child: Text('View Doctors'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataEntryForm()),
                );
              },
              child: Text('Data Entry Form'),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorListPage extends StatelessWidget {
  final doctors = [
    'Dr. Sanjay',
  ];
  // 'Enter Patient Details',
  // 'View Patient Details',

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doctors[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AppointmentPage(doctorName: doctors[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class AppointmentPage extends StatefulWidget {
  final String doctorName;

  AppointmentPage({required this.doctorName});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Appointment'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Schedule an appointment with ${widget.doctorName}:',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );

                  if (pickedDate != null && pickedDate != selectedDate) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  'Select Date: ${selectedDate.toLocal()}'.split(' ')[0],
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text('One'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Appointment Scheduled'),
                              content: Text(
                                  'Your appointment with ${widget.doctorName} on ${selectedDate.toLocal()} has been scheduled.'),
                              actions: <Widget>[
                                TextButton(
                                    child: Text('two'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    })
                              ]);
                        });
                  }),
            ]),
      ),
    );
  }
}

class DataEntryForm extends StatefulWidget {
  @override
  _DataEntryFormState createState() => _DataEntryFormState();
}

class _DataEntryFormState extends State<DataEntryForm> {
  final _formKey = GlobalKey<FormState>();
  String fname = '';
  String lname = '';
  int age = 0;
  String email = '';
  String phone = '';
  String date_of_registration = '';
  String temperament = '';
  String case_history = '';

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Data Entry Form'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            fname = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            lname = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Date_of_Registration',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            date_of_registration = value;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );

                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Text(
                          'Select Date: ${selectedDate.toLocal()}'
                              .split(' ')[0],
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Temperament',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            temperament = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Case_History',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            case_history = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Age',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your age';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            age = int.tryParse(value) ?? 0;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Save the data to a database or send it to a server
                              print('fName: $fname');
                              print('lName: $lname');
                              print('Age: $age');
                              print('Email: $email');
                              print('Phone: $phone');
                              print(
                                  'Date_of_Registration: $date_of_registration');
                              print('Temperament : $temperament');
                              print('Case_History : $case_history');

                              // Clear the form fields
                              setState(() {
                                fname = '';
                                lname = '';
                                age = 0;
                                email = '';
                                phone = '';
                                date_of_registration = '';
                                temperament = '';
                                case_history = '';
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Data saved successfully'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}



// import 'package:flutter/material.dart';


// class ExcelScreen extends StatefulWidget {
//   @override
//   _ExcelScreenState createState() => _ExcelScreenState();
// }

// class _ExcelScreenState extends State<ExcelScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   List<List<dynamic>> _data = [];
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text('Excel Screen'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _isLoading ? CircularProgressIndicator() : Container(),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _data.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_data[index][0]),
//                     subtitle: Text(_data[index][1]),
//                   );
//                 },
//               ),
//             ),
//            ElevatedButton(
//               onPressed: _readExcel,
//               child: Text('Read Excel'),
//             ),
//             ElevatedButton(
//               onPressed: _saveExcel,
//               child: Text('Save Excel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _readExcel() async {
//     _data.clear();
//     setState(() {
//       _isLoading = true;
//     });

//     var file = await Excel.pickFile();
//     if (file == null) {
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     var excel = Excel.decodeBytes(file.readAsBytesSync());
//     for (var table in excel.tables.keys) {
//       for (var row in excel.tables[table].rows) {
//         _data.add(row);
//       }
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   _saveExcel() async {
//     if (_data.isEmpty) {
//       _scaffoldKey.currentState.showSnackBar(SnackBar(
//         content: Text('No data to save!'),
//       ));
//       return;
//     }

//     var excel = Excel.createExcel();
//     var sheet = excel['Sheet1'];
//     for (var row in _data) {
//       sheet.appendRow(row);
//     }

//     await excel.encode().then((onValue) {
//       FileSaveHelper.saveAndOpenFile(onValue, 'example.xlsx');
//     });
//   }
// }
