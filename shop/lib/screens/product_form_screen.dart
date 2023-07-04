import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';

import '../models/product.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  // Controlar o foco do Form de forma programática
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _urlImageFocus = FocusNode();
  final _urlImageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _urlImageFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments != null) {
        final product = arguments as Product;
        _formData['id'] = product.id;
        _formData['name'] = product.name;
        _formData['price'] = product.price;
        _formData['description'] = product.description;
        _formData['imageUrl'] = product.imageUrl;

        _urlImageController.text = product.imageUrl;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _urlImageFocus.removeListener(updateImage);
    _urlImageFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidImageUrl(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');

    return isValidUrl && endsWithFile;
  }

  Future<void> _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    try {
      await Provider.of<ProductList>(
        context,
        listen: false,
      ).saveProduct(_formData);
    } catch (error) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ocorreu um erro'),
          content: const Text('Erro ao salvar produto!'),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } finally {
      setState(() => _isLoading = false);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produto'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _formData['name']?.toString(),
                      decoration: const InputDecoration(labelText: 'Nome'),
                      textInputAction: TextInputAction.next,

                      // Controlar o foco do Form de forma programática
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocus);
                      },

                      onSaved: (name) => _formData['name'] = name ?? '',

                      validator: (name) {
                        final newName = name ?? '';

                        if (newName.trim().isEmpty) {
                          return 'Nome é obrigatório.';
                        }

                        if (newName.trim().length < 3) {
                          return 'Nome precisa de no mínimo 3 letras.';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['price']?.toString(),
                      decoration: const InputDecoration(labelText: 'Preço'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,

                      // Controlar o foco do Form de forma programática
                      focusNode: _priceFocus,

                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descriptionFocus);
                      },

                      onSaved: (price) =>
                          _formData['price'] = double.parse(price ?? ''),

                      validator: (price) {
                        final priceString = price ?? '';
                        final newPrice = double.tryParse(priceString) ?? -1;

                        if (newPrice <= 0) {
                          return 'Informe um preço válido.';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: _formData['description']?.toString(),
                      decoration: const InputDecoration(labelText: 'Descrição'),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,

                      // Controlar o foco do Form de forma programática
                      focusNode: _descriptionFocus,

                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_urlImageFocus);
                      },

                      onSaved: (description) =>
                          _formData['description'] = description ?? '',

                      validator: (description) {
                        final newDescription = description ?? '';

                        if (newDescription.trim().isEmpty) {
                          return 'Descrição é obrigatória.';
                        }

                        if (newDescription.trim().length < 10) {
                          return 'Descrição precisa ter no mínimo 10 letras.';
                        }

                        return null;
                      },
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'URL da Imagem'),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _urlImageController,

                            // Controlar o foco do Form de forma programática
                            focusNode: _urlImageFocus,
                            onFieldSubmitted: (_) => _submitForm(),

                            onSaved: (imageUrl) =>
                                _formData['imageUrl'] = imageUrl ?? '',

                            validator: (imageUrl) {
                              final newImageUrl = imageUrl ?? '';

                              if (!isValidImageUrl(newImageUrl)) {
                                return 'Informe uma URL válida.';
                              }

                              return null;
                            },
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            left: 10.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: _urlImageController.text.isEmpty
                              ? const Text('Informe URL')
                              : Image.network(_urlImageController.text),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
