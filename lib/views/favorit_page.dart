import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../util.dart';

class FavoriteUser extends StatefulWidget {
  const FavoriteUser({super.key});

  @override
  State<FavoriteUser> createState() => _FavoriteUserState();
}

class _FavoriteUserState extends State<FavoriteUser> {
  void _deleteUser(int index) {
    setState(() {
      favoritList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoirite '),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        shadowColor: Colors.white,
      ),



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


                          // _deleteUser(index);

              Padding(
                padding: const EdgeInsets.only(left: 310, top: 15),
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
                            TextButton(onPressed: () {
                              Navigator.of(context).pop(false);
                            }, child: const Text("No")
                            ),
                            TextButton(onPressed: () {
                              _deleteUser(index);
                              Navigator.pop(context);
                            }, child: const Text("Yes"),
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

    );
  }
}
