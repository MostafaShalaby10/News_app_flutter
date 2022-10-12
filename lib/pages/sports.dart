import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_bloc/app_cub.dart';
import 'package:news_app/app_bloc/states.dart';
import 'package:news_app/components/components.dart';

class sports extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, states>(
        builder: (context, state) {
          var list = appcubit
              .get(context)
              .sports_data;
          return ConditionalBuilder(
            condition: list.length>0,
            builder: (context)=>builditem(list, context) ,
            fallback: (context)=>Center(child: CircularProgressIndicator(),),
          );
        },
        listener: (context, state) {}) ;
  }
}
