import 'package:flutter/material.dart';

import '../../common_modules/AppColors.dart';
class NewsAppBar extends StatefulWidget {
  const NewsAppBar({ Key? key }) : super(key: key);

  @override
  State<NewsAppBar> createState() => _NewsAppBarState();
}
class CountriesList {
  String name;
  int index;
  CountriesList({required this.name, required this.index});
}

class _NewsAppBarState extends State<NewsAppBar> {
  bool value = false;
// Default Radio Button Item
  String radioItem = 'India';
  // Group Value for Radio Button.
  int id = 1;
  
  List<CountriesList> CList = [
    CountriesList(
      index: 1,
      name: "Nepal",
    ),
    CountriesList(
      index: 2,
      name: "USA",
    ),
    CountriesList(
      index: 3,
      name: "India",
    ),
    CountriesList(
      index: 4,
      name: "Sri Lanka",
    ),
    CountriesList(
      index: 5,
      name: "England",
    ),
    CountriesList(
      index: 6,
      name: "Sweden",
    ),
    CountriesList(
      index: 7,
      name: "Pacipic Islands",
    ),
  ];
  Map<String, bool> newssources = {
    'News Source 1': false,
    'News Source 2': false,
    'News Source 3': false,
    'News Source 4': false,
    'News Source 5': false,
    'News Source 6': false,
  };
  var holder_1 = [];
  getItems() {
    newssources.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Clear array after use.
    holder_1.clear();
  }
  int _radioValue = 0;
  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      leadingWidth: 75,
      leading: const Center(
          child: Text(
        'MyNEWS',
        style: TextStyle(
          fontSize: 15,
        ),
      )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("LOCATION"),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 5,
                              width: 50,
                              color: AppColors.secondaryGrey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 190),
                            child: Text(
                              "Choose your location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 1,
                              color: AppColors.secondaryGrey,
                            ),
                          ),
                          _radioButtons(),
                          ElevatedButton(
                            child: Text("Apply "),
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: AppColors.primaryBlue,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  children: [Icon(Icons.location_on), Text("India")],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
Widget _radioButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nepal"),
                Radio(
                  // fillColor: MaterialStateColor.resolveWith((states) => Colors.red),

                  value: 0,
                  groupValue: _radioValue,

                  onChanged: (value) {
                    _handleRadioValueChange(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("USA"),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    _handleRadioValueChange(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("India"),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    // setState(() {
                    //   _radioValue = value;
                    // });
                    _handleRadioValueChange(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sri Lanka"),
                Radio(
                  value: 3,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    _handleRadioValueChange(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("England"),
                Radio(
                  value: 4,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    _handleRadioValueChange(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sweden"),
                Radio(
                  value: 5,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    // setState(() {
                    //   _radioValue = value;
                    // });
                    _handleRadioValueChange(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
   






}