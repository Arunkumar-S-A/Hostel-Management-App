import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 212, 123, 209),
        appBarTheme: AppBarTheme(
          color: Colors.purple,
        ),
        colorScheme:
            ColorScheme.light(primary: Colors.purple, secondary: Colors.white),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color.fromARGB(255, 108, 4, 118)),
        ),
      ),
      home: WelcomePage(), // Changed the home to the WelcomePage
    );
  }
}

class WelcomePage extends StatelessWidget {
  void _navigateToRegistration(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TCE HOSTEL'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/tce_logo.jpg', // Update with the correct image path
              //  width: 200, // Set the width as per your design
              // height: 200, // Set the height as per your design
            ),
            Text(
              'Welcome to Hostel App!',
              style: TextStyle(
                fontFamily:
                    'Raleway', // Replace 'Roboto' with your desired font
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _navigateToRegistration(context);
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController registerIdController = TextEditingController();
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController yearOfStudyController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  _saveRegistrationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setString('registerId', registerIdController.text);
    await prefs.setString('roomNumber', roomNumberController.text);
    await prefs.setString('yearOfStudy', yearOfStudyController.text);
    await prefs.setString('department', departmentController.text);
    await prefs.setString('phoneNumber', phoneNumberController.text);
    await prefs.setString('address', addressController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: registerIdController,
              decoration: InputDecoration(
                  labelText: 'Register ID',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: roomNumberController,
              decoration: InputDecoration(
                  labelText: 'Room Number',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: yearOfStudyController,
              decoration: InputDecoration(
                  labelText: 'Year of Study',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: departmentController,
              decoration: InputDecoration(
                  labelText: 'Department',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            ElevatedButton(
              onPressed: () {
                _saveRegistrationData();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _getRegistrationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name'),
      'email': prefs.getString('email'),
      'password': prefs.getString('password'),
      'registerId': prefs.getString('registerId'),
      'roomNumber': prefs.getString('roomNumber'),
      'yearOfStudy': prefs.getString('yearOfStudy'),
      'department': prefs.getString('department'),
      'phoneNumber': prefs.getString('phoneNumber'),
      'address': prefs.getString('address'),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Login'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            ElevatedButton(
              onPressed: () async {
                var userData = await _getRegistrationData();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPage(userData: userData),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  final Map<String, String?> userData;

  DashboardPage({required this.userData});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isExpanded = false;
  bool _isRatingVisible = false;
  bool _isRatingExpanded = false;
  bool _isAboutExpanded = false;
  void _navigateToNewPage(String option) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OptionPage(option: option)),
    );
  }

  final Map<String, Map<String, List<String>>> menuItems = {
    'Monday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
    'Tuesday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
    'Wednesday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
    'Thursday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
    'Friday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
    'Saturday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
    'Sunday': {
      'Breakfast': ['DOSAI', 'SAMBAAR', 'TOMATO CHUTNEY'],
      'Lunch': ['SAMBAAR RICE', 'POTATO', 'PAYAASAM'],
      'Dinner': ['IDLI', 'SAMBAAR', 'CHUTNEY'],
    },
  };

  Map<String, double> dailyRatings = {
    'Monday': 0.0,
    'Tuesday': 0.0,
    'Wednesday': 0.0,
    'Thursday': 0.0,
    'Friday': 0.0,
    'Saturday': 0.0,
    'Sunday': 0.0,
  };

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ExpansionTile(
                title: const ListTile(
                  leading: Icon(Icons.info_outline),
                  iconColor: Colors.black87,
                  title: Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isAboutExpanded = expanded;
                  });
                },
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Men',
                    ),
                    leading: Icon(Icons.male),
                    iconColor: Colors.blue,
                    onTap: () {
                      _navigateToNewPage('Men');
                    },
                  ),
                  ListTile(
                    title: Text('Women'),
                    leading: Icon(Icons.female_sharp),
                    iconColor: Colors.pinkAccent,
                    onTap: () {
                      _navigateToNewPage('Women');
                    },
                  ),
                ],
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ExpansionTile(
                title: const ListTile(
                  leading: Icon(Icons.person), // Add your desired icon
                  title: Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                children: <Widget>[
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Name: ${widget.userData['name'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text('Email: ${widget.userData['email'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text(
                        'Register ID: ${widget.userData['registerId'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text(
                        'Room Number: ${widget.userData['roomNumber'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text(
                        'Year of Study: ${widget.userData['yearOfStudy'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text(
                        'Department: ${widget.userData['department'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text(
                        'Phone Number: ${widget.userData['phoneNumber'] ?? ''}'),
                  ),
                  ListTile(
                    title: Text('Address: ${widget.userData['address'] ?? ''}'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Row(
                        children: [
                          Text('     '),
                          Icon(
                            Icons.dining_outlined,
                          ),
                          Text(
                            '      Menu',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(_isExpanded
                              ? Icons.expand_less
                              : Icons.expand_more),
                        ],
                      ),
                    ),
                  ),
                  if (_isExpanded)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: menuItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        String day = menuItems.keys.elementAt(index);
                        return ExpansionTile(
                          title: Text(
                            day,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text('Breakfast'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: menuItems[day]!['Breakfast']!
                                    .map((item) => Text(item))
                                    .toList(),
                              ),
                              // Add rating widget here for breakfast
                              trailing: RatingBar.builder(
                                initialRating: dailyRatings[day]!,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    dailyRatings[day] = rating;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text('Lunch'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: menuItems[day]!['Lunch']!
                                    .map((item) => Text(item))
                                    .toList(),
                              ),
                              // Add rating widget here for lunch
                              trailing: RatingBar.builder(
                                initialRating: dailyRatings[day]!,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    dailyRatings[day] = rating;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text('Dinner'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: menuItems[day]!['Dinner']!
                                    .map((item) => Text(item))
                                    .toList(),
                              ),
                              // Add rating widget here for dinner
                              trailing: RatingBar.builder(
                                initialRating: dailyRatings[day]!,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    dailyRatings[day] = rating;
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: ExpansionTile(
                title: const ListTile(
                  leading:
                      Icon(Icons.calendar_month_sharp), // Add your desired icon
                  title: Text(
                    'Daily Meal Ratings',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isRatingExpanded = expanded;
                  });
                },
                children: <Widget>[
                  for (String day in dailyRatings.keys)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(day),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isRatingVisible = !_isRatingVisible;
                              });
                            },
                            child: Center(
                              child: Text(
                                _isRatingVisible ? 'Hide' : 'Show',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _isRatingVisible,
                            child: RatingBarIndicator(
                              rating: dailyRatings[day]!,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 24.0,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ComplaintPage()),
                  );
                },
                child: Text('COMPLAINT HERE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionPage extends StatelessWidget {
  final String option;

  OptionPage({required this.option});

  @override
  Widget build(BuildContext context) {
    List<String> optionsList = ['General', 'Maintenance', 'Discipline', 'Mess'];

    return Scaffold(
      appBar: AppBar(
        title: Text(option),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: optionsList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(optionsList[index]),
                onTap: () {
                  print('Selected option: ${optionsList[index]}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  TextEditingController _complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File a Complaint'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _complaintController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: 'Type your complaint here...',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String complaintText = _complaintController.text;

                print('Complaint: $complaintText');

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Complaint Submitted'),
                      content: Text(
                          'Your complaint has been submitted successfully.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );

                _complaintController.clear();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
