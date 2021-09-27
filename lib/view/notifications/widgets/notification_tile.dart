import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {Key? key, required this.headerText, required this.bodyText})
      : super(key: key);
  final String headerText;
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Icon(CupertinoIcons.bell_fill),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(headerText,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 9,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(bodyText,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 10,
                    style:
                        const TextStyle(fontSize: 14.0, color: Colors.black54)),
              )
            ],
          ),
        )
      ],
    );
  }
}
