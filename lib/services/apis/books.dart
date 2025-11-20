import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:students/models/books.dart';
import 'package:students/services/streams/books_streams.dart';
import '../../models/users.dart';
import '../../utils/network_util.dart';

class BookServices{
  FirebaseDatabase database = FirebaseDatabase.instance;
  final NetworkUtility _networkUtility = new NetworkUtility();
  DatabaseReference? _ref;

  // // GET BOOKS
  // Future getBooks()async{
  //   try {
  //     return await http.get(Uri.parse("https://gutendex.com/books"),
  //       headers: {
  //         "Accept": "application/json"
  //       },
  //     ).then((respo) async {
  //       var data = json.decode(respo.body);
  //       print("BOOKS ${data}");
  //       if (respo.statusCode == 200 || respo.statusCode == 201){
  //         booksModel.updateBook(data: data["results"]);
  //       }else{
  //         return null;
  //       }
  //     });
  //   } catch (e) {
  //     print("ERROR GET BOOKS $e");
  //   }
  // }

  Future borrowBook({required Map details, required DateTime start, required DateTime end})async{
    DatabaseReference usersRef = database.ref('borrow');
    await usersRef.push().set({
      "book_id": "${details["id"]}",
      "borrower": {
        "name": usersModel.valueLogged["name"],
        "age": usersModel.valueLogged["age"],
        "email": usersModel.valueLogged["email"],
        "school_id": usersModel.valueLogged["school_id"],
        "department": usersModel.valueLogged["department"],
        "year": usersModel.valueLogged["year"],
        "section": usersModel.valueLogged["section"],
      },
      "book_information": jsonEncode(details),
      "borrow_details": {
        "borrow_date": "$start",
        "end_date": "$end",
      },
      "status": "Pending"
    });
  }

  Future returnBook({required Map details})async{
    DatabaseReference usersRef = database.ref('return');
    await usersRef.push().set({
      "borrower": {
        "name": usersModel.valueLogged["name"],
        "age": usersModel.valueLogged["age"],
        "email": usersModel.valueLogged["email"],
        "school_id": usersModel.valueLogged["school_id"],
        "department": usersModel.valueLogged["department"],
        "year": usersModel.valueLogged["year"],
        "section": usersModel.valueLogged["section"],
      },
      "book_information": jsonEncode(details),
      "borrow_details": {
        "return_date": "${DateTime.now()}",
      }
    });
  }
}
final BookServices bookServices = new BookServices();