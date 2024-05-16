import 'package:flutter/material.dart';

void main() {   // Fonction main
  runApp(const MyApp()); // Point d'entrée, le widget Myapp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // appli utilisant le materialDesign
      title: 'Exemple de formulaire Flutter', // titre appli
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      home: Scaffold( // home page
        appBar: AppBar(
          title: const Text('Flutter', style: TextStyle(color: Colors.white)),
        ),
        body: const MyCustomForm(),
      ),
      debugShowCheckedModeBanner: false,
      routes:{'/card':(context)=> const Card(), }
      
    );
  
  }
  
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  String? _selectedGender; // pour stocker la valeur
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agreeToTerms = false;
  
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Formulaire soumis'),
          content: Text(
              'Bonjour, ${_nameController.text} ! Vous êtes ${_selectedGender == 'homme' ? 'un homme' : 'une femme'}.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }
  void btAbout() {
    Navigator.pushNamed(
    context,
    '/card',
    );
 }
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
                errorStyle: TextStyle(color: Color.fromARGB(255, 196, 43, 160)),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 196, 43, 160)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 196, 43, 160)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Veuillez n\'utiliser que des lettres';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un email';
                } else if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Veuillez entrer un email valide';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                if (value.length < 12) {
                  return 'Le mot de passe doit contenir au moins 12 caractères';
                }
                if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                  return 'Le mot de passe doit contenir au moins une minuscule';
                }
                if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                  return 'Le mot de passe doit contenir au moins une majuscule';
                }
                if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                  return 'Le mot de passe doit contenir au moins un chiffre';
                }
                if (!RegExp(r'(?=.*[\W])').hasMatch(value)) {
                  // \W signifie tout caractère qui n'est pas une lettreou un chiffre
                  return 'Le mot de passe doit contenir au moins un caractère spécial';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirmer le mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez confirmer votre mot de passe';
                }
                if (value != _passwordController.text) {
                  return 'Les mots de passe ne correspondent pas';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            const Text('Genre', style: TextStyle(fontSize: 16)),
            Row(
              children: <Widget>[
                Radio<String>(
                  value: 'homme',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text('Homme'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'femme',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                const Text('Femme'),
              ],
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              title: const Text('J\'accepte les termes et conditions'),
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value!;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: const {
     //   '/': (context) => const HomeScreen(),
      },
    );
  }
}