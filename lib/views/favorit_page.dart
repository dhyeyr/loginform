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
        itemCount: favoritList.length,
        itemBuilder: (context, index) {
          final user = favoritList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                    backgroundImage: xFile != null
                        ? FileImage(
                      File(xFile?.path ?? ""),
                    )
                        : null,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Name :~   ",
                          style: fonts[index].copyWith(fontWeight: FontWeight.bold)),
                      Text(user.name??"",style: fonts[index]),
                      SizedBox(width: 3),
                      Text(user.l_name??"",style: fonts[index]),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Text("E-Mail :~     ",
                          style: fonts[index].copyWith(fontWeight: FontWeight.bold)),
                      Text(user.email??"",style: fonts[index]),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Mo No :~     ",
                          style: fonts[index].copyWith(fontWeight: FontWeight.bold)),
                      Text(user.phone??"",style: fonts[index]),
                    ],
                  ),
                  Row(
                    children: [
                      Text("City :~           ",
                          style: fonts[index].copyWith(fontWeight: FontWeight.bold)),
                      Text(user.address1??"",style: fonts[index]),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Rating :~     ",
                          style: fonts[index].copyWith(fontWeight: FontWeight.bold)),
                      RatingBarIndicator(
                        // rating: double.parse(user.rat as String),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 17.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete,size: 40),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Add User'),
                        content: const Text("Are You Sure Want To Delete This User?"),
                        actions: <Widget>[
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(false);
                          }, child: const Text("No")
                          ),
                          TextButton(onPressed: (){
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
          );
        },
      ),
    );
  }
}