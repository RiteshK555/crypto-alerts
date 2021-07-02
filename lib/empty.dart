import 'package:flutter/material.dart';
class Empty extends StatelessWidget {
  const Empty({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 44),
        child: Text(
            'Empty',
          style: TextStyle(
            fontSize: 30,
            fontWeight:FontWeight.w100
          ),
        ),
      ),
    );
  }
}
