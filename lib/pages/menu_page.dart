import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Menu"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Card(
            color: Colors.black87,
            child: ListTile(
              onTap: (){},
              title: const Center(
                child: Text(
                  "New Admin",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.black87,
            child: ListTile(
              onTap: (){},
              title: const Center(
                child: Text(
                  "New Hostelite",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.black87,
            child: ListTile(
              onTap: (){
                //Navigator.pushNamed(context, "/info");
              },
              title: const Center(
                child: Text(
                  "All Hostelite List",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.black87,
            child: ListTile(
              onTap: (){},
              title: const Center(
                child: Text(
                  "Daily In/Out List",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}