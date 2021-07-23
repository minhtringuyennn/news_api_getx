import 'package:flutter/material.dart';

class BuildArticle extends StatelessWidget {
  final controller;
  final int index;
  const BuildArticle({Key? key, required this.controller, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.articles[index].imageUrl == null
                ? Container()
                : Image.network(
                    controller.articles[index].imageUrl!,
                    errorBuilder: (context, exception, stackTrace) {
                      return Text('Your error widget...');
                    },
                  ),
            SizedBox(
              height: 8,
            ),
            controller.articles[index].title == null
                ? Container()
                : Text(
                    controller.articles[index].title!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            SizedBox(
              height: 4,
            ),
            controller.articles[index].desc == null
                ? Container()
                : Text(
                    controller.articles[index].desc!,
                  ),
          ],
        ),
      ),
    );
  }
}
