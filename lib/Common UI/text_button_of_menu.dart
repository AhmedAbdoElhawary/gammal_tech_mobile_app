import 'package:flutter/material.dart';
import 'package:gammal_tech_mobile_app/pages/account_page.dart';
import 'package:gammal_tech_mobile_app/pages/sign_in_page.dart';

Center buildTextButtonOfMenu(BuildContext context, bool checkAccount) {
  return Center(
    child: Card(
      color: const Color.fromARGB(255, 0, 118, 125),
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: InkWell(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      checkAccount != true ? const SignInPage() : const AccountPage()));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            checkAccount ? 'My Account' : 'Sign In',
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
