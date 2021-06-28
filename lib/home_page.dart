import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:validatorless_example/validators.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameEC,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: Validatorless.multiple([
                  Validatorless.required('Nome Obrigatório com validatorless'),
                  Validators.nomeRodrigo('O nome precisa ser Rodrigo')
                ]),
              ),
              TextFormField(
                controller: _emailEC,
                decoration: InputDecoration(labelText: 'Email'),
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail Obrigatório'),
                  Validatorless.email('E-mail Inválido')
                ]),
              ),
              TextFormField(
                controller: _passwordEC,
                decoration: InputDecoration(labelText: 'Password'),
                validator: Validatorless.multiple([
                  Validatorless.required('Senha obrigatória'),
                  Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres'),
                ]),
              ),
              TextFormField(
                controller: _confirmPasswordEC,
                decoration: InputDecoration(labelText: 'Confirme Password'),
                validator: Validatorless.multiple([
                  Validatorless.required('Confirmar Senha obrigatória'),
                  Validatorless.min(6, 'Confirmar Senha precisa ter pelo menos 6 caracteres'),
                  Validators.compare(_passwordEC, 'Senha diferente de Confirma Senha')
                ]),
              ),
              ElevatedButton(
                  onPressed: () {
                    var formValid = _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      // Chamaria a minha controller para salvar os dados!!!!
                    }
                  },
                  child: Text('Salvar'))
            ],
          ),
        ),
      ),
    );
  }
}
