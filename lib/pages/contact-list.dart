import 'package:contant_creat/models/contact-model.dart';
import 'package:contant_creat/pages/date-format.dart';
import 'package:contant_creat/widgets/platform-alert-dialog.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList(
      {Key key, @required this.deleteContact, @required this.contactModel})
      : super(key: key);

  final DeleteContact deleteContact;
  final ContactModel contactModel;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(contactModel.id),
      
      background: Container(
        color: Colors.red[600],
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, ),
        ),
      ),
      
      onDismissed: (dm) {},
      direction: DismissDirection.endToStart,
      confirmDismiss: (dm) async {
        final result = await PlaformAlertWidget(
          title: "! Warning ",
          content: "Are You Sure ? \n You want to delete this Contact.",
          defaultAction: "OK",
          cancelAction: "Cancel",
        ).show(context);

        print(result);
        if (result) {
          final isSuccess = deleteContact(contactModel.id);
          if (isSuccess) {
            Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Contact Was Successfull deleted",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 2),
            ));
          }
          print(isSuccess);
        }
        return result;
      },
      
      child: Column(
        children: [
          ListTile(
            title: Text(contactModel.userName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(contactModel.userEmail),
                SizedBox(
                  height: 4,
                ),
                Text(dateFormat(contactModel.dob)),
                SizedBox(
                  height: 4,
                ),
                Text(contactModel.userPhone),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
