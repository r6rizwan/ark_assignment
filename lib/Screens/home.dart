import 'package:ark_assignment/Models/entries_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

var textcolor;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Http request to fetch the data from the server.
  Future<List<Entries>> getEntriesList() async {
    var response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    var decodedEntries = json.decode(utf8.decode(response
        .bodyBytes)); //Used utf8.decode to render the special characters in the data
    var resultList = decodedEntries['entries'];
    List<Entries> result =
        await resultList.map<Entries>((json) => Entries.fromMap(json)).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    textcolor = Theme.of(context).textTheme.bodyText1?.color;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SfDataGridTheme(
          data: SfDataGridThemeData(headerColor: Colors.blueGrey),
          child: FutureBuilder(
            future: getEntriesDataSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? SfDataGrid(
                      allowSorting: true, // Enable sorting
                      gridLinesVisibility:
                          GridLinesVisibility.both, // Show grid lines
                      allowPullToRefresh: true, // Enable pull to refresh
                      source: snapshot.data, // Set the data source
                      frozenColumnsCount: 1, // Freeze the first column
                      columns: getColumns()) // Set the columns
                  : Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).progressIndicatorTheme.color,
                        strokeWidth: 3,
                      ), // Show a loading indicator
                    );
            },
          ),
        ),
      ),
    );
  }

  Future<EntriesDataGridSource> getEntriesDataSource() async {
    var entries = await getEntriesList();
    return EntriesDataGridSource(entries);
  }

  //Get Column Headers
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
        columnWidthMode: ColumnWidthMode.fitByCellValue,
        columnName: 'API',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'API',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnWidthMode: ColumnWidthMode.auto,
        columnName: 'Description',
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Description',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnWidthMode: ColumnWidthMode.auto,
        columnName: 'Auth',
        //width: 60,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Auth',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnWidthMode: ColumnWidthMode.auto,
        columnName: 'HTTPS',
        //width: 70,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'HTTPS',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnWidthMode: ColumnWidthMode.auto,
        columnName: 'Cors',
        //width: 80,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Cors',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnWidthMode: ColumnWidthMode.fitByCellValue,
        columnName: 'Link',
        // width: 160,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Link',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'Category',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Category',
            overflow: TextOverflow.clip,
            softWrap: true,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
  }
}

class EntriesDataGridSource extends DataGridSource {
  EntriesDataGridSource(this.entries) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Entries> entries;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        child: Text(
          row.getCells()[0].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[1].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[2].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[3].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[4].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[5].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[6].value.toString(),
          style: TextStyle(color: textcolor),
          overflow: TextOverflow.clip,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = entries.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'API', value: dataGridRow.API),
        DataGridCell(columnName: 'Description', value: dataGridRow.Description),
        DataGridCell(columnName: 'Auth', value: dataGridRow.Auth),
        DataGridCell(columnName: 'HTTPS', value: dataGridRow.HTTPS),
        DataGridCell(columnName: 'Cors', value: dataGridRow.Cors),
        DataGridCell(columnName: 'Link', value: dataGridRow.Link),
        DataGridCell(columnName: 'Category', value: dataGridRow.Category)
      ]);
    }).toList(growable: false);
  }
}
