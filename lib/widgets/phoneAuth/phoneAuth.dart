import 'package:flutter/material.dart';
import 'package:wordtango/widgets/phoneAuth/components/otp.dart';
import 'package:wordtango/widgets/phoneAuth/components/roundedGradientButton.dart';

class PhoneAuthentication extends StatefulWidget {
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  TextEditingController _phoneNumberController = TextEditingController();
  Map<String, String> countryCodeMap = {'US +1': '+1', 'CN +86': '+86'};
  String countryCode = '+1'; // Seyt default code

  List<DropdownMenuItem<String>> buildDropDownMenuItems(
      Map<String, String> countryCodeMap) {
    List<DropdownMenuItem<String>> dropDownMenuItems = [];
    for (var cCode in countryCodeMap.entries) {
      dropDownMenuItems.add(DropdownMenuItem(
        child: Text(cCode.key),
        value: cCode.key,
      ));
    }
    return dropDownMenuItems;
  }

  _navigateToOTP() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTP(
          number: '$countryCode${_phoneNumberController.text}',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.clear();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.grey[400],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My number:",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: 'US +1',
                          items: buildDropDownMenuItems(countryCodeMap),
                          onChanged: (value) {
                            setState(() {
                              countryCode = countryCodeMap[value];
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: _phoneNumberController,
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: 'Phone Number'),
                          onChanged: (value) {
                            setState(() {
                              _phoneNumberController.text = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "We will send a text with a verification code. Message and data rates may apply.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              RoundedGradientButton(
                controller: _phoneNumberController,
                onPressed: _navigateToOTP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
