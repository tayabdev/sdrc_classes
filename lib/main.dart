import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdrc_classes/core/routes/route_generator.dart';
import 'package:sdrc_classes/ui/views/auth/signup/signup_view.dart';
import 'package:sdrc_classes/ui/views/home/home_view.dart';
import 'package:sdrc_classes/ui/views/home/home_view_model.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const CheckAuthStatus(),
      initialRoute: SignupView.routeName,
      onGenerateRoute: (settings) => RouteGenerator.onGenerateRoute(settings),
      // routes: {
      //   '/login/': (context) => SigninView(),
      //   '/signup/': (context) => SignupView(),
      //   '/home/': (context) => HomeView()
      // },
    );
  }
}

class CheckAuthStatus extends StatefulWidget {
  const CheckAuthStatus({super.key});

  @override
  State<CheckAuthStatus> createState() => _CheckAuthStatusState();
}

class _CheckAuthStatusState extends State<CheckAuthStatus> {
  // Defined flag variable for user management operations
  bool isUserInTheApp = false;

  // method to verify if user exists in the phone
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> isUserPresent() async {
    if (firebaseAuth.currentUser != null) {
      isUserInTheApp = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isUserPresent(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.pink,
          );
        } else {
          if (firebaseAuth.currentUser != null) {
            return HomeView();
          } else {
            return const SignupView();
          }
          // return Text('Data');
        }
      },
    );
  }
}
