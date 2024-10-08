
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class QuizeData {
  String? quesations;
  List? options = [];
  int? ansIndex;
  String? explanation;

  QuizeData({this.quesations, this.options, this.ansIndex, this.explanation});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Quize app",
        debugShowCheckedModeBanner: false,
        home: QuizeApp());
  }
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});

  @override
  State createState() {
    return QuizeAppState();
  }
}

class QuizeAppState extends State {
  List allQuestions = [
    QuizeData(
        quesations: "Which contry win the WoldCup 2024?",
        options: ["India", "Australia", "England", "Newzealand"],
        ansIndex: 1,
        explanation:
            "The final match of the ICC World Cup 2023 was India vs Australia. Australian cricket team won the final match by 6 wickets against India."),
    QuizeData(
        quesations: "Who is the founder of Microsoft?",
        options: ["Teave job", "Elone Marks", "Bil gets", "Mukesh ambani"],
        ansIndex: 2,
        explanation:
            "Microsoft was founded by Bill Gates and Paul Allen on April 4, 1975, to develop and sell BASIC interpreters for the Altair 8800."),
    QuizeData(
        quesations: "Capital of India?",
        options: ["Mumbai", "New Delhi", "Kolkata", "Chenai"],
        ansIndex: 1,
        explanation:
            "New Delhi is a city in northern India, and capital of the country. It is located in the National Capital Territory of Delhi, on the Yamuna River."),
    QuizeData(
        quesations: "Capital of Maharastra?",
        options: ["Mumbai", "Indor", "Nagpur", "Pune"],
        ansIndex: 0,
        explanation:
            "Mumbai is the capital of Maharashtra. Mumbai is widely known as the financial, commercial, and entertainment capital of India. Until 1995, Bombay was the official name of Mumbai."),
    QuizeData(
        quesations: "Who is the founder of Apple?",
        options: ["Teave job", "Elone Marks", "Bil gets", "Mukesh ambani"],
        ansIndex: 0,
        explanation:
            "Steven Paul Jobs was an American businessman, inventor, and investor best known for co-founding the technology giant Apple Inc."),
  ];
  bool isQueationScreen = true;
  int choiceAnsIndex = -1;
  int questionIndex = 0;
  int score = 0;
  bool optionselected = true;

  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  Scaffold getScaffold() {
    if (isQueationScreen == true) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 164, 225, 255),
            onPressed: () {
              if (choiceAnsIndex != -1) {
                if (allQuestions[questionIndex].ansIndex == choiceAnsIndex) {
                  //score++;
                }

                if (questionIndex < allQuestions.length - 1) {
                  questionIndex++;
                  choiceAnsIndex = -1;
                  optionselected = true;
                } else {
                  isQueationScreen = false;
                }
                ;
              } else {
                optionselected = false;
              }
              setState(() {});
            },
            child: const Text(
              "Next",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          appBar: AppBar(
            elevation: 100,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            centerTitle: true,
            title: const Text(
              "Tech Quize",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: const Color.fromARGB(255, 164, 225, 255),
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Queations : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "${questionIndex + 1} / ${allQuestions.length}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Score : ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "$score / ${allQuestions.length}",
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: 330,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 164, 225, 255),
              ),
              child: Text(
                allQuestions[questionIndex].quesations,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (choiceAnsIndex == -1) {
                    setState(() {
                      choiceAnsIndex = 0;
                      optionselected = true;
                    });
                    if (allQuestions[questionIndex].ansIndex ==
                        choiceAnsIndex) {
                      score++;
                    }
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: getColor(0),
                    fixedSize: const Size(270, 48)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "    A.    ${allQuestions[questionIndex].options[0]}",
                      style: const TextStyle(
                          fontSize: 18.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    getSign(0)
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (choiceAnsIndex == -1) {
                    setState(() {
                      choiceAnsIndex = 1;
                      optionselected = true;
                    });
                    if (allQuestions[questionIndex].ansIndex ==
                        choiceAnsIndex) {
                      score++;
                    }
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: getColor(1),
                    fixedSize: const Size(270, 48)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "    B    ${allQuestions[questionIndex].options[1]}",
                      style: const TextStyle(
                          fontSize: 18.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    getSign(1)
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (choiceAnsIndex == -1) {
                    setState(() {
                      choiceAnsIndex = 2;
                      optionselected = true;
                    });
                    if (allQuestions[questionIndex].ansIndex ==
                        choiceAnsIndex) {
                      score++;
                    }
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: getColor(2),
                    fixedSize: const Size(270, 48)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "    C.    ${allQuestions[questionIndex].options[2]}",
                      style: const TextStyle(
                          fontSize: 18.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    getSign(2)
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  if (choiceAnsIndex == -1) {
                    setState(() {
                      choiceAnsIndex = 3;
                      optionselected = true;
                    });
                    if (allQuestions[questionIndex].ansIndex ==
                        choiceAnsIndex) {
                      score++;
                    }
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: getColor(3),
                    fixedSize: const Size(270, 48)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "    D.    ${allQuestions[questionIndex].options[3]}",
                      style: const TextStyle(
                          fontSize: 18.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    getSign(3)
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            (choiceAnsIndex != -1)
                ? Container(
                    height: 120,
                    width: 350,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 120,
                          width: 300,
                          child: Text(
                            allQuestions[questionIndex].explanation,
                            style: const TextStyle(fontSize: 17),
                          ))
                    ]),
                  )
                : Container(),
            (optionselected == true)
                ? const SizedBox()
                : const SizedBox(
                    child: Text(
                      "please select an option",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
          ]));
    } else {
      return Scaffold(
          appBar: AppBar(
            elevation: 100,
            /*shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),*/
            centerTitle: true,
            title: const Text(
              "Tech Quize",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            backgroundColor: const Color.fromARGB(255, 114, 195, 236),
          ),
          body: Container(
              alignment: Alignment.center,
              color: Colors.black54,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 12,
                      blurRadius: 28,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 550,
                width: 320,
                child: Column(children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    "https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
                    height: 270,
                    width: 350,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Congratulation ! ! !",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                        color: Colors.orange),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "You have completed the Quize",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Score : $score/${allQuestions.length}",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 40),
                        backgroundColor:
                            const Color.fromARGB(255, 164, 225, 255),
                      ),
                      onPressed: () {
                        isQueationScreen = true;
                        questionIndex = 0;
                        score = 0;
                        choiceAnsIndex = -1;
                        setState(() {});
                      },
                      child: const Text("Reset",
                          style: TextStyle(fontSize: 18, color: Colors.black)))
                ]),
              )));
    }
  }

  Color? getColor(int buttonNo) {
    if (allQuestions[questionIndex].ansIndex == buttonNo &&
        choiceAnsIndex != -1) {
      return Colors.green.shade100;
    } else if (buttonNo == choiceAnsIndex) {
      return Colors.red.shade100;
    } else {
      return null;
    }
  }

  Widget getSign(int buttonNo) {
    if (allQuestions[questionIndex].ansIndex == buttonNo &&
        choiceAnsIndex != -1) {
      return const CircleAvatar(
        backgroundColor: Colors.green,
        radius: 10,
        child: Icon(
          Icons.check,
          size: 15,
        ),
      );
    } else if (buttonNo == choiceAnsIndex) {
      return const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 10,
        child: Icon(
          Icons.close,
          size: 15,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
