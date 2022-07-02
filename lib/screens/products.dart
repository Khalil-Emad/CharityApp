import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:realm/realm.dart';
import '../objects/product.dart';
import '../widgets/detailsContainer.dart';
import '../widgets/dropdown.dart';
import '../widgets/textfieldContainer.dart';
import 'home.dart';

class Products extends StatefulWidget {
  Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => ProductsState();
}

class ProductsState extends State<Products> {
  late Realm realm;
  ProductsState() {
    var config = Configuration.local([Product.schema]);
    realm = Realm(config);
  }
  int get carsCount => realm.all<Product>().length;
  var products;
  int _selectedIndex = 1;
  String fileImage = "";
  String _base64 = "";
  late PlatformFile _file;
  final formKey = GlobalKey<FormState>();
  int radioSelected = 2;
  bool isActive = false;
  bool _isChecked = true;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController detailsCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController quantityCtrl = TextEditingController();
  List selectedContries = [];
  List<String> quantity = [];
  List<String> contries = [
    "Cairo",
    "Alex",
  ];

  getProducts() {
    products = realm.all<Product>();
  }

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Get.to(() => HomeScreen());
      } else {
        Get.to(() => Products());
      }
    });
  }

  Future openFileExplorer() async {
    var storageStatus = await Permission.manageExternalStorage.status;

    if (!storageStatus.isGranted)
      await Permission.manageExternalStorage.request();

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png'],
    );

    PlatformFile? file;
    if (result != null) {
      file = result.files.first;
      ErrorHint("No File");

      _file = file;
      setState(() {
        fileImage = file!.name;
        final File myFile = File(_file.path!);
        String base64 = base64Encode(myFile.readAsBytesSync());
        _base64 = base64;
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getProducts();
    quantity = [
      "10",
      "20",
      "30",
    ];
    quantityCtrl.text = quantity.first;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 46, 68, 80),
        title: Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'add',
            onPressed: () {
              setState(() {
                nameCtrl.text = "";
                detailsCtrl.text = "";
                dateCtrl.text = "";
              });
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text('Add Product'),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Form(
                              key: formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    textfieldContainer(
                                      nameCtrl: nameCtrl,
                                    ),
                                    detailsContainer(
                                      detailsCtrl: detailsCtrl,
                                    ),
                                    Text("Quantity"),
                                    dropDownContainer(
                                      quantity: quantity,
                                      quantityCtrl: quantityCtrl,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Is active?"),
                                    Column(
                                      children: <Widget>[
                                        ListTile(
                                          title: Text('YES'),
                                          leading: Radio(
                                            value: 1,
                                            groupValue: radioSelected,
                                            onChanged: (int? value) {
                                              setState(() {
                                                radioSelected = value!;
                                                isActive = true;
                                              });
                                            },
                                            activeColor: Colors.green,
                                          ),
                                        ),
                                        ListTile(
                                          title: Text('NO'),
                                          leading: Radio(
                                            value: 2,
                                            groupValue: radioSelected,
                                            onChanged: (int? value) {
                                              setState(() {
                                                radioSelected = value!;
                                                isActive = false;
                                              });
                                            },
                                            activeColor: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(2018, 3, 5),
                                                  maxTime: DateTime(2025, 6, 7),
                                                  onConfirm: (date) {
                                                setState(() {
                                                  dateCtrl.text = DateFormat(
                                                          'yyyy, dd, MMM')
                                                      .format(date);
                                                });
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en);
                                            },
                                            child: Text(
                                              'Expire Date',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                        Text(dateCtrl.text)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Product Availability"),
                                    Container(
                                      width: size.width * .9,
                                      height: size.height * .2,
                                      child: ListView(
                                        padding: EdgeInsets.all(8.0),
                                        children: contries
                                            .map((contry) => CheckboxListTile(
                                                  title: Text(contry),
                                                  value: selectedContries
                                                      .contains(contry),
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _isChecked = val!;
                                                      _isChecked
                                                          ? selectedContries
                                                              .add(contry)
                                                          : selectedContries
                                                              .remove(contry);
                                                    });
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Product Image",
                                        ),
                                        IconButton(
                                            onPressed: openFileExplorer,
                                            icon: Icon(Icons.upload_file)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  var product = Product("1",
                                      details: detailsCtrl.text,
                                      name: nameCtrl.text,
                                      date: dateCtrl.text,
                                      active: isActive,
                                      quantity: quantityCtrl.text,
                                      image: base64.toString());

                                  setState(() {
                                    realm.write(() {
                                      realm.add(product);
                                    });
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Products()),
                                  );
                                }
                              },
                              child: Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
                  });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Products',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: ListView(
          children: products
              .map<Widget>(
                (product) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/pic.png",
                      ),
                    ),
                    title: Text(product.name),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(
                          onPressed: () {
                            var item = realm
                                .query<Product>("name == '${product.name}'");
                            nameCtrl.text = item.first.name!;
                            detailsCtrl.text = item.first.details!;
                            dateCtrl.text = item.first.date!;
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return AlertDialog(
                                        title: Text('Add Product'),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Form(
                                            key: formKey,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  textfieldContainer(
                                                    nameCtrl: nameCtrl,
                                                  ),
                                                  Container(
                                                    width: size.width * .9,
                                                    height: size.height * .2,
                                                    child: TextField(
                                                      controller: detailsCtrl,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Product Details',
                                                      ),
                                                      expands: true,
                                                      minLines: null,
                                                      maxLines: null,
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      maxLength: 200,
                                                    ),
                                                  ),
                                                  Text("Quantity"),
                                                  DropdownButtonFormField(
                                                    value: quantityCtrl.text,
                                                    isExpanded: true,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        quantityCtrl.text =
                                                            value!;
                                                      });
                                                    },
                                                    validator: (String? value) {
                                                      if (value == null) {
                                                        return "Required".tr;
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    items: quantity
                                                        .map((String val) {
                                                      return DropdownMenuItem(
                                                        value: val,
                                                        child: Text(
                                                          val,
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("Is active?"),
                                                  Column(
                                                    children: <Widget>[
                                                      ListTile(
                                                        title: Text('YES'),
                                                        leading: Radio(
                                                          value: 1,
                                                          groupValue:
                                                              radioSelected,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              radioSelected =
                                                                  value!;
                                                              isActive = true;
                                                            });
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                                      ),
                                                      ListTile(
                                                        title: Text('NO'),
                                                        leading: Radio(
                                                          value: 2,
                                                          groupValue:
                                                              radioSelected,
                                                          onChanged:
                                                              (int? value) {
                                                            setState(() {
                                                              radioSelected =
                                                                  value!;
                                                              isActive = false;
                                                            });
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            DatePicker.showDatePicker(
                                                                context,
                                                                showTitleActions:
                                                                    true,
                                                                minTime:
                                                                    DateTime(
                                                                        2018,
                                                                        3,
                                                                        5),
                                                                maxTime:
                                                                    DateTime(
                                                                        2025,
                                                                        6,
                                                                        7),
                                                                onConfirm:
                                                                    (date) {
                                                              setState(() {
                                                                dateCtrl.text =
                                                                    DateFormat(
                                                                            'yyyy, dd, MMM')
                                                                        .format(
                                                                            date);
                                                              });
                                                              print(dateCtrl
                                                                  .text);
                                                            },
                                                                currentTime:
                                                                    DateTime
                                                                        .now(),
                                                                locale:
                                                                    LocaleType
                                                                        .en);
                                                          },
                                                          child: Text(
                                                            'Expire Date',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          )),
                                                      Text(dateCtrl.text)
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text("Product Availability"),
                                                  Container(
                                                    width: size.width * .9,
                                                    height: size.height * .2,
                                                    child: ListView(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      children: contries
                                                          .map((contry) =>
                                                              CheckboxListTile(
                                                                title: Text(
                                                                    contry),
                                                                value: selectedContries
                                                                    .contains(
                                                                        contry),
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    _isChecked =
                                                                        val!;
                                                                    _isChecked
                                                                        ? selectedContries.add(
                                                                            contry)
                                                                        : selectedContries
                                                                            .remove(contry);
                                                                  });
                                                                },
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Product Image",
                                                      ),
                                                      IconButton(
                                                          onPressed:
                                                              openFileExplorer,
                                                          icon: Icon(Icons
                                                              .upload_file)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                var item = realm.query<Product>(
                                                    "name == '${product.name}'");
                                                  realm.write(() {
                                                    setState(() {
                                                      item.first.name =
                                                          nameCtrl.text;
                                                      item.first.details =
                                                          detailsCtrl.text;
                                                      item.first.date =
                                                          dateCtrl.text;
                                                    });
                                                  });
                                              });
                                            },
                                            child: Text('Edit'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              var item = realm
                                  .query<Product>("name == '${product.name}'");
                              realm.write(() {
                                realm.deleteMany(item);
                              });
                            });
                          },
                          icon: Icon(Icons.delete))
                    ]),
                  ),
                ),
              )
              .toList()),
    );
  }
}
