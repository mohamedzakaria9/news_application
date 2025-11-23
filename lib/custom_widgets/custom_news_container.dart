import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponce.dart';
import 'package:news_app/utiles/AppFonts.dart';

class CustomNewsContainer extends StatelessWidget {
  Articles article;

  CustomNewsContainer({super.key, required this.article});

  late bool isNull = (article.urlToImage == null || article.author == null ||
      article.publishedAt == null || article.title == null ||
      article.description == null) ? true : false;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme
            .of(context)
            .primaryColor, width: 1),
        borderRadius: BorderRadius.circular(15),
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      child: isNull ? Container() : Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              article.urlToImage!,
              width: width,
              height: height * 0.25,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(article.title!, style: Theme
              .of(context)
              .textTheme
              .labelLarge),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.3,
                child: Text(
                  article.author!,
                  style: AppFonts.medium12Grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(article.publishedAt!, style: AppFonts.medium12Grey),
            ],
          ),
        ],
      ),
    );
  }
}
