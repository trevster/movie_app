import 'package:flutter/material.dart';
import 'package:movie_app/movie_widgets/movie_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const double circleSize = 100;
    return MovieScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: circleSize,
                    width: circleSize,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(circleSize/2),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: circleSize * 0.8,
                      color: Colors.white,
                    ),
                  ),
                ),
               const SizedBox(height: 16,),
                const Divider(),
                const ListTile(
                  title: Text('Trevster'),
                  subtitle: Text('Username'),
                ),
                const ListTile(
                  title: Text('Trevin John Rutherford'),
                  subtitle: Text('Name'),
                ),
                const ListTile(
                  title: Text('trevin.john.rutherford@gmail.com'),
                  subtitle: Text('Email'),
                ),
                const ListTile(
                  title: Text('Male'),
                  subtitle: Text('Gender'),
                ),
                const Divider(),
                const ListTile(
                  title: Text('English'),
                  subtitle: Text('Default Language'),
                ),
                const ListTile(
                  title: Text('United States'),
                  subtitle: Text('Country'),
                ),
                const ListTile(
                  title: Text('Asia - Jakarta'),
                  subtitle: Text('Timezone'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
