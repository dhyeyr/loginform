// import 'dart:typed_data';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:loginform/views/u_detail.dart';
//
// import '../constent.dart';
// import '../util.dart';
// import 'class.dart';
//
// class User_detail extends StatefulWidget {
//   Map map = {};
//
//   User_detail({super.key, required this.map});
//
//   @override
//   State<User_detail> createState() => _CartPageState();
// }
//
// class _CartPageState extends State<User_detail> {
//   // Resume? myResume;
//   double price = 0;
//
//   // Uint8List? asUint8List;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     detail = (ModalRoute.of(context)?.settings.arguments as u_detail?)!;
//     detail?.display();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "User",
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
//         ),
//         centerTitle: true,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           SingleChildScrollView(
//             child: Column(children: [
//               // children: user_List.map((e) {
//               //
//               //   return Column(
//               //     children: [
//               //
//               //     ],
//               //   );
//               // }).toList(),
//
//               Container(
//                 margin: const EdgeInsets.all(10),
//                 height: 600,
//                 width: 410,
//                 decoration: BoxDecoration(
//                   color: Colors.black12,
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 child: ListView.separated(
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                          if (user_List[index] != 0)
//                             Container(
//                               margin: const EdgeInsets.all(10),
//                               height: 100,
//                               width: 410,
//                               decoration: BoxDecoration(
//                                 color: Colors.black12,
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                               clipBehavior: Clip.antiAlias,
//
//                               // height: 400,
//                               // width: 400,
//
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                    Text("${user_List[index]}"),
//
//                                    //  Text("${detail?.name??""}"),
//                                    //  Text("${detail?.email??""}"),
//                                     // Text("${detail?.phone??""}"),
//                                     // Text("${detail?.phone??""}"),
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                           // if (user_List[index] == 0)
//                           //   ListView.separated(
//                           //       itemBuilder: (context, index) {
//                           //         return Container(
//                           //           color: Colors.grey,
//                           //           child: Center(
//                           //               child: Text(
//                           //             "Please Create Post",
//                           //             style: TextStyle(fontSize: 30),
//                           //           )),
//                           //         );
//                           //       },
//                           //       separatorBuilder: (context, index) {
//                           //         return Divider(
//                           //           thickness: 5,
//                           //         );
//                           //       },
//                           //       itemCount: user_List.length),
//                         ],
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return Text("");
//                     },
//                     itemCount: user_List.length),
//               ),
//
//               FloatingActionButton(
//                   child: Icon(Icons.add),
//                   backgroundColor: Colors.blue,
//                   onPressed: () {
//                     Navigator.pushNamed(context, Form_page);
//                   }),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';

import '../constent.dart';
import '../util.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  TextEditingController searchController = TextEditingController();
  Color? fav = Colors.grey;
 

  void _deleteUser(int index) {
    setState(() {
      user_List.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        shadowColor: Colors.white,
        leading: SizedBox(height: 2),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, fav_page);
              },
              icon: Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Search User'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: searchController,
                            decoration:
                                InputDecoration(labelText: 'Enter User Name'),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: InkWell(
                            child: Text('Search'),
                            onTap: () {
                              if (user_List.contains(
                                  user_List.contains(searchController))) {
                                print("Get");
                              } else {
                                print("Not Get");
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.search_sharp)),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemCount: user_List.length,
        itemBuilder: (context, index) {
          final user = user_List[index];
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 40, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 10)]),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("Name   :  ",
                                style: fonts[index]
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text(user.name ?? "", style: fonts[index]),
                            SizedBox(width: 3),
                            Text(user.l_name ?? "", style: fonts[index]),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text("E-Mail  :  ",
                                style: fonts[index]
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text(user.email ?? "", style: fonts[index]),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text("Mo No  :  ",
                                style: fonts[index]
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text(user.phone ?? "", style: fonts[index]),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text("City        :  ",
                                style: fonts[index]
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text(user.address1 ?? "", style: fonts[index]),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text("Rating   :  ",
                                style: fonts[index]
                                    .copyWith(fontWeight: FontWeight.bold)),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                    ),
                    InkWell(
                        onTap: () {
                          Share.share(user.name ?? "");
                        },
                        child: Icon(Icons.share)),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        favoritList.add(user_List[index]);
                      },
                      child: Icon(Icons.favorite_border_outlined)
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 330, top: 15),
                child: IconButton(
                  icon: Icon(Icons.delete, size: 25),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Add User'),
                          content: const Text(
                              "Are You Sure Want To Delete This User?"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text("No")),
                            TextButton(
                              onPressed: () {
                                _deleteUser(index);
                                Navigator.pop(context);
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );
                    // _deleteUser(index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 5),
                child: Container(

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                    blurRadius: 8,
                        color: Colors.black87
                  )]),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                    backgroundImage: xFile != null
                        ? FileImage(
                            File(xFile?.path ?? ""),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.pushNamed(context, Form_page);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
