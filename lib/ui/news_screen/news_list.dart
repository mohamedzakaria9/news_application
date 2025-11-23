import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/custom_widgets/custom_news_container.dart';
import 'package:news_app/providers/source_provider.dart';
import 'package:provider/provider.dart';

import '../../utiles/AppColors.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Consumer<SourceProvider>(
      builder: (context, value, child) {
        if (value.sourceId == null) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {
          print("i'm now in the else of the future bilder of the news list");
          print("this is the  value of  source id : ${value.sourceId!}");
          return FutureBuilder(
            future: ApiManager.getNews(value.sourceId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              } else if (snapshot.hasError) {
                print("this is the error ${snapshot.error}");
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SomeThing went wrong",
                        style: TextStyle(color: Colors.amber),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ApiManager.getNews(value.sourceId!);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.geryColor,
                        ),
                        child: Text(
                          "Try Again",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                if (snapshot.data!.status! != "error") {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomNewsContainer(article: snapshot.data!.articles![index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height*0.02,);
                    },
                    itemCount: snapshot.data!.articles!.length,
                  );
                } else {
                  return Column(
                    children: [
                      Text(snapshot.data!.message!),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Try Again"),
                      ),
                    ],
                  );
                }
              }
            },
          );
        }
      },
    );
  }
}
