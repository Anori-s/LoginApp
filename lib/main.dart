import 'package:flutter/material.dart';
import 'users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FrontPage());
  }
}

bool eyeSecure = true;
Map<String, user> users = {
  "Norah@gmail.com": user(Email: 'Norah@gmail.com', pass: 'N123'),
  "Almas@gmail.com": user(Email: 'Almas@gmail.com', pass: 'Almas05'),
  "Haya@gmail.com": user(Email: 'Haya@gmail.com', pass: 'Yoyo1234'),
};

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "𝐀𝐧𝐨𝐫𝐢",
          style: TextStyle(
            fontSize: 40,
            color: Color.fromARGB(255, 92, 167, 224),
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 92, 167, 224),
          size: 25,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Color.fromARGB(255, 92, 167, 224),
            size: 25,
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.menu,
            color: Color.fromARGB(255, 92, 167, 224),
            size: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/FinalPic.jpg',
              width: 370,
              height: 370,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: emailCont,
                    decoration: const InputDecoration(
                      label: Text('Enter Email'),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 92, 167, 224),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: passCont,
                    obscureText: eyeSecure,
                    decoration: InputDecoration(
                      label: Text('Enter Password'),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 92, 167, 224),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              eyeSecure = !eyeSecure;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      user user1 = users[emailCont.text]!;
                      if (user1.Email == emailCont.text &&
                          user1.pass == passCont.text) {
                        print('logged');
                      } else {
                        print('either email or pass is incorrect');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 92, 167, 224),
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
