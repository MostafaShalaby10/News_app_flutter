import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_bloc/app_cub.dart';
import 'package:news_app/app_bloc/states.dart';
import 'package:news_app/pages/search.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, states>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: Text(
                  "News_APP"
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => search()));
                      },
                      icon: Icon(Icons.search)) ,
                  IconButton(
                      onPressed: () {
                      appcubit.get(context).changemode() ;
                      },
                      icon: Icon(Icons.dark_mode)) ,
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: appcubit.get(context).items,
                currentIndex: appcubit.get(context).current_index,
                onTap: (index) {
                  appcubit.get(context).changebottomnav(index);
                },
              ),
              body: appcubit
                  .get(context)
                  .pages[appcubit.get(context).current_index],
            ),
        listener: (context, state) {});
  }
}
