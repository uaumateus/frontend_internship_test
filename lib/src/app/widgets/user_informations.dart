import 'package:flutter/material.dart';
import 'package:frontent_internship_test/src/domain/entities/user.dart';

class UserInformations extends StatelessWidget {
  final User user;
  UserInformations(this.user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PersonalData(user),
        AddressData(user)
      ],
    );
  }
}

@override
Widget PersonalData(User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
        child: Text("PERSONAL DATA", style: TextStyle(color: Colors.black26),)
      ),
      Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("Email:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.email, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("Phone:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.phone, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("Date of Birth:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.date, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("CPF:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.cpf, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

@override
Widget AddressData(User user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
        child: Text("ADDRESS DATA", style: TextStyle(color: Colors.black26),)
      ),
      Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("CEP:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.cep, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("Street:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.street, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("Number:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.numberHouse, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("Complement:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.complement, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("District:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.district, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("City:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.city, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.0),
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 4,
                        child: Text("State:", style: TextStyle(fontSize: 16))
                      ),
                      Expanded(flex: 6,
                        child: Text(user.state, textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
