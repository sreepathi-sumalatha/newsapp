// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:news_app/common_modules/AppColors.dart';

import 'news_details_page.dart';

class NewsDashboardPage extends StatefulWidget {
  const NewsDashboardPage({Key? key}) : super(key: key);

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
    // 'News Source 7': false,
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
    //  locations_1.clear();
  }

  int _radioValue = 0;
  
  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
    });
  }
  /// passing the data to the other screen...............
String newsHeading = 'NewsSource';
String imagePath='https://bsmedia.business-standard.com/_media/bs/img/article/2021-12/31/full/1640958034-2414.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLightGrey,
      // backgroundColor:Colors.blue,
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

      // actions: <Widget>[new Icon(Icons.more_vert)],
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("LOCATION"),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
  //                   isScrollControlled: true,
  // isDismissible: true,
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


  Widget _radioButtons(){
    return  Padding(
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
                                      Text("USA"),
                                      Radio(
                                        value: 1,
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
                                      Text("England"),
                                      Radio(
                                        value: 4,
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
//........location bottom sheet code..........//

// ..........listview Data at body ............//
  Widget _listdata() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
       _searchbar(),
      _headingPart(),
        Expanded(
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _newsData();
            },
            itemCount: 50,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }
Widget _searchbar(){
  return  Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for the news,topics...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
  
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: AppColors.secondaryLightGrey,
                  ),
                ),
              );
}

Widget _headingPart(){
  return   Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top HeadLines",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text('Sort:'),
                        Text(
                          'Newest',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    )
                  ],
                ),
              );
}
  Widget _newsData() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  NewsDetailsScreen(
            NewsTitle: newsHeading,
            imageLink: imagePath,
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
                          newsHeading,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Music by Julie Gable hgfhhjhgdadgbadgsGsatSAcgfugigouopopoinoionomojmoghfufuiuiyhgg',
                           overflow: TextOverflow.ellipsis,
                           maxLines: 3,
                        
                          // maxLines: 1,
                          softWrap: false,
                        ),
                        SizedBox(height: 50),
                        Text('10 min ago',
                            style: TextStyle(fontSize: 10, color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                //                             Container(
                // height: 20,
                // width: 30,
                // color: Colors.red,
                //                             )
                Container(
                    //https://www.fool.com.au/wp-content/uploads/2022/01/etf-16.9.jpg
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:
                            // Image(image: AssetImage('assets/images/samleimage.jpg'),
                            Image.network(
                          // 'https://www.fool.com.au/wp-content/uploads/2022/01/etf-16.9.jpg',
                          'https://bsmedia.business-standard.com/_media/bs/img/article/2021-12/31/full/1640958034-2414.jpg',
                          width: 200,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                        )
                        )
              ]),
        ),
      ),
    );
  }

// ............floatingaction code.........//
  Widget _floatingbuttoncode() {
    return FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              // height: 200,
              // width: double.infinity,
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              // child: ElevatedButton(
              //   child: Text("Apply Filter"),
              //   style: ElevatedButton.styleFrom(
              //     onPrimary: Colors.white,
              //     primary:AppColors.primaryBlue,

              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
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
