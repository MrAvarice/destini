import 'package:flutter/material.dart';
import 'package:untitled7/story.dart';
import 'storybrain.dart';

StoryBrain story = StoryBrain();

void main() {
  runApp(destini());
}

class destini extends StatelessWidget {
  const destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: storyPage(),

    );
  }
}

class storyPage extends StatefulWidget {
  const storyPage({Key? key}) : super(key: key);

  @override
  State<storyPage> createState() => _storyPageState();
}

class _storyPageState extends State<storyPage> {

  void runProgram(){
    setState(() {
      story.getStory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
        ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 8,
              child: Center(
                child: Text(story.getStory(),
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 25.0,
                ),
              ),
              )
              ,
              ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                          setState(() {

                          story.nextStory(1);
                          runProgram();

                          });

                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        minimumSize: Size(double.infinity, 0),
                      ),
                      child: Text(story.getChoice1(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          story.nextStory(2);
                          runProgram();

                        });

                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        minimumSize: Size(double.infinity, 0),
                      ),
                      child: Text(story.getChoice2(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                      ),
                    ),
                  ),
                ),
            ],
          )
        ),
      ),
      ),
    );
  }
}
