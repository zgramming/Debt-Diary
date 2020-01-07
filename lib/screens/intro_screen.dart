import 'package:debt_diary/main.dart';
import 'package:debt_diary/widgets/intro_screen/custom_alertdialog.dart';
import 'package:flutter/material.dart';

import 'package:repository/repository.dart';

import '../widgets/intro_screen/pageview_content.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Repository _repository = Repository();

  TextEditingController _txtUserController = TextEditingController();

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          PageViewContent(
            buttonColor: Colors.black38,
            backgroundColor: Theme.of(context).accentColor,
            textColor: Colors.white,
            title: "Minimalize User Interface",
            subtitle: "Make Your Task Easier",
            backgroundImage: AssetImage("assets/images/pageview1.png"),
            buttonText: "NEXT",
            buttonIcon: Icon(Icons.chevron_right),
            onPressed: () => _repository.nextPageView(_pageController),
          ),
          PageViewContent(
            buttonColor: Colors.black38,
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            title: "Check Your Debt List",
            subtitle: "You Will Never Forget It Again  ",
            backgroundImage: AssetImage("assets/images/pageview2.png"),
            buttonText: "NEXT",
            buttonIcon: Icon(Icons.chevron_right),
            onPressed: () => _repository.nextPageView(_pageController),
          ),
          PageViewContent(
            buttonColor: Colors.black38,
            backgroundColor: Colors.lightBlue,
            textColor: Colors.white,
            title: "Please , Remember This ",
            subtitle: "If You Ready To Give , You Should Ready To Lost",
            backgroundImage: AssetImage("assets/images/pageview3.png"),
            buttonText: "DONE",
            buttonIcon: Icon(Icons.done),
            onPressed: () => showDialog(
              builder: (ctxDialog) => CustomAlertDialog(
                controller: _txtUserController,
                title: "Description About You",
                labelText: "Fill Your Name",
                errorTextEmpty: "Provided Name",
                routeName: MyApp.routeNamed,
              ),
              context: context,
              barrierDismissible: false,
            ),
          ),
        ],
      ),
    );
  }
}
