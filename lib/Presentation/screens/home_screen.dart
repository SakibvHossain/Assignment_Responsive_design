import 'package:flutter/material.dart';
import 'package:untitled1/Presentation/widgets/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
        mobile: _buildMobileLayout(),
        desktop: _buildDesktopLayout(),
        tablet: _buildTabletLayout());
  }

  //Mobile Layout
  Widget _buildMobileLayout() {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: MobileCustomAppBar(),
        ),
        drawer: Drawer(
          // Your drawer content here
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue, // Set your desired background color
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Bigger text
                      Text(
                        'Skill Up Now',
                        style: TextStyle(
                          fontSize: 24, // Larger font size
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // Smaller text
                      Text(
                        'Tap Here',
                        style: TextStyle(
                          fontSize: 14, // Smaller font size
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.video_collection), // Add an icon here
                title: const Text('Episodes'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info_outline), // Add an icon here
                title: Text('About'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: MobileTabletBody());
  }

  //Tablet Layout
  Widget _buildTabletLayout() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: LaptopTabletCustomAppBar(),
      ),
      body: MobileTabletBody(),
    );
  }

  //Desktop Layout
  Widget _buildDesktopLayout() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: LaptopTabletCustomAppBar(),
      ),
      body: DesktopBody(),
    );
  }
}

class LaptopTabletCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove default back button
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Start of the AppBar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HUMMING,',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gruppo',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'BIRD',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // End of the AppBar
          Row(
            children: [
              Text(
                'Episodes',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 20), // Little gap between the texts
              Text(
                'About',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white, // Adjust as needed
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MobileCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Remove default back button
      backgroundColor: Colors.white, // Customize as needed
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // Space between drawer and text
        children: [
          // Drawer icon at the start
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
          // Spacer to push the text to the end
          Spacer(),
          // End text aligned to the right
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            // Add padding to the right
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // Align text to the end
              children: [
                Text(
                  'Humming,',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gruppo',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Bird',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MobileTabletBody extends StatelessWidget {
  const MobileTabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // Minimize the space taken by the column
          crossAxisAlignment: CrossAxisAlignment.center,
          // Center horizontally
          children: [
            // Bigger text
            Text(
              'FLUTTER WEB.',
              style: TextStyle(
                fontSize: 31, // Font size for the first text
                fontWeight: FontWeight.bold,
                height: 1.0, // Ensures tight line height
              ),
            ),
            Text(
              'THE BASIC',
              style: TextStyle(
                fontSize: 31, // Font size for the second text
                fontWeight: FontWeight.bold,
                height: 1.0, // Ensures tight line height
              ),
            ),
            SizedBox(height: 30), // Space before the smaller text
            // Smaller text
            Container(
              constraints: BoxConstraints(
                maxWidth:
                    400, // Set the maximum width for the smaller text container
              ),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: TextStyle(
                  fontSize: 16, // Font size for the smaller text
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center, // Align text within the container
              ),
            ),
            SizedBox(height: 90), // Space before the button
            // Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                'Join Course',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Column for texts at the start
            Container(
              constraints: BoxConstraints(
                maxHeight: 400, // Adjust height to fit the content
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize column height
                crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the start
                children: [
                  Text(
                    'FLUTTER WEB.',
                    style: TextStyle(
                      fontSize: 31, // Font size for the first text
                      fontWeight: FontWeight.bold,
                      height: 1.0, // Ensures tight line height
                    ),
                  ),
                  Text(
                    'THE BASIC',
                    style: TextStyle(
                      fontSize: 31, // Font size for the second text
                      fontWeight: FontWeight.bold,
                      height: 1.0, // Ensures tight line height
                    ),
                  ), // Adjust text style as needed

                  SizedBox(height: 30),

                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                      400, // Set the maximum width for the smaller text container
                    ),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                      style: TextStyle(
                        fontSize: 16, // Font size for the smaller text
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.left, // Align text within the container
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // Take up remaining space
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                'Join Course',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ), // Third text at the end
          ],
        ),
      ),
    );
  }
}


