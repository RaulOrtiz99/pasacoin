import 'package:flutter/material.dart';
import '../homescreen/home_screen.dart';
import '../loginscreen/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildPageContent(BuildContext context) {
    return [
      _buildPage(
        context,
        title: "Bienvenido a PasaCoin",
        description:
        "Organiza y participa en grupos de ahorro con tus amigos y familiares.",
        image: Image.asset('assets/page1.png', fit: BoxFit.contain),
      ),
      _buildPage(
        context,
        title: "Crea Grupos",
        description: "Crea grupos de ahorro fácilmente y gestiona los pagos.",
        image: Image.asset('assets/page2.png', fit: BoxFit.contain),
      ),
      _buildPage(
        context,
        title: "Únete a Grupos",
        description:
        "Únete a grupos existentes y comienza a ahorrar de manera sencilla.",
        image: Image.asset('assets/page3.png', fit: BoxFit.contain),
      ),
    ];
  }

  Widget _buildPage(BuildContext context,
      {required String title,
        required String description,
        required Image image}) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isWideScreen ? 64.0 : 32.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: image),
          SizedBox(height: 40),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: isWideScreen ? 32 : 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isWideScreen ? 18 : 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _buildPageContent(context),
          ),
          Positioned(
            bottom: 20,
            left: isWideScreen ? 64 : 16,
            right: isWideScreen ? 64 : 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    "Saltar",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: isWideScreen ? 18 : 14),
                  ),
                ),
                Row(
                  children: List.generate(
                    3, // Número de páginas
                        (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: isWideScreen ? 12 : 10,
                      height: isWideScreen ? 12 : 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },





                  child: Text(
                    _currentPage == 2 ? "Empezar" : "Siguiente",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: isWideScreen ? 18 : 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
