import 'package:dale_poc/constants/app_colors.dart';
import 'package:dale_poc/modules/home/pages/mobile/controller/mobile_controller.dart';
import 'package:dale_poc/modules/home/widgets/app_grid_item.dart';
import 'package:dale_poc/modules/home/widgets/app_list_item.dart';
import 'package:dale_poc/widgets/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeMobileUi extends StatelessWidget {
  HomeMobileUi({Key? key}) : super(key: key);

  final controller = Modular.get<MobileController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Material(
          color: AppColors.darkWhite2,
          borderRadius: BorderRadius.circular(10),
          child: SingleChildScrollView(
            child: Container(
              padding: kIsWeb
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              suffixIcon: Icon(Icons.search,
                                  color: Colors.grey.withOpacity(.4)),
                            ),
                            onChanged: (value) => {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
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
                          child: Icon(
                            controller.isGridView
                                ? Icons.grid_view
                                : Icons.view_list,
                            color: AppColors.darkWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.isGridView)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 170,
                        childAspectRatio: 1.5 / 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const AppGridItem(
                          isWebView: false,
                          
                        );
                      },
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return AppListItem();
                      },
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
