// ignore_for_file: avoid_unnecessary_containers, unused_local_variable
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:news_app/common_modules/AppColors.dart';
import 'package:news_app/news_module/controllers/newscontroller.dart';
import 'package:news_app/news_module/views/search_bar.dart';
import 'package:news_app/news_module/views/test.dart';
import '../controllers/newscontroller.dart';
import 'news_details_page.dart';
import 'package:get/get.dart';

import 'news_heading.dart';

class NewsDashboardPage extends StatefulWidget {
  NewsDashboardPage({Key? key}) : super(key: key);
  final NewsController controller = Get.put(NewsController());

  @override
  State<NewsDashboardPage> createState() => _NewsDashboardPageState();
}

// for countries radio buttons
class CountriesList {
  String name;
  int index;
  CountriesList({required this.name, required this.index});
}

class _NewsDashboardPageState extends State<NewsDashboardPage> {
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

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLightGrey,
      appBar: _appBar(),
      body: _listdata(),
      floatingActionButton: _floatingbuttoncode(),
    );
  }

//.............AppBar code................//
AppBar _appBar() {
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
  /* ...........list data........... */
Widget _listdata() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        // _searchbar(),
          // TestSample(),
          SearchBar(),
        HeadingText(),
      
        Expanded(
          child: GetBuilder<NewsController>(
              init: NewsController(),
              builder: (controller) {
                return ListView.builder(
                    // itemCount:10,
                   itemCount: controller.newsList.length,
                  itemBuilder: (context, index) {
                    return 
                     _newsData(index, controller);
                      // Text("testing");
                    // Text(controller.newsList[index].author.toString());
                  },
                );
              }),
        ),
      ],
    );
  }
  // .........newsData.............//
   Widget _newsData(index, controller) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetailsScreen(
                    passingNewsData:controller.newsList[index],

                  )),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.newsList[index].author.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          controller.newsList[index].description.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: false,
                        ),
                        SizedBox(height: 50),
                        Text('10 min ago',
                            style: TextStyle(fontSize: 10, color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 150,
                  child: controller.newsList[index].urlToImage != null
                      ? Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(
                                  controller.newsList[index].urlToImage),
                            ),
                          ),
                        )
                      : null,
                ),
              ]),
        ),
      ),
    );
  }

  /* ......radio buttons c............... */

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
   

  
 
// ............floatingaction code.........//
  Widget _floatingbuttoncode() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              child: Column(children: [
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
                    "Filter by the sources",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    color: AppColors.secondaryGrey,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: newssources.keys.map((String key) {
                      return new CheckboxListTile(
                        title: new Text(key),
                        value: newssources[key],
                        activeColor: AppColors.primaryBlue,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            newssources[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                  child: Text("Apply Filter"),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: AppColors.primaryBlue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]),
            );
          },
        );
      },
      backgroundColor: AppColors.primaryBlue,
      child: const Icon(Icons.filter_alt),
    );
  }
}
