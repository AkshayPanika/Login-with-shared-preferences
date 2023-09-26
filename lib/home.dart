import 'package:flutter/material.dart';
import 'package:login_with_shared_preferences/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nameValue = "";
  var passwordValue = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
    getPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions:const [
          Icon(
            Icons.search,
            size: 30,
          ),
          Icon(
            Icons.more_vert,
            size: 30,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      drawer: Drawer(
        width: 270,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
              ),
              accountName: Text(
                nameValue,
                style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              accountEmail: Text(passwordValue,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            ),
            const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              title: Text("Home",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.black87,
              ),
              title: Text("About",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.cleaning_services,
                color: Colors.black87,
              ),
              title: Text("Services",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.contact_page_outlined,
                color: Colors.black87,
              ),
              title: Text("Contacts",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500)),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black87,
              ),
            ),
            InkWell(
              onTap: () async {
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashState.LOGINKEY, false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.login_outlined,
                  color: Colors.black87,
                ),
                title: Text("Logout",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),

      ///___ Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: Image.network(
                "https://img.freepik.com/premium-vector/cute-boy-sitting-floor_33070-1890.jpg?w=2000"),
          ),
          const Center(
            child: Text(
              "You are LogIn",
              style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  void getName() async {
    var sharedPref = await SharedPreferences.getInstance();
    var getName = sharedPref.getString("name");
    nameValue = getName ?? "User Name";
    setState(() {});
  }

  void getPassword() async {
    var sharedPref = await SharedPreferences.getInstance();
    var getPassword = sharedPref.getString("password");
    passwordValue = getPassword ?? "Email Id";
    setState(() {});
  }
}
