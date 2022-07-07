import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:privates_app/core/decorations/color_palette.dart';
import 'package:privates_app/core/decorations/device_scaler.dart';
import 'package:privates_app/generated/l10n.dart';
import 'package:privates_app/ui/view-models/search_view_model.dart';
import 'package:privates_app/ui/widgets/full_screen_loading_indicator.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.privates,
          style: TextStyle(
            color: Palette.primary,
            fontWeight: FontWeight.w900,
            fontSize: DeviceScaler().scaleFont(20),
          ),
        ),
      ),
      body: ViewModelBuilder<SearchViewModel>.reactive(
          viewModelBuilder: () => SearchViewModel(),
          builder: (_,model,__){
            Widget body = Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: DeviceScaler().scale(5)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Palette.searchFillColor,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/svg/search.svg",),
                            ),
                            hintText: S.current.search,
                            hintStyle: TextStyle(
                              fontSize: DeviceScaler().scaleFont(14),
                              fontWeight: FontWeight.w500,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Palette.searchFillColor)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Palette.searchFillColor)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Palette.searchFillColor)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: DeviceScaler().scale(15),),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: DeviceScaler().scale(10)),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 9,
                        crossAxisSpacing: 8,

                      ),
                      itemCount: model.imageList.length,
                      itemBuilder: (c,index){
                        final image = model.imageList.elementAt(index);
                        return Image.asset(image);
                      },

                    ),
                  ],
                ),
              ),
            );
        List<Widget> stackChildren = [body];

        if(model.isBusy){
          stackChildren.add(const FullScreenProgressIndicator());
        }

        return Stack(children: stackChildren,);
      }),
    );
  }
}
