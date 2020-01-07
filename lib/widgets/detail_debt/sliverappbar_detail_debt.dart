import 'dart:io';

import 'package:flutter/material.dart';

class SliverAppBarDetailDebt extends StatelessWidget {
  final DateTime id;
  final String imageReceiver;
  final String receiverName;
  SliverAppBarDetailDebt({this.id, this.imageReceiver, this.receiverName});
  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: mqHeight / 2.5,
      pinned: true,
      floating: true,
      title: Text(receiverName),
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: id,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  File(imageReceiver),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
