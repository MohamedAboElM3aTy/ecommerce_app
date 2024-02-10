import 'package:ecommerce_app/core/enums/app_enum.dart';
import 'package:ecommerce_app/core/extensions/context.dart';
import 'package:ecommerce_app/core/extensions/double.dart';
import 'package:ecommerce_app/core/extensions/screen_util.dart';
import 'package:ecommerce_app/utilities/routes/routes.dart';
import 'package:ecommerce_app/view/widgets/app_button.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final GlobalKey<FormState> _formKey;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _nameFocusNode;
  var _authType = AuthType.login;
  bool _isLoading = false;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 28.0,
            horizontal: 30.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authType == AuthType.login ? 'Login' : 'Sign Up',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 26.toFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  20.emptyHeight,
                  _authType == AuthType.register
                      ? TextFormField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter Your Name',
                          ),
                          onChanged: (newName) =>
                              _nameController.text = newName,
                        )
                      : const SizedBox.shrink(),
                  20.emptyHeight,
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains('@') ||
                          email.length < 10) {
                        return 'Enter A valid mail';
                      }
                      return null;
                    },
                    onChanged: (newEmail) => _emailController.text = newEmail,
                  ),
                  20.emptyHeight,
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                    ),
                    validator: (password) {
                      if (password!.isEmpty || password.length < 8) {
                        return 'Enter A valid Password';
                      }
                      return null;
                    },
                    onChanged: (newPass) => _passwordController.text = newPass,
                  ),
                  20.emptyHeight,
                  _authType == AuthType.login
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot Your Password ?',
                            style: context.textTheme.labelSmall?.copyWith(
                              fontSize: 12.toFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  20.emptyHeight,
                  AppButton(
                    isLoading: _isLoading,
                    label: _authType == AuthType.login ? 'LOGIN' : 'SIGN UP',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.navBarPage);
                        _isLoading = true;
                      }
                    },
                  ),
                  30.emptyHeight,
                  InkWell(
                    onTap: () {
                      _formKey.currentState!.reset();
                      setState(
                        () {
                          if (_authType == AuthType.login) {
                            _authType = AuthType.register;
                          } else {
                            _authType = AuthType.login;
                          }
                        },
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _authType == AuthType.login
                            ? 'Don\'t Have An Account ? Register'
                            : 'Have An Account ? Sign In',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontSize: 12.toFont,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  220.emptyHeight,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      _authType == AuthType.login
                          ? 'OR Login With social accounts'
                          : 'OR Sign Up With social accounts',
                      style: context.textTheme.labelLarge?.copyWith(
                        fontSize: 14.toFont,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  10.emptyHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: context.screenWidth * 0.2,
                        height: context.screenHeight * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: context.seed.onSecondary,
                        ),
                        child: const Icon(Icons.facebook),
                      ),
                      20.emptyWidth,
                      Container(
                        width: context.screenWidth * 0.2,
                        height: context.screenHeight * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: context.seed.onSecondary,
                        ),
                        child: const Icon(Icons.flutter_dash),
                      ),
                    ],
                  ),
                  60.emptyHeight,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
