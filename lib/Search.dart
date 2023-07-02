import 'package:flutter/material.dart';
import 'package:flutter_application_2/start.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

TextEditingController Controller = TextEditingController();
String text = '';

class City {
  late String name;
  late String country;
  City(this.name, this.country);
}

late String s1, s2;

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: Controller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    if (Controller.text == null)
                      Navigator.pushNamed(context, 'Weatherhome');
                    else
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          // Builder for the nextpage
                          // class's constructor.
                          builder: (context) => Start(
                            // Date as arguments to
                            // send to next page.
                            s1 = Controller.text,
                          ),
                        ),
                      );
                    Controller.text = '';
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Controller.text = '';
                  },
                ),
                hintText: 'Search...',
              ),
              onSubmitted: (value) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    // Builder for the nextpage
                    // class's constructor.
                    builder: (context) => Start(
                      // Date as arguments to
                      // send to next page.
                      s1 = Controller.text,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // Builder for the nextpage
                  // class's constructor.
                  builder: (context) => Start(
                    // Date as arguments to
                    // send to next page.
                    s1 = 'Mumbai',
                  ),
                ),
              );
            },
            leading: Icon(Icons.location_city),
            title: const Text(
              "Mumbai",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // Builder for the nextpage
                  // class's constructor.
                  builder: (context) => Start(
                    // Date as arguments to
                    // send to next page.
                    s1 = 'Delhi',
                  ),
                ),
              );
            },
            leading: Icon(Icons.location_city),
            title: const Text(
              "Delhi",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // Builder for the nextpage
                  // class's constructor.
                  builder: (context) => Start(
                    // Date as arguments to
                    // send to next page.
                    s1 = 'Amritsar',
                  ),
                ),
              );
            },
            leading: Icon(Icons.location_city),
            title: const Text(
              "Amritsar",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // Builder for the nextpage
                  // class's constructor.
                  builder: (context) => Start(
                    // Date as arguments to
                    // send to next page.
                    s1 = 'Lucknow',
                  ),
                ),
              );
            },
            leading: Icon(Icons.location_city),
            title: const Text(
              "Lucknow",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // Builder for the nextpage
                  // class's constructor.
                  builder: (context) => Start(
                    // Date as arguments to
                    // send to next page.
                    s1 = 'Ludhiana',
                  ),
                ),
              );
            },
            leading: Icon(Icons.location_city),
            title: const Text(
              "Ludhiana",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  // Builder for the nextpage
                  // class's constructor.
                  builder: (context) => Start(
                    // Date as arguments to
                    // send to next page.
                    s1 = 'Mansa',
                  ),
                ),
              );
            },
            leading: Icon(Icons.location_city),
            title: const Text(
              "Mansa",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
