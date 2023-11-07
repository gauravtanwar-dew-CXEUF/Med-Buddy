import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String userName;
  final String userPhotoUrl;
  final String tagline;

  CustomHeader({required this.userName, required this.userPhotoUrl, required this.tagline});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
        boxShadow: [
          BoxShadow(
            color: Colors.black54, // Set the shadow color to black54
            blurRadius: 3, // Set the blur radius
            offset: Offset(0, 2), // Set the shadow to be below the container
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  userPhotoUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hi, $userName',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54, // Set the text color to black54
                    ),
                  ),
                  Text(
                    tagline,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54, // Set the text color to black54
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.shopping_cart_outlined, color: Colors.black54), // Set icon color to black54
              SizedBox(width: 16),
              Icon(Icons.notifications_none_outlined, color: Colors.black54), // Set icon color to black54
            ],
          ),
        ],
      ),
    );
  }
}
