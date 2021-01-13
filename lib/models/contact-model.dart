class ContactModel {
  String id;
  String userName;
  String userEmail;
  DateTime dob;
  String userPhone;

  ContactModel(
      {this.id, this.dob, this.userName, this.userEmail, this.userPhone});
}

typedef AddContact = void Function(ContactModel);
typedef DeleteContact = bool Function(String);