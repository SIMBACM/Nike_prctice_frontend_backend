import 'package:flutter/material.dart';
import 'package:nike_prctice/constants/Sizes.dart';
import 'package:nike_prctice/constants/colors.dart';
import 'package:nike_prctice/constants/images.dart';
import 'package:nike_prctice/widgets/buttonwidgets.dart';
import 'package:nike_prctice/widgets/circleavatarwidget.dart';
import 'package:nike_prctice/widgets/containerwidget.dart';
import 'package:nike_prctice/widgets/textwidget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildAvatar(
                radius: 60,
                backgroundImage: AssetImage(Images.circleavatar),
              ),
              SizedBox(height: TSizes.defaultSpace),
              commonText(
                text: 'John Smith',
                fontSize: TSizes.fontSizeLg,
                fontWeight: TSizes.medium,
              ),
              SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                height: 70,
                child: commonButton(
                  borderRadius: 50,
                  text: 'Edit profile',
                  textColor: AppColors.primary,
                  backgroundColor: AppColors.secondary,
                  width: 200,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tappableImage(imagePath: Images.orders),
                  tappableImage(imagePath: Images.bar),
                  tappableImage(imagePath: Images.pass),
                  tappableImage(imagePath: Images.bar),
                  tappableImage(imagePath: Images.events),
                  tappableImage(imagePath: Images.bar),
                  tappableImage(imagePath: Images.settings1),
                ],
              ),
              SizedBox(height: TSizes.defaultSpace),
              simpleListTile(
                title: 'Inbox',
                titleFontSize: TSizes.fontSizeMd,
                subtitle: 'View messages',
                subtitleColor: AppColors.grey,
                height: 100,
                onTap: () {},
              ),
              tappableImage(imagePath: Images.barhorizontal, width: 400),
              simpleListTile(
                title: 'Your Nike Member Rewards',
                titleFontSize: TSizes.fontSizeMd,
                subtitle: '2 available',
                subtitleColor: AppColors.grey,
                height: 100,
                onTap: () {},
              ),
              tappableImage(imagePath: Images.barhorizontal, width: 400),
              SizedBox(height: TSizes.defaultSpace),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonText(
                      text: 'Following (19)',
                      fontSize: TSizes.fontSizeMd,
                      fontWeight: TSizes.medium,
                    ),
                    commonTextButton(
                      onPressed: () {},
                      text: 'Edit',
                      fontSize: TSizes.fontSizeMd,
                      textColor: AppColors.grey,
                      underline: true,
                      underlineColor: AppColors.grey,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tappableImage(
                    imagePath: Images.football,
                    width: 130,
                    height: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tappableImage(
                    imagePath: Images.bascketball,
                    width: 130,
                    height: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tappableImage(
                    imagePath: Images.training,
                    width: 130,
                    height: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              SizedBox(height: TSizes.defaultSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tappableImage(
                    imagePath: Images.yoga,
                    width: 130,
                    height: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tappableImage(
                    imagePath: Images.dance,
                    width: 130,
                    height: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tappableImage(
                    imagePath: Images.tennis,
                    width: 130,
                    height: 100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
              SizedBox(height: TSizes.defaultSpace),
              Row(
                children: [
                  tappableImage(
                    imagePath: Images.barhorizontal,
                    width: 100,
                    color: AppColors.primary,
                  ),
                  commonText(
                    text: 'Member since January 2025',
                    fontSize: TSizes.fontSizeMd,
                  ),
                  tappableImage(
                    imagePath: Images.barhorizontal,
                    width: 100,
                    color: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
