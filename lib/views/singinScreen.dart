import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'numberScreen.dart';

class Singinscreen extends StatelessWidget {
  const Singinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;
    print(ht/2.40);

    print(wt);
    print(ht);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'asset/images/sing.png',
              width: wt/0.99,
              height: ht/2.40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get your groceries\nwith nectar',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ht/34.59,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Gilroy'),
                  ),
        
                  SizedBox(
                    height: 20,
                  ),
        
        
        
                  /// params
                  PhoneFormField(
                    initialValue:
                        PhoneNumber.parse('+91'), // or use the controller
                                      countrySelectorNavigator:
                        const CountrySelectorNavigator.page(),
                    onChanged: (phoneNumber) =>
                        print('changed into $phoneNumber'),
                    enabled: true,
                    isCountrySelectionEnabled: true,
                    isCountryButtonPersistent: true,
                    countryButtonStyle: const CountryButtonStyle(
                        showDialCode: true,
                        showIsoCode: true,
                        showFlag: true,
                        flagSize: 16),
                  ),
        
                  SizedBox(
                    height: 20,
                  ),
        
                  Center(
                    child: Text(
                      'Or connect with social media',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff828282)),
                    ),
                  ),
        
                  SizedBox(
                    height: 20,
                  ),
        
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5383EC),
                          fixedSize: Size(364, 67)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Number(),));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'asset/images/googleicon.png',
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
        
                  SizedBox(
                    height: 20,
                  ),
        
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(364, 67),
                          backgroundColor: Color(0xff4A66AC)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'asset/images/facebookicon.png',
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Continue with Facebook',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
        
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
