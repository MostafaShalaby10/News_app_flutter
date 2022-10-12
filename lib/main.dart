import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_bloc/app_cub.dart';
import 'package:news_app/app_bloc/states.dart';
import 'package:news_app/dio/api.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/pages/search.dart';

void main() {
  api.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => appcubit()
        ..getbusinessdata()
        ..getsciencesdata()
        ..getsportssdata() ,
      child: BlocConsumer<appcubit , states>(
          builder: (context , state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black
                  ),
                    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
                    actionsIconTheme: IconThemeData(color: Colors.black, size: 25),
                    color: Colors.white,
                    elevation: 5.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.black,
                ),
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold)
                ) ,
                progressIndicatorTheme: ProgressIndicatorThemeData(
                    color: Colors.black
                )  ,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
                    actionsIconTheme: IconThemeData(color: Colors.white, size: 25),
                    color: Colors.black,
                    elevation: 5.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Colors.black,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.grey[500]),
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold) ,
                ) ,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.white
        )
            ),
            themeMode: appcubit.get(context).isdark ? ThemeMode.light : ThemeMode.dark,
            home: home(),
          ),
          listener: (context , state){}),
    );
  }
}
