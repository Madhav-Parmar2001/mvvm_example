import 'package:flutter/material.dart';
import 'package:mvvm_example/widgets/MyProductListItem.dart';
import 'package:mvvm_example/providers/ProductProvider.dart';
import 'package:provider/provider.dart';

class ViewSecondProduct extends StatefulWidget {

  @override
  State<ViewSecondProduct> createState() => _ViewSecondProductState();
}

class _ViewSecondProductState extends State<ViewSecondProduct> {
  ProductProvider provider;


  @override
  void initState() {
    // TODO: implement initState
    provider = Provider.of<ProductProvider>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),

      ),
      body: (provider.data!=null)?
      ListView.builder(
        itemCount: provider.data.length,
        itemBuilder: (context,index)
        {
          return MyProductListItem(
            pobj: provider.data[index],
            onclick: () async{
             // _showalert(provider.data[index]);
            },
          );
        },
      )
          :Center(child: CircularProgressIndicator()),
    );
  }
}
