import 'package:flutter/material.dart';

import '../constants.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.asset(image),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Euronews",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0 / 2),
                    child: Text(
                      "On politics with Lisa Loureniani: Warren’s growing crowds",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        "Politics",
                        style: TextStyle(color: knewred),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16 / 2),
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: kbluelikanwhite,
                        ),
                      ),
                      Text(
                        "3m ago",
                        style: TextStyle(color: kwhitelikangrey),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}