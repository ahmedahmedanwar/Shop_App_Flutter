import 'package:flutter/material.dart';
import '../providers/product.dart';

class EditeProductScreen extends StatefulWidget {
  static const routeName = '/edite-product';

  @override
  State<EditeProductScreen> createState() => _EditeProductScreenState();
}

class _EditeProductScreenState extends State<EditeProductScreen> {
  final _priceFocuesdNode = FocusNode();
  final _descriptionFocuesdNode = FocusNode();
  final _imageUrlFocuesdNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  // ignore: unused_field
  var _editedProduct =
      Product(id: null, title: '', description: '', price: 0.0, imageUrl: '');

  @override
  void initState() {
    // TODO: implement initState
    _imageUrlFocuesdNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _imageUrlFocuesdNode.removeListener(_updateImageUrl);
    _priceFocuesdNode;
    _descriptionFocuesdNode;
    _imageUrlFocuesdNode;

    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocuesdNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    _formGlobalKey.currentState?.validate();
    _formGlobalKey.currentState?.save;
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added product'),
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formGlobalKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocuesdNode);
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter Title please';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      id: null,
                      title: value,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocuesdNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocuesdNode);
                },
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter Value please';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      id: null,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocuesdNode,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter Value please';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      id: null,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: _editedProduct.price,  
                      imageUrl: value);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? Text('Enter Image URL')
                        
                        : FittedBox(
                            child: Image.network(
                            _imageUrlController.text,
                          )),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'ImageURL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocuesdNode,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
