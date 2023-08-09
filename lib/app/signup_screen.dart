import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infoapp/app/home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? seleceted;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        left: 18,
        right: 18,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeadLine(),
              _buildNameField(),
              _buildPhoneNumberField(),
              _buildEmailField(),
              _buildGenderField(),
              _buildCityStateField(),
              _buildCountry(),
              const SizedBox(
                height: 30,
              ),
              _buildSubmitButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeadLine() {
    return Text(
      'Sign Up',
      style: GoogleFonts.openSans(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 14,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter Your Name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              strokeAlign: 5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        keyboardType: TextInputType.name,
        validator: ((validate) {
          if (validate == null) {
            return "Name Can't be empty";
          } else if (validate.length < 2) {
            return "Enter Valid Name";
          }
          return null;
        }),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 14,
      ),
      child: TextFormField(
        maxLength: 10,
        decoration: const InputDecoration(
          hintText: 'Enter 10- digit mobile number',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              strokeAlign: 5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        validator: ((validate) {
          if (validate == null) {
            return "Phone Number Can't be empty";
          } else if (validate.length < 8) {
            return "Enter Valid Phone Number";
          }
          return null;
        }),
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 14,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter Email',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              strokeAlign: 5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (validateEmail) => validateEmail != null &&
                !EmailValidator.validate(validateEmail.trim())
            ? 'Enter Vaild email '
            : null,
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItem = [
      const DropdownMenuItem(
        value: 'male',
        child: Text('Male'),
      ),
      const DropdownMenuItem(
        value: 'female',
        child: Text('Female'),
      ),
      const DropdownMenuItem(
        value: 'others',
        child: Text('Other'),
      ),
    ];

    return menuItem;
  }

  Widget _buildGenderField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 14,
      ),
      child: DropdownButtonFormField(
        items: dropdownItems,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        hint: const Text('Select Gender'),
        onChanged: (String? newValue) {
          seleceted = newValue;
          print(seleceted);
        },
        validator: (value) {
          if (value == null) {
            return "select gender";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _buildCityStateField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCity(),
          buildStateField(),
        ],
      ),
    );
  }

  Expanded buildStateField() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter Your State',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                strokeAlign: 5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          keyboardType: TextInputType.name,
          validator: ((validate) {
            if (validate == null) {
              return " Can't be empty";
            } else if (validate.length < 2) {
              return "Can't be empty";
            }
            return null;
          }),
        ),
      ),
    );
  }

  Expanded buildCity() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter Your City',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                strokeAlign: 5,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          keyboardType: TextInputType.name,
          validator: ((validate) {
            if (validate == null) {
              return " Can't be empty";
            } else if (validate.length < 2) {
              return "Enter Valid City";
            }
            return null;
          }),
        ),
      ),
    );
  }

  Widget _buildCountry() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        right: 14,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter Country',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              strokeAlign: 5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        keyboardType: TextInputType.name,
        validator: ((validate) {
          if (validate == null) {
            return "Value Can't be empty";
          } else if (validate.length < 2) {
            return "Enter Valid Country";
          }
          return null;
        }),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 42,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Filed can\'t be empty'),
                ),
              );
            }
          },
          child: Text(
            'SUBMIT',
            style: GoogleFonts.openSans(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
