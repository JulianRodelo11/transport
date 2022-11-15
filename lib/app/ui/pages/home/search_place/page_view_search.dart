import 'package:app_transport/app/ui/pages/home/search_place/widgets/pick_from_map_buttom.dart';
import 'package:flutter/material.dart';

class PageViewSearch extends StatelessWidget {
  const PageViewSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const PickFromMapButton(),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                height: 3,
                width: double.infinity,
                color: const Color(0xFFF8F8F8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                height: 55,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xFF1ed760),
                      radius: 15,
                      child: Icon(
                        Icons.home,
                        size: 19,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Agregar casa",
                        style: TextStyle(
                            color: Color(0xFF242527),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                height: 3,
                width: double.infinity,
                color: const Color(0xFFF8F8F8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                height: 55,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xFF1ed760),
                      radius: 15,
                      child: Icon(
                        Icons.work,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Agregar trabajo",
                        style: TextStyle(
                            color: Color(0xFF242527),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                height: 3,
                width: double.infinity,
                color: const Color(0xFFF8F8F8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                height: 55,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xFFeeeeee),
                      radius: 15,
                      child: Icon(
                        Icons.star,
                        size: 19,
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Lugares guardados",
                        style: TextStyle(
                            color: Color(0xFF242527),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 20.0),
              child: Container(
                height: 3,
                width: double.infinity,
                color: const Color(0xFFF8F8F8),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
