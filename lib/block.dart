import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  final Map<String, dynamic> item;
  const Block({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 210,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/defaultImage.png',
                image: item['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item['article'].toString(),
            style: TextStyle(color: const Color(0xff8B9BA9), fontSize: 13),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            item['name'],
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${item['price'] == null ? 0 : item['price']} руб.',
            style: TextStyle(
                fontFamily: 'ProximaNova',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
