import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu>  {

  @override
  Widget build(BuildContext context)  {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text(
              "Menu",
            style: TextStyle(
              letterSpacing: 1.25
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            Card(
              color: Colors.redAccent,
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
              color: Colors.redAccent,
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/newStudent");
                },
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
              color: Colors.redAccent,
              child: ListTile(
                onTap: (){},
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
              color: Colors.redAccent,
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/log");
                },
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
      ),
    );
  }
}