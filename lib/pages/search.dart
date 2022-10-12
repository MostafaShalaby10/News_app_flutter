import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_bloc/app_cub.dart';
import 'package:news_app/app_bloc/states.dart';
import 'package:news_app/components/components.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, states>(
        builder: (context, state) {
          var list = appcubit.get(context).search_data;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                     decoration: BoxDecoration(
                       color: Colors.grey[100],
                       borderRadius: BorderRadius.circular(20)
                     ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text("Search"),
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(20))),
                        onChanged: (value) {
                          appcubit.get(context).getsearchdata(value) ;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ConditionalBuilder(
                          condition: list.length>0,
                          builder: (context) => builditem(list, context) ,
                      fallback: (context) => Center(child: CircularProgressIndicator(),),),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
