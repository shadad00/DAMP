import 'package:flutter/cupertino.dart';
import 'package:ser_manos/design_system/molecules/buttons/Short_button.dart';
import 'package:ser_manos/design_system/molecules/components/profile_image.dart';
import 'package:ser_manos/design_system/tokens/colours/colours.dart';
import 'package:ser_manos/design_system/tokens/font/font.dart';


class ExtendedUploadProfilePicture extends StatelessWidget {

  final String imageUrl; 

  const ExtendedUploadProfilePicture({
    super.key,
    required this.imageUrl
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SermanosColors.secondary25,
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),  
      child: Row(
        children: [
          Flexible(
            flex:2,
            child:Column(children: [
              const Text(
                "Foto de perfil",
                style: SermanosTypography.subtitle01(
                  color: SermanosColors.neutral100,
                ),
              ),
              ShortButton(text: "Cambiar foto", onPressed: ()=>{})
            ],)
          ),
          Flexible(
            flex:2,
            child: ProfileImage(imageUrl: imageUrl)
          )
        ],
      ),

    ); 
  }
}
