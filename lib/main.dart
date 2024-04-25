// ignore_for_file: unused_import

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:visitor/authentication/model/user_model.dart';
import 'package:visitor/authentication/view_model/Auth_view_model.dart';
import 'package:visitor/authentication/view_model/db_provider.dart';
import 'package:visitor/authentication/views/page/AuthScreen.dart';
import 'package:visitor/authentication/view_model/Auth_view_provider.dart';
import 'package:visitor/authentication/views/page/Login.dart';
import 'package:visitor/authentication/views/page/comfirm_updatepassword.dart';
import 'package:visitor/authentication/views/page/confirmotp_forgetpassword.dart';
import 'package:visitor/authentication/views/page/forget_password.dart';
import 'package:visitor/authentication/views/page/registe_user.dart';
import 'package:visitor/homepage/page/ContactLogPage.dart';
import 'package:visitor/homepage/page/ContactPersonInfoPage.dart';
import 'package:visitor/homepage/page/homePage.dart';
import 'package:visitor/homepage/page/mainHomePage.dart';
import 'package:visitor/homepage/view-model/scanqrProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DatabaseProvider dbProvider = DatabaseProvider();
  await dbProvider.getToken();
  await dbProvider.getUserId(); 
  runApp(MyApp(
    dbProvider: dbProvider,
  ));
}

class MyApp extends StatelessWidget {
  final DatabaseProvider dbProvider;
  const MyApp({Key? key, required this.dbProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel(context: context)),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
        ChangeNotifierProvider(create: (context) => ScanQrProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer<DatabaseProvider>(
          builder: (context, databaseProvider, _) {
            if (dbProvider.token != '') {
              // print('token === ${JwtDecoder.decode(dbProvider.token)}');
              return MainHomePage();
            } else {
              print('token === ${dbProvider.token}');
              return const AuthScreen();
            }
          },
        ),
      ),
    );
  }
}
