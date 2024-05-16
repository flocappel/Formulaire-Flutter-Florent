/*class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter', style: TextStyle(color: Colors.white)),
        leading: const Icon(Icons.access_alarm, color: Color(0xFFFF00FF)),
        elevation: 10.0,
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          child: const Text('À propos'),
        ),
      ),
    );
  }
}
*/