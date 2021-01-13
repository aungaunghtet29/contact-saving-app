import 'package:contant_creat/models/contact-model.dart';
import 'package:contant_creat/pages/add-form.dart';
import 'package:contant_creat/pages/contact-list.dart';
import 'package:contant_creat/pages/setting-page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myContacts = [
    ContactModel(
        id: DateTime.now().toIso8601String(),
        userName: "Aung Aung",
        userEmail: "aungaung@gmail.com",
        dob: DateTime.now(),
        userPhone: "097823349"),
    ContactModel(
        id: DateTime.now().toIso8601String(),
        userName: "Kyaw Kyaw",
        userEmail: "kyawkyaw@gmail.com",
        dob: DateTime.now(),
        userPhone: "097830320"),
    ContactModel(
        id: DateTime.now().toIso8601String(),
        userName: "Htet Paing",
        userEmail: "htetpaing@gmail.com",
        dob: DateTime.now(),
        userPhone: "099887368"),
    ContactModel(
        id: DateTime.now().toIso8601String(),
        userName: "Aung Kaung",
        userEmail: "aungkaung@gmail.com",
        dob: DateTime.now(),
        userPhone: "099864349"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Contact Save"),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddForm(
                            addContact: addContact,
                          )));
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ContactList(
                contactModel: myContacts[index],
                deleteContact: deleteContact,
              );
            }, childCount: myContacts.length),
          ),
        ],
      ),
    );
  }

  void addContact(ContactModel contactModel) {
    setState(() {
      myContacts.add(contactModel);
    });
  }

  bool deleteContact(String id) {
    myContacts.removeWhere((item) => item.id == id);
    return true;
  }
}
