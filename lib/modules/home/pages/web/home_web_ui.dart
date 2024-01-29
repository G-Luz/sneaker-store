import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/pages/web/controller/web_controller.dart';
import 'package:dale_poc/modules/home/widgets/app_add_item.dart';
import 'package:dale_poc/modules/home/widgets/app_grid_item.dart';
import 'package:dale_poc/modules/home/widgets/app_list_item.dart';
import 'package:dale_poc/modules/home/widgets/app_sidebar.dart';
import 'package:dale_poc/modules/home/widgets/app_simple_dialog.dart';
import 'package:dale_poc/modules/home/widgets/app_statistics_widget.dart';
import 'package:dale_poc/modules/home/widgets/app_web_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeWebUi extends StatefulWidget {
  HomeWebUi({Key? key}) : super(key: key);

  @override
  State<HomeWebUi> createState() => _HomeWebUiState();
}

class _HomeWebUiState extends State<HomeWebUi> {
  final controller = Modular.get<WebController>();

  @override
  void initState() {
    super.initState();
    controller.fetchSneakers();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Material(
          color: AppColors.lightGrey.withOpacity(.5),
          child: Row(
            children: [
              const AppSidebar(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 35,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      const AppWebAppBar(),
                      const SizedBox(height: 30),
                      const AppStatisticsWidget(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 12,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey.withOpacity(.4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  hintText: 'Pesquise pelo nome',
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: AppColors.green,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: AppColors.green,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey.withOpacity(.4),
                                  ),
                                ),
                                onChanged: (filter) =>
                                    controller.searchFilteredSneaker(
                                  filter.toLowerCase(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () => controller.handleChangeView(),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.green),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.view_list,
                                  color: AppColors.darkWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.isGridView)
                        Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 2 / 1.5,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: controller.filterSneakerList.isNotEmpty
                                ? controller.filterSneakerList.length + 1
                                : controller.sneakersList.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return AppAddGridItem(
                                  onTapCallback: () async {
                                    final isRefresh = await showSimpleDialog(
                                      context: context,
                                    );

                                    if (isRefresh is bool &&
                                        isRefresh == true) {
                                      controller.fetchSneakers();
                                    }
                                  },
                                );
                              }
                              return AppGridItem(
                                isWebView: true,
                                sneaker: controller.filterSneakerList.isNotEmpty
                                    ? controller.filterSneakerList[index - 1]
                                    : controller.sneakersList[index - 1],
                                onTapCallback: () async {
                                  final isRefresh = await showSimpleDialog(
                                    context: context,
                                    sneaker: controller
                                            .filterSneakerList.isNotEmpty
                                        ? controller
                                            .filterSneakerList[index - 1]
                                        : controller.sneakersList[index - 1],
                                  );

                                  if (isRefresh is bool && isRefresh == true) {
                                    controller.fetchSneakers();
                                  }
                                },
                              );
                            },
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.filterSneakerList.isNotEmpty
                                ? controller.filterSneakerList.length + 1
                                : controller.sneakersList.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return AppAddListItem(
                                  onTapCallback: () {
                                    showSimpleDialog(
                                      context: context,
                                    );
                                  },
                                );
                              }
                              return AppWebListItem(
                                sneaker: controller.filterSneakerList.isNotEmpty
                                    ? controller.filterSneakerList[index - 1]
                                    : controller.sneakersList[index - 1],
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
