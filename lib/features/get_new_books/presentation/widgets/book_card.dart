import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.image,
    required this.title,
    required this.isbn13,
    required this.subtitle,
    required this.press,
  }) : super(key: key);

  final String image, title, isbn13, subtitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height / 3,
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Placeholder(color: Colors.grey,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, top: 0, right: 0.0, bottom: 0.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.visible,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, top: 0, right: 0.0, bottom: 0.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          isbn13,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.visible,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, top: 10, right: 0.0, bottom: 0.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          subtitle,
                          style: TextStyle(color: Colors.black38),
                          overflow: TextOverflow.visible,
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
