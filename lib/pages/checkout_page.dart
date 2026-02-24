import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String phone = '';
  String address = '';
  String notes = '';
  String paymentMethod = 'COD';

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SafeArea(
        child: Column(
          children: [
            /// ================= ORDER SUMMARY =================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),

                    ...cart.itemsList.map(
                      (item) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(item.product.name),
                        subtitle: Text("Qty: ${item.quantity}"),
                        trailing: Text(
                          "Rp ${item.totalPrice.toStringAsFixed(0)}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    const Divider(),
                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Rp ${cart.totalPrice.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// ================= CUSTOMER FORM =================
                    const Text(
                      "Customer Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Full Name",
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? "Required" : null,
                            onSaved: (v) => name = v!,
                          ),
                          const SizedBox(height: 15),

                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "Phone number required";
                              }
                              if (v.length < 10) {
                                return "Minimum 10 digits";
                              }
                              return null;
                            },
                            onSaved: (v) => phone = v!,
                          ),
                          const SizedBox(height: 15),

                          TextFormField(
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: "Address",
                              border: OutlineInputBorder(),
                            ),
                            validator: (v) =>
                                v == null || v.isEmpty ? "Required" : null,
                            onSaved: (v) => address = v!,
                          ),
                          const SizedBox(height: 20),

                          /// ================= PAYMENT METHOD =================
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Payment Method",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          RadioListTile(
                            title: const Text("Cash on Delivery (COD)"),
                            value: "COD",
                            groupValue: paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                paymentMethod = value!;
                              });
                            },
                          ),

                          RadioListTile(
                            title: const Text("Bank Transfer"),
                            value: "Transfer",
                            groupValue: paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                paymentMethod = value!;
                              });
                            },
                          ),

                          const SizedBox(height: 15),

                          TextFormField(
                            maxLines: 2,
                            decoration: const InputDecoration(
                              labelText: "Notes (Optional)",
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (v) => notes = v ?? '',
                          ),

                          const SizedBox(height: 25),

                          /// ================= PLACE ORDER BUTTON =================
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  cart.clear();

                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Order placed successfully 🎉",
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                "Place Order",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
