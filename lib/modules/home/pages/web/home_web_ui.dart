import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/pages/web/controller/web_controller.dart';
import 'package:dale_poc/modules/home/widgets/app_add_item.dart';
import 'package:dale_poc/modules/home/widgets/app_grid_item.dart';
import 'package:dale_poc/modules/home/widgets/app_list_item.dart';
import 'package:dale_poc/modules/home/widgets/app_sidebar.dart';
import 'package:dale_poc/modules/home/widgets/app_statistics_widget.dart';
import 'package:dale_poc/modules/home/widgets/app_web_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeWebUi extends StatelessWidget {
  HomeWebUi({Key? key}) : super(key: key);

  final controller = Modular.get<WebController>();

  @override
  Widget build(BuildContext context) {
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
                            key: key,
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
                            onChanged: (value) => {},
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
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.green),
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
                  StreamBuilder(
                    stream: controller.sneakersStream(),
                    builder: (context, snapshot) {
                      print('ME DIZ AI: ${snapshot.data?.length}');
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Houve algum erro'),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('Nenhuma informação foi encontrada'),
                        );
                      }
                      if (controller.isGridView) {
                        return Expanded(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 2 / 1.5,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final sneakerList = snapshot.data!;
                              if (index == 0) {
                                return AppAddGridItem(
                                  controller: controller,
                                );
                              }
                              return AppGridItem(
                                isWebView: true,
                                sneaker: sneakerList[index],
                              );
                            },
                          ),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final sneakerList = snapshot.data!;

                              if (index == 0) {
                                return AppAddListItem();
                              }
                              return AppWebListItem(
                                sneaker: sneakerList[index],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
