// ignore_for_file: unused_field, avoid_print, unused_local_variable, depend_on_referenced_packages

//import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:vbloom/models/person.model.dart';
//import "package:vbloom/parsers/person.parser.dart";
import 'package:whatsapp_clone/services/person.parser.dart';
import 'package:whatsapp_clone/models/person_model.dart';

class MatrimonyProfileList extends StatefulWidget {
  const MatrimonyProfileList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListWithSearchState createState() => _ListWithSearchState();
}

class _ListWithSearchState extends State<MatrimonyProfileList> {
  // List<String> items = List.generate(100, (index) => 'Item $index');
  List<Person> _persons = [];
  late Person _removedPerson;
  late Person _favPersons;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      List<Person> persons = await parsePersons();
      setState(() {
        _persons = persons;
      });
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  void _removePerson(Person person) {
    print('Removing person: ${person.name}');
    setState(() {
      _persons.remove(person);
    });
    _removedPerson = person;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${person.name} removed'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _persons.insert(_persons.indexOf(_removedPerson), _removedPerson);
          });
        },
      ),
    ));
  }

  void _favPerson(Person person) {
    print('Favoriting person: ${person.name}');
    setState(() {
      _persons.remove(person);
    });
    _favPersons = person;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${person.name} unfavorited'),
        duration: Duration(seconds: 5), // Set the duration to a longer duration
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              // _favPersons.insert(index, person);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles / प्रोफ़ाइल'),
        elevation: 0.25,
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Person / व्यक्ति खोजें',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Add your search logic here
                    },
                  ),
                ],
              )),
          Expanded(
            child: FutureBuilder<List<Person>>(
              future: parsePersons(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Person> persons = snapshot.data!;
                  return ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      final person = _persons[index];
                      return Dismissible(
                        key: Key(person.timestamp),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) => {
                          if (direction == DismissDirection.endToStart)
                            {
                              // Swiped left
                              print('Swiped left'),
                              _removePerson(person)
                            }
                          else if (direction == DismissDirection.startToEnd)
                            {
                              // Swiped right
                              _favPerson(person),
                              print('Swiped right')
                            }
                        },
                        background: Container(
                          color: Colors.red[100],
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: const Icon(Icons.delete),
                        ),
                        secondaryBackground: Container(
                          color: Colors.green[100],
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: const Icon(Icons.favorite),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(person: persons[index]),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: NetworkImage(
                                        "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg"),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(persons[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 20.0)),
                                              IconButton(
                                                icon: const Icon(Icons.favorite,
                                                    size: 18),
                                                onPressed: () {
                                                  // Add your favorite logic here
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.work, size: 12),
                                              const SizedBox(width: 6.0),
                                              Text(persons[index].education),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.supervised_user_circle,
                                                  size: 12),
                                              const SizedBox(width: 6.0),
                                              Text(persons[index].education),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.person_pin_circle,
                                                  size: 12),
                                              const SizedBox(width: 6.0),
                                              Text(persons[index].education),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading data'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Person person;

  const DetailsScreen({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Father\'s Name: ${person.fatherName}'),
            Text('Mother\'s Name: ${person.mother}'),
            Text('Height: ${person.height}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
