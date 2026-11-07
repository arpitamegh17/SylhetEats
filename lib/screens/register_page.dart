import 'package:flutter/material.dart';

import '../widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  String selectedRole = 'Customer';

  final nameRegex = RegExp(r"^[a-zA-Z .'-]{2,50}$");

  final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}$');

  final phoneRegex = RegExp(r'^01[3-9]\d{8}$');

  final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration form validated successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EE),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F3EE),
        title: const Text('Create Account'),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                const Icon(
                  Icons.restaurant_menu,
                  size: 70,
                  color: Color(0xFF28382F),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Join SylhetEats',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF28382F),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Create your account and explore Sylhet!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 30),

                // Full Name
                InputField(
                  controller: nameController,
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: Icons.person_outline,
                  keyboardType: TextInputType.name,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    if (!nameRegex.hasMatch(value)) {
                      return 'Enter a valid name';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Email
                InputField(
                  controller: emailController,
                  labelText: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Phone Number
                InputField(
                  controller: phoneController,
                  labelText: 'Phone Number',
                  hintText: '01XXXXXXXXX',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }

                    if (!phoneRegex.hasMatch(value)) {
                      return 'Enter a valid Bangladesh phone number';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 18),

                // Account Type
                const Text(
                  'Select Account Type',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),

                const SizedBox(height: 8),

                DropdownButtonFormField<String>(
                  value: selectedRole,

                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.people_outline),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  items: const [
                    DropdownMenuItem(
                      value: 'Customer',
                      child: Text('Customer'),
                    ),

                    DropdownMenuItem(
                      value: 'Restaurant Admin',
                      child: Text('Restaurant Admin'),
                    ),
                  ],

                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedRole = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: 18),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (!passwordRegex.hasMatch(value)) {
                      return 'Minimum 8 characters, uppercase, lowercase and number required';
                    }

                    return null;
                  },

                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Create a password',

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Confirm Password
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: hideConfirmPassword,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }

                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },

                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Enter your password again',

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(
                      icon: Icon(
                        hideConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),

                      onPressed: () {
                        setState(() {
                          hideConfirmPassword = !hideConfirmPassword;
                        });
                      },
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Register Button
                SizedBox(
                  height: 52,

                  child: ElevatedButton(
                    onPressed: register,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF28382F),
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    const Text('Already have an account?'),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xFF28382F)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
