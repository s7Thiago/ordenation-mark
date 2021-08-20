import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ordenation_mark/shared/providers/comparing_table_provider.dart';
import 'package:provider/provider.dart';

class ComparingTable extends StatelessWidget {
  const ComparingTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ComparingTableProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * .5,
      height: 300,
      decoration: const BoxDecoration(color: Colors.black26),
      child: DataTable(
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headingRowColor: MaterialStateProperty.all(Colors.black54),
        dataTextStyle: const TextStyle(
          color: Colors.white,
        ),
        columns: provider.columns,
        rows: provider.rows,
      ),
    );
  }
}
