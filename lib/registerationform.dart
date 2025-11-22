import 'package:flutter/material.dart';

class RegistrationFormPage extends StatefulWidget {
  const RegistrationFormPage({super.key});

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}

class _RegistrationFormPageState extends State<RegistrationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pancardController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  bool isValidPAN(String pan) {
    final RegExp regex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
    return regex.hasMatch(pan);
  }

  bool isValidIFSC(String ifsc) {
    final RegExp regex = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
    return regex.hasMatch(ifsc);
  }

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Registration Form",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white70),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),

                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Text(
                        "Fill your details below to proceed",
                        style: TextStyle(color: Colors.black54),
                      ),

                      const SizedBox(height: 25),

                      buildCustomField("Name*", nameController, isRequired: true),
                      buildCustomField("Address*", addressController, isRequired: true),

                      buildCustomField(
                        "PAN Card*",
                        pancardController,
                        isRequired: true,
                        validator: (value) {
                          if (value!.isEmpty) return "PAN Card is required";
                          if (!isValidPAN(value.toUpperCase())) {
                            return "Invalid PAN format (e.g. ABCDE1234F)";
                          }
                          return null;
                        },
                      ),

                      buildCustomField(
                        "IFSC Code*",
                        ifscController,
                        isRequired: true,
                        validator: (value) {
                          if (value!.isEmpty) return "IFSC Code is required";
                          if (!isValidIFSC(value.toUpperCase())) {
                            return "Invalid IFSC format";
                          }
                          return null;
                        },
                      ),

                      buildCustomField(
                        "Email",
                        emailController,
                        validator: (value) {
                          if (value!.trim().isEmpty) return null; // optional
                          if (!isValidEmail(value.trim())) {
                            return "Enter a valid email address";
                          }
                          return null;
                        },
                      ),

                      buildCustomField("Street", streetController),
                      buildCustomField("District", districtController),
                      buildCustomField("City", cityController),
                      buildCustomField("State", stateController),

                      const SizedBox(height: 25),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Registration Completed"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(fontSize: 16,color: Colors.white70),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomField(
    String label,
    TextEditingController controller, {
    bool isRequired = false,
    FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,        
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: validator ??
            (value) {
              if (isRequired && value!.trim().isEmpty) {
                return "$label is required";
              }
              return null;
            },
      ),
    );
  }
}
