import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/product_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/widgets/images_widget.dart';
import 'package:gerenciadorloja_app/ui/themes/app_colors.dart';
import 'package:gerenciadorloja_app/validators/product_validator.dart';

class ProductUI extends StatefulWidget {
  ProductUI({@required this.categoryId, this.product});

  final String categoryId;
  final DocumentSnapshot product;

  @override
  _ProductUIState createState() => _ProductUIState(categoryId, product);
}

class _ProductUIState extends State<ProductUI> with ProductValidator {
  _ProductUIState(String categoryId, DocumentSnapshot product)
      : _producBloC = ProducBloC(categoryId: categoryId, product: product);

  final _formKey = GlobalKey<FormState>();
  final _fieldStyle = TextStyle(color: Colors.black54, fontSize: 16);
  ProducBloC _producBloC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Criar Item"),
        elevation: 0,
        actions: [
          IconButton(
            color: AppColors.COR_SECUNDARIA,
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
          IconButton(
            color: AppColors.COR_SECUNDARIA,
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<Map>(
            stream: _producBloC.outData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();
              return ListView(
                padding: EdgeInsets.all(18),
                children: [
                  Text(
                    "Imagens",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  ImagesWidget(
                    context: context,
                    initialValue: snapshot.data["images"],
                    onSaved: _producBloC.saveImages,
                    validator: validateImages,
                  ),
                  TextFormField(
                    initialValue: snapshot.data["title"],
                    maxLines: 1,
                    style: _fieldStyle,
                    decoration: _buildDecoration("Título do produto"),
                    validator: validateTitle,
                    onSaved: _producBloC.saveTitle,
                  ),
                  TextFormField(
                      initialValue: snapshot.data["description"],
                      maxLines: 6,
                      style: _fieldStyle,
                      decoration: _buildDecoration("Descrição"),
                      validator: validateDescription,
                      onSaved: _producBloC.saveDescription),
                  TextFormField(
                      initialValue: snapshot.data["price"]?.toStringAsFixed(2),
                      maxLines: 1,
                      style: _fieldStyle,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: _buildDecoration("Preço"),
                      validator: validatePrice,
                      onSaved: _producBloC.savePrice),
                ],
              );
            }),
      ),
    );
  }

  InputDecoration _buildDecoration(String label) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.COR_PALLETA[300]));
  }
}
