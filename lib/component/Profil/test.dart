import 'package:flutter/material.dart';

class DropdownTextFieldPage extends StatefulWidget {
  @override
  _DropdownTextFieldPageState createState() => _DropdownTextFieldPageState();
}

class _DropdownTextFieldPageState extends State<DropdownTextFieldPage> {
  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String? _selectedOption;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedOption = _options[0];
    _textEditingController.text = _selectedOption!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown TextField'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Pilih Opsi',
                  ),
                ),
              ),
              DropdownButton<String>(
                value: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                    _textEditingController.text = _selectedOption!;
                  });
                },
                items: _options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class Product {
//   String name;
//   String description;

//   Product({required this.name, required this.description});
// }

// class ProductScreen extends StatefulWidget {
//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State {
//   List products = [];

//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();

//   void addProduct() {
//     String name = _nameController.text;
//     String description = _descriptionController.text;

//     Product newProduct = Product(name: name, description: description);
//     setState(() {
//       products.add(newProduct);
//     });

//     _nameController.clear();
//     _descriptionController.clear();
//   }

//   void editProduct(int index) {
//     Product product = products[index];
//     _nameController.text = product.name;
//     _descriptionController.text = product.description;

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Product'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   product.name = _nameController.text;
//                   product.description = _descriptionController.text;
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(products[index].name),
//             subtitle: Text(products[index].description),
//             onTap: () {
//               editProduct(index);
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Add Product'),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(labelText: 'Name'),
//                     ),
//                     TextField(
//                       controller: _descriptionController,
//                       decoration: InputDecoration(labelText: 'Description'),
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                       addProduct();
//                       Navigator.pop(context);
//                     },
//                     child: Text('Add'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('Cancel'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
