import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:viva/DoodlesHomesPage.dart';
import 'package:viva/firebase_options.dart';
import 'package:viva/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:viva/phoneno.dart';

Future<void> main() async{
  // Remove the default debug tag from the console output
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  SystemChannels.platform.invokeMethod<void>(
    'SystemUiOverlayStyle.updateDebug',
    false,
  );

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPasswordController = TextEditingController();
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: Container(
              width: 350,
              height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 50,
                  ),
                  Text(
                    "Login Page",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 70,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: userNameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter your user name "),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: userPasswordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Enter the Password "),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String USERNAME = "";
                      String PASSWORD = "";

                      String userName = userNameController.text;
                      String userPassword = userPasswordController.text;

                      if(userName != USERNAME && userPassword != PASSWORD)
                        {
                          databaseReference.child('users').push().set({
                            'username': userName,
                            'password': userPassword,
                          }).then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const phoneNo()),
                            );
                            Fluttertoast.showToast(
                              msg: "Successfully Login",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red[300],
                              textColor: Colors.white,
                            );
                          });
                        }
                      else
                        {
                          Fluttertoast.showToast(
                            msg: "Incorrect username or password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red[300],
                            textColor: Colors.white,
                          );
                        }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
