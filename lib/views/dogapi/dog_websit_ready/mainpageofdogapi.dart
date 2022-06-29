
import 'package:flutter/material.dart';
import 'breed.dart';
import 'providers.dart';

class mainpageHomePage extends StatefulWidget {

  @override
  _mainpageHomePageState createState() => _mainpageHomePageState();
}

class _mainpageHomePageState extends State<mainpageHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog.ceo"),
      ),
      body: Center(
        child: FutureBuilder<Map>(
          future: fetchDogsBreeds(),
          builder: (context, AsyncSnapshot<Map> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              default:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else {
                  Map aux = snapshot.data;
                  if (aux == null) return Text("something went wrong");
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: aux.length,
                        itemBuilder: (BuildContext context, int index) {
                          String key = aux.keys.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BreedViewer(breed: key),
                                  ));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(key),
                                    subtitle: Text(
                                      aux[key].toString().trim(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  buildFutureBuilderImage(key),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                  return Text('${snapshot.data}');
                }
            }
          },
        ),
      ),
    );
  }
}
