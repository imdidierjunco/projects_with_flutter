import 'package:all_flutter/facebook_ui/data/models/publication.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/widgets.dart';

class FacebookUIHomeScreen extends StatefulWidget {
  static String routeName = 'facebook-ui-home';
  const FacebookUIHomeScreen({super.key});

  @override
  State<FacebookUIHomeScreen> createState() => _FacebookUIHomeScreen();
}

class _FacebookUIHomeScreen extends State<FacebookUIHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final random = faker.randomGenerator;
    final List<Publications> publications = [];
    for (var i = 0; i < 50; i++) {
      final publication = Publications(
        title: faker.lorem.sentence(),
        createPost: faker.date.dateTime(),
        imageUrl: faker.image.image(),
        commentCount: random.integer(20000, min: 50),
        shareCount: random.integer(10000, min: 10),
        user: User(
          avatar: faker.image.image(),
          userName: faker.person.lastName(),
        ),
        currentUseReaction: Emoji.values[random.integer(
          Emoji.values.length - 1,
          min: 0,
        )],
      );
      publications.add(publication);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 140,
        leading: SvgPicture.asset(
          'assets/facebook_ui/logos/logo.svg',
          color: Colors.blueAccent,
          width: 140,
        ),
        actions: const [
          CircleButton(
            colorDecoration: Colors.grey,
            icon: Icons.search,
          ),
          SizedBox(
            width: 10,
          ),
          CircleButton(
            colorDecoration: Colors.red,
            icon: Icons.notifications,
          ),
          SizedBox(
            width: 10,
          ),
          CircleButton(
            colorDecoration: Colors.lightBlue,
            icon: Icons.people,
            showBadge: true,
          ),
          SizedBox(
            width: 10,
          ),
          CircleButton(
            colorDecoration: Colors.blue,
            icon: Icons.messenger_sharp,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          const WhatIsOnYourMind(),
          const QuickAction(),
          const Stories(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return PublicationItem(
                publications: publications[index],
              );
            },
            itemCount: publications.length,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.exit_to_app,
        ),
      ),
    );
  }
}
