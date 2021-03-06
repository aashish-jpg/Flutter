import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import '../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel? model;
  final Function? onDelete;

  const ProductItem({
    Key? key,
    this.model,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 216, 210, 210),
          borderRadius: BorderRadius.circular(2),
        ),
        child: cartItem(context),
      ),
    );
  }

  Widget cartItem(context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
        
          child: Image.network(
            (model!.productImage == null || model!.productImage == "")
                ? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png"
                : model!.productImage!,
            height: 150,
            width: 140,
            
            fit: BoxFit.scaleDown,
          ),
          ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model!.productName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 60,
                
                
              ),
              
              Text(
                "${model!.productDescription}",
                style: const TextStyle(color: Colors.black,fontSize: 16, fontWeight:FontWeight.bold ),
              ),
              Text(
                "Rs :${model!.productPrice}",
                style: const TextStyle(color: Colors.black,fontSize: 20, fontWeight:FontWeight.bold ),
              ),
              const SizedBox(
                height: 10,
                
                
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.edit),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/edit-product',
                          arguments: {
                            'model': model,
                          },
                        );
                      },
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        onDelete!(model);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
