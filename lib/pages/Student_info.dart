import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class StuList extends StatefulWidget {
  const StuList({Key? key}) : super(key: key);

  @override
  State<StuList> createState() => _StuListState();
}

class _StuListState extends State<StuList> {

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<QuerySnapshot>(context);
    print(list);
    return const Placeholder();
  }
}
