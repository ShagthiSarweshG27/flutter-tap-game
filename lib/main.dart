import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.blueAccent,
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  height: 150,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamePage()));
                  },
                  child: const Text("START"),
                ),
              )),
          Container(
              color: Colors.redAccent,
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: Center(
                child: MaterialButton(
                  color: Colors.white,
                  shape: CircleBorder(),
                  height: 150,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamePage()));
                  },
                  child: const Text("START"),
                ),
              )),
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double bluecardheight = 0;
  double redcardheight = 0;

  int playerascore = 0;
  int playerbscore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      bluecardheight = MediaQuery.of(context).size.height / 2;
      redcardheight = MediaQuery.of(context).size.height / 2;

      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(bluecardheight);
              setState(() {
                bluecardheight = bluecardheight + 30;
                redcardheight = redcardheight - 30;

                playerascore = playerascore + 5;
              });

              double winningheight = MediaQuery.of(context).size.height - 60;

              print(bluecardheight);
              print(winningheight);

              if (bluecardheight > winningheight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(playerascore, "a")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: bluecardheight,
              color: Colors.blueAccent,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Player A",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    playerascore.toString(),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                redcardheight = redcardheight + 30;
                bluecardheight = bluecardheight - 30;

                playerbscore = playerbscore + 5;
              });

              double screenheight = MediaQuery.of(context).size.height;
              double winningheight = MediaQuery.of(context).size.height - 60;

              print(redcardheight);
              print(winningheight);

              if (redcardheight > winningheight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(playerbscore, "b")));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: redcardheight,
              color: Colors.redAccent,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Player B",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    playerbscore.toString(),
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
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

class ResultPage extends StatefulWidget {
  int score = 0;
  String player = "";

  ResultPage(this.score, this.player);
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // To receive the score and player from the previous page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            widget.player == "a" ? Colors.blueAccent : Colors.redAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.score.toString(),
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.player == "a" ? "PLAYER A WON" : "PLAYER B WON",
                style: const TextStyle(fontSize: 35),
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  color: Colors.white,
                  child: const Text(
                    "Restart Game",
                  ))
            ],
          ),
        ));
  }
}
