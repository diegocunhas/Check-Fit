import 'package:testes/routes/pageRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
//import 'dashboard_screen.dart';

const users = const{
 'prof@google.com':'123',
 'aluno@google.com':'123'
};


class LoginScreen extends StatelessWidget {
  //const LoginScreen({ Key? key }) : super(key: key);
  Duration get loginTime => Duration(milliseconds: 1200);

  Future<String?> _authUser(LoginData data){
    debugPrint('Usuário: ${data.name}, Senha: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)){
        return 'Usuário não existe';
      }
      if (users[data.name]!=data.password){
        return 'Senha inválida';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data){
    debugPrint('Usuário: ${data.name}, Senha: ${data.password}');
    return Future.delayed(loginTime).then((_){
      return null;
    });
  }

  Future<String?> _recoverPassword(String name){
    debugPrint('Usuário: $name');
    return Future.delayed(loginTime).then((_){
      if(!users.containsKey(name)){
        return 'Usuário não existe';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      userType: LoginUserType.name,
      title: 'Check-Fit',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: (){
        Navigator.pushNamed(context,PageRoutes.home);
      },
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        userHint: 'Usuário',
        passwordHint: 'Senha',
        confirmPasswordHint: 'Conferir Senha',
        confirmPasswordError: 'Senha Inválida',
        loginButton: 'Log in',
        signupButton: 'Registrar',
        forgotPasswordButton: 'Esqueci a senha',
      ),
      theme: LoginTheme(
        cardTheme: CardTheme(
        color: Colors.green.shade100,
        elevation: 10,
        margin: EdgeInsets.only(top: 20),
        shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(150.0))
        ),
      ),
    );
  }
}
