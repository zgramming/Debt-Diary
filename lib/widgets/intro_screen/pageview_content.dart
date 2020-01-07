import 'package:flutter/material.dart';

class PageViewContent extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color buttonColor;
  final String title;
  final String subtitle;
  final String buttonText;
  final Icon buttonIcon;
  final ImageProvider<dynamic> backgroundImage;
  final Function onPressed;

  PageViewContent({
    @required this.backgroundColor,
    @required this.textColor,
    @required this.buttonColor,
    @required this.title,
    @required this.subtitle,
    @required this.buttonText,
    @required this.buttonIcon,
    @required this.backgroundImage,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      letterSpacing: 1.75,
                      height: 1.5,
                    ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              height: double.infinity,
              child: CircleAvatar(
                backgroundImage: backgroundImage,
                radius: MediaQuery.of(context).size.width / 2.5,
              ),
            ),
          ),
          // SizedBox(height: 50),
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: textColor,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: RaisedButton.icon(
              color: buttonColor,
              textTheme: ButtonTextTheme.primary,
              icon: buttonIcon,
              label: Text(buttonText),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
