import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/database/boolean_status.dart';
import '../../../core/widgets/base_dropdown_widget.dart';
import '../../../themes/fonts.dart';
import '../../../themes/loading_widget.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'get_collections_by_date_range_controller.dart';
import 'get_collections_by_date_range_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class GetCollectionsByDateRange
    extends BaseStatelessWidget<GetCollectionsByDateRangeController,
        GetCollectionsByDateRangeCubit,
        GetCollectionsByDateRangeState> {
  String startDate;
  String endDate;
  GetCollectionsByDateRange({Key? key, super.controller, super.onStateChanged, required this.startDate, required this.endDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCollectionsByDateRangeCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          GetCollectionsByDateRangeCubit,
          GetCollectionsByDateRangeState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final data = state.getCollectionsByDateRangeResponse;
          final firstCollectedUser = data != null ? data
              .expand((customer) => customer.collectedUsers!)
              .map((collectedUser) => collectedUser.collectedUser)
              .toSet()
              .first : "";
          final selectedCollectedUser = state.selectedCollectedUser ?? firstCollectedUser;
          final isLargeScreen = MediaQuery.of(context).size.width > 600;
          final dropdownWidth = MediaQuery.of(context).size.width * 0.4;

          return state.getCollectionsByDateRangeResponse != null
              ? Container(
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      barTouchData: BarTouchData(
                        enabled: true,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            final customerName = data![group.x.toInt()].customerName;
                            return BarTooltipItem(
                              '$customerName\n',
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Total: ${rod.toY.toStringAsFixed(2)}',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              final index = value.toInt();
                              if (index >= 0 && index < data!.length) {
                                return SizedBox(
                                  width: 80,
                                  child: Text(
                                    data[index].customerName.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      gridData: FlGridData(show: true),
                      barGroups: data!.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: item.totalCollected?.toDouble() ?? 0,
                              width: 20,
                              color: Colors.blue,
                              borderRadius: borderRadius.br_t_5,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),

                if (data.isNotEmpty)
                    Container(
                      margin: edge_insets_t_10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bill Collector", style: TextStyle(fontWeight: Fonts.f500, fontSize: Fonts.fontSize16),),
                          Container(
                            width: dropdownWidth,
                            height: 50,
                            child: BaseDropdownWidget<String?>(
                              items: data
                                  .expand((customer) => customer.collectedUsers!)
                                  .map((collectedUser) => collectedUser.collectedUser)
                                  .toSet()
                                  .toList(),
                              selectedItem: selectedCollectedUser,
                              hintText: "Select Collected User",
                              width: dropdownWidth,
                              showSearchBox: true, // Enable search functionality if needed
                              onChanged: (value) {
                                getCubit(context).updateSelectedCollectedUser(value);
                              },
                              itemAsString: (item) => item.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),

                if (selectedCollectedUser != null)
                  Container(
                    height: 250,
                    margin: edge_insets_t_10,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              final customerName = data![group.x.toInt()].customerName;
                              return BarTooltipItem(
                                '$customerName\n',
                                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Total: ${rod.toY.toStringAsFixed(2)}',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                final index = value.toInt();
                                if (index >= 0 && index < data!.length) {
                                  return SizedBox(
                                    width: 80, // Set a fixed width to allow text wrapping
                                    child: Text(
                                      data[index].customerName.toString(),
                                      maxLines: 2, // Allow up to 3 lines
                                      overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
                                      softWrap: true, // Ensure wrapping happens
                                      style: TextStyle(fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }
                                return SizedBox.shrink();
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        gridData: FlGridData(show: true),
                        barGroups: data
                            .where((customer) =>
                            customer.collectedUsers!.any(
                                    (u) => u.collectedUser ==
                                    selectedCollectedUser))
                            .map((customer) {
                          final collectedData = customer.collectedUsers!
                              .firstWhere((u) =>
                          u.collectedUser ==
                              selectedCollectedUser);

                          return BarChartGroupData(
                            x: data.indexOf(customer),
                            barRods: [
                              BarChartRodData(
                                  toY: collectedData.totalCollected
                                      ?.toDouble() ??
                                      0,
                                  width: 20,
                                  color: Colors.orange,
                                  borderRadius: borderRadius.br_t_5
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          )
              : state.getCollectionsByDateRangeStatus == BooleanStatus.error
              ? Center(
            child: Text("No records found for selected date range"),
          )
              : Center(child: LoadingWidget.loadingWidget(context));
        },
      ),
    );
  }

  @override
  GetCollectionsByDateRangeCubit createCubitAndAssignToController(
      BuildContext context) {
    GetCollectionsByDateRangeCubit cubit = GetCollectionsByDateRangeCubit(
        context: context, startDate: startDate, endDate: endDate);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
