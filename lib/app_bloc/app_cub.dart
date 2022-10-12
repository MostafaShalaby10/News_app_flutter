import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_bloc/states.dart';
import 'package:news_app/dio/api.dart';
import 'package:news_app/pages/business.dart';
import 'package:news_app/pages/science.dart';
import 'package:news_app/pages/sports.dart';

class appcubit extends Cubit<states> {
  appcubit() : super(initialstates());

  static appcubit get(context) => BlocProvider.of(context);

  int current_index = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_esports_outlined), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  List pages = [business(), sports(), science()];

  void changebottomnav(int index) {
    current_index = index;
    emit(bottomnavchangestate());
  }

  List<dynamic> business_data = [];

  void getbusinessdata() {
    emit(loadingbusinessstate());
    api.getdata(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
    }).then((value) {
      business_data = value.data['articles'];
      emit(successbusinessstate());
    }).catchError((error) {
      print(error.toString());
      emit(errorbusinessstate());
    });
  }

  List<dynamic> sports_data = [];

  void getsportssdata() {
    emit(loadingsportsstate());
    api.getdata(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'sports',
      'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
    }).then((value) {
      sports_data = value.data['articles'];
      emit(successsportsstate());
    }).catchError((error) {
      print(error.toString());
      emit(errorsportsstate());
    });
  }

  List<dynamic> science_data = [];

  void getsciencesdata() {
    emit(loadingsciencestate());
    api.getdata(url: 'v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
    }).then((value) {
      science_data = value.data['articles'];
      emit(successsciencestate());
    }).catchError((error) {
      print(error.toString());
      emit(errorsciencestate());
    });
  }

  List<dynamic> search_data = [];

  void getsearchdata(String value) {
    emit(loadingsearchstate());
    api.getdata(url: 'v2/everything', query: {
      'q': value,
      'apiKey': 'ff942302e838446ba58edb4b05aa1b99'
    }).then((value) {
      search_data = value.data['articles'];
      emit(successsearchstate());
    }).catchError((error) {
      print(error.toString());
      emit(errorsearchstate());
    });
  }

  bool isdark = true;

  void changemode() {
    isdark = !isdark;
    getbusinessdata() ;
    getsciencesdata() ;
    getsportssdata();
    emit(changemodestate());
  }
}
