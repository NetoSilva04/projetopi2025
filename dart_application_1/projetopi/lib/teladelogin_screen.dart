import 'package:flutter/material.dart';
import 'package:projetopi/main.dart';
import 'package:projetopi/teladecadastro_screen.dart';
import 'package:projetopi/teladousuario_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _usuarioCadastrado = 'joao@example.com';
  final String _senhaCadastrada = '123456';

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == _usuarioCadastrado && password == _senhaCadastrada) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserPage(
            nome: 'João da Silva',
            email: 'joao@example.com',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário ou senha inválidos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroPage()),
                );
              },
              child: const Text('Criar conta'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                  (route) => false,
                );
              },
              child: const Text('Voltar à tela inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
