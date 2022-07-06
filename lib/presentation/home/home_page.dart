import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "Awesome Apps",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              child: const Card(
                color: Colors.deepPurpleAccent,
                child: ImageNetwork(
                  image: 'https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg',
                  height: 150,
                  width: 150,
                  duration: 1500,
                  curve: Curves.easeIn,
                  onPointer: true,
                  debugPrint: false,
                  fullScreen: false,
                  fitAndroidIos: BoxFit.cover,
                  fitWeb: BoxFitWeb.cover,
                  onLoading:  CircularProgressIndicator(
                    color: Colors.indigoAccent,
                  ),
                  onError:  Icon(
                    Icons.error,
                    color: Colors.red,
                  ),

                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
