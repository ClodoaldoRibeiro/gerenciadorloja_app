import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenciadorloja_app/blocs/product_bloc.dart';
import 'package:gerenciadorloja_app/ui/android/products/widgets/product_sizes.dart';
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
      : _productBloc = ProducBloC(categoryId: categoryId, product: product);
  ProducBloC _productBloc;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _fieldStyle = TextStyle(color: Colors.black54, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder<bool>(
            stream: _productBloc.outCreated,
            initialData: false,
            builder: (context, snapshot) {
              return Text(snapshot.data ? "Editar Produto" : "Criar Produto");
            }),
        elevation: 0,
        actions: [
          StreamBuilder<bool>(
            stream: _productBloc.outCreated,
            initialData: false,
            builder: (context, snapshot) {
              if (snapshot.data)
                return StreamBuilder<bool>(
                    stream: _productBloc.outLoading,
                    initialData: false,
                    builder: (context, snapshot) {
                      return IconButton(
                        color: AppColors.COR_SECUNDARIA,
                        icon: Icon(Icons.delete),
                        onPressed: snapshot.data
                            ? null
                            : () {
                                _deleteProduct();
                                Navigator.of(context).pop();
                              },
                      );
                    });
              else
                return Container();
            },
          ),
          StreamBuilder<bool>(
              stream: _productBloc.outLoading,
              initialData: false,
              builder: (context, snapshot) {
                return IconButton(
                  color: AppColors.COR_SECUNDARIA,
                  icon: Icon(Icons.save),
                  onPressed: snapshot.data ? null : _saveProduct,
                );
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: StreamBuilder<Map>(
                stream: _productBloc.outData,
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
                        onSaved: _productBloc.saveImages,
                        validator: validateImages,
                      ),
                      TextFormField(
                        initialValue: snapshot.data["title"],
                        maxLines: 1,
                        style: _fieldStyle,
                        decoration: _buildDecoration("Título do produto"),
                        validator: validateTitle,
                        onSaved: _productBloc.saveTitle,
                      ),
                      TextFormField(
                          initialValue: snapshot.data["description"],
                          maxLines: 6,
                          style: _fieldStyle,
                          decoration: _buildDecoration("Descrição"),
                          validator: validateDescription,
                          onSaved: _productBloc.saveDescription),
                      TextFormField(
                          initialValue:
                              snapshot.data["price"]?.toStringAsFixed(2),
                          maxLines: 1,
                          style: _fieldStyle,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: _buildDecoration("Preço"),
                          validator: validatePrice,
                          onSaved: _productBloc.savePrice),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Tamanhos",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      ProductSizes(
                        context: context,
                        initialValue: snapshot.data["sizes"],
                        onSaved: _productBloc.saveSizes,
                        // ignore: missing_return
                        validator: (s) {
                          if (s.isEmpty) return "";
                        },
                      )
                    ],
                  );
                }),
          ),
          StreamBuilder<bool>(
              stream: _productBloc.outLoading,
              initialData: false,
              builder: (context, snapshot) {
                return IgnorePointer(
                  ignoring: !snapshot.data,
                  child: Container(
                    color: snapshot.data ? Colors.black54 : Colors.transparent,
                  ),
                );
              }),
        ],
      ),
    );
  }

  InputDecoration _buildDecoration(String label) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.COR_PALLETA[300]));
  }

  void _saveProduct() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          "Salvando produto...",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(minutes: 1),
        backgroundColor: AppColors.COR_PRIMARIA,
      ));

      bool success = await _productBloc.saveProduct();

      _scaffoldKey.currentState.removeCurrentSnackBar();

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          success ? "Produto salvo!" : "Erro ao salvar produto!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.COR_PRIMARIA,
      ));
    }
  }

  void _deleteProduct() {
    _productBloc.deleteProduct();

    bool success = _productBloc.deleteProduct();

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        success ? "Produto excluído!" : "Erro ao excluir produto!",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.COR_PRIMARIA,
    ));
  }
}
