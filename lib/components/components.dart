import 'package:flutter/material.dart';
import 'package:news_app/pages/webview.dart';

Widget builditem(article , context) =>ListView.separated(
    itemBuilder: (context , index)=> InkWell(
      onTap: ()
      {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => webview('${article[index]['url']}')));

      },
      child: Container(
        padding: EdgeInsetsDirectional.only(top: 20),
        child: Row (
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0) ,
                  image: DecorationImage(
                    image: NetworkImage('${article[index]['urlToImage']}') ,
                    fit: BoxFit.cover ,
                  )
              ),
            ) ,
            SizedBox(
              width: 25,
            ) ,
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                          "${article[index]['title']}" ,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText2

                      ),
                    ) ,
                    SizedBox(
                      height: 10,
                    ) ,
                    Text(
                      "${article[index]['publishedAt']}" ,
                      style: TextStyle(
                        color: Colors.grey ,
                        fontSize: 20,
                      ),

                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    separatorBuilder: (context , index) => SizedBox(height: 10,) ,
    itemCount: article.length)  ;