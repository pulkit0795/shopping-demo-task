import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://picsum.photos/id/237/400/550',
    'https://picsum.photos/400/500',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://picsum.photos/400/500',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://picsum.photos/400/500',
  ];
  List<String> titleList = [
    'Ingrid Bergman',
    'John Appleseed',
    'Meryl Streep',
    'Hanah Jones',
    'Jason Cruz',
    'John Smith',
    'Steve Robinson',
    'Chang Uen',
    'Meghan Trainor',
    'Misa Amane',
    'Ingrid Bergman',
    'Hanah Jones',
    'John Appleseed',
    'Meryl Streep',
  ];
  List<String> subtitleList = [
    'All about the base #dare',
    'Flying kiss to my ex boyfriend #dare',
    'Photobooth at home done with #sis',
    'All about the base #dare',
    'Flying kiss to my ex boyfriend #dare',
    'Photobooth at home done with #sis',
    'All about the base #dare',
    'Flying kiss to my ex boyfriend #dare',
    'Photobooth at home done with #sis',
    '360 Degree tornado kick #challenge',
    'All about the base #dare',
    'Flying kiss to my ex boyfriend #dare',
    'Photobooth at home done with #sis',
    '360 Degree tornado kick #challenge',
  ];
  List<String> hashTags = [
    '#Trdening',
    '#Food',
    '#Shopping',
    '#Activity',
    '#Trdening',
    '#Food',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
          ),
          title: Text(
            "Feed",
            style: TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black26,
              ),
              onPressed: () {
                // do something
              },
            ),
            IconButton(
              icon: Icon(
                Icons.mail_outline,
                color: Colors.black26,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 44,
                child: ListView.builder(
                    itemCount: hashTags.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int idx) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = idx;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.redAccent),
                              color: selectedIndex == idx
                                  ? Colors.redAccent
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(12.0, 6, 12, 6),
                              child: Text(
                                hashTags[idx],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: selectedIndex == idx
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 20,
                  // mainAxisSpacing: 15,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              width: 1000,
                              child: Image.network(
                                imageList[index],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            ListTile(
                              title: RichText(
                                text: TextSpan(
                                    text: titleList[index],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' ' + subtitleList[index],
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    ]),
                              ),
                              subtitle: Text(
                                '23 Min Ago',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: CircleAvatar(
                                maxRadius: 15,
                                backgroundImage: NetworkImage(imageList[index]),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.fit(1);
                  }),
            ),
          ],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: SizedBox(
            height: 50,
            child: BottomAppBar(
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
