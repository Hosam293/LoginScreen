import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: 30.0),

                  TextFormField(
                    decoration:InputDecoration(
                      labelText: 'Email Address ',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ) ,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value)
                    {
                      print(value);
                    },
                    onChanged: (value)
                    {
                      print(value);
                    },
                    controller: emailController,
                    validator: (String?value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'email is not confirmed';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                      height: 20.0),
                  TextFormField(
                    obscureText: isPassword,
                    decoration:InputDecoration(
                        labelText: 'password ',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton( icon:  Icon(isPassword? Icons.visibility: Icons.visibility_off),
                            onPressed: ()
                            {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            }
                        ) ),
                    keyboardType: TextInputType.visiblePassword,

                    onFieldSubmitted: (value)
                    {
                      print(value);
                    },
                    onChanged: (value)
                    {
                      print(value);
                    },
                    controller: passwordController,
                    validator: (String?value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'password is not confirmed';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                      height: 20.0),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(onPressed: ()
                    {
                      if(formKey.currentState!.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);

                      }


                    },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I don\'t have email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      TextButton(onPressed: () {  },
                        child: Text(
                          'Register Now',
                        ),

                      )
                    ],
                  )


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
