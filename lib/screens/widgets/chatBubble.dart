import 'package:chat_with_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/message.dart';

class chatBubb extends StatelessWidget {
  const chatBubb({
    super.key,
    required this.mes,
  });

  final Message mes;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(.3),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    mes.message,
                    style: TextStyle(
                      fontSize: getOs() != 'android' ? 12 : 16,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              " ${DateFormat("hh:mm a").format(mes.date.toDate())}",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
