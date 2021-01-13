import 'package:contant_creat/pages/date-format.dart';
import 'package:contant_creat/pages/form-validation.dart';
import 'package:contant_creat/pages/theme-provider.dart';
import 'package:contant_creat/widgets/form-button.dart';
import 'package:contant_creat/widgets/theme-widget.dart';
import 'package:flutter/material.dart';
import 'package:contant_creat/models/contact-model.dart';
import 'package:contant_creat/widgets/app-text-field.dart';
import 'package:provider/provider.dart';

class AddForm extends StatefulWidget {
  AddForm({Key key, @required this.addContact}) : super(key: key);
  final AddContact addContact;
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> with AppValidation {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final formState = GlobalKey<FormState>();
  DateTime dob;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Add Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Form(
          key: formState,
          child: ListView(
            children: [
              AppTextField(
                icon: Icons.person,
                validator: validateName,
                label: "User Name",
                hintText: "Enter Your Name",
                textEditingController: name,
                prefix: null,
              ),
              AppTextField(
                icon: Icons.email,
                validator: validateEmail,
                label: "User Email",
                hintText: "Enter Your Email",
                textEditingController: email,
                prefix: null,
                textInputType: TextInputType.emailAddress,
              ),
              AppTextField(
                icon: Icons.phone,
                validator: validatePhone,
                label: "User Phone",
                hintText: "Enter Your Phone",
                textEditingController: phone,
                prefix: "+95",
                textInputType: TextInputType.phone,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(top: 16, left: 8, bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(Icons.today, color: Colors.grey),
                      onTap: _pickDOB,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(dob != null ? dateFormat(dob) : "Select dob"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      color: Color(0xFFff793f),
                      child: themeProvider.getTheme() == darkTheme
                          ? Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            )
                          : Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        color: Color(0xFFff793f),
                        child: themeProvider.getTheme() == darkTheme
                            ? Text(
                                "Save",
                                style: TextStyle(color: Colors.black),
                              )
                            : Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                        onPressed: submit),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickDOB() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    setState(() {
      dob = pickedDate;
    });
  }

  void submit() {
    var username = name.text;
    var useremail = email.text;
    var userphone = phone.text;

    final newContact = ContactModel(
      userEmail: useremail,
      userPhone: userphone,
      userName: username,
      dob: dob,
    );

    if (formState.currentState.validate()) {
      widget.addContact(newContact);
      Navigator.of(context).pop();
    }
  }
}
