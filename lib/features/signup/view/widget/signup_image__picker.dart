import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/features/signup/view_model/signup_cubit.dart';
import 'package:shoply_app/features/signup/view_model/state.dart';

class SignUpImagePicker extends StatelessWidget {
  const SignUpImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) {
        return current is SingupPickImageState ||
            current is SingupRemoveImageState;
      },
      builder: (BuildContext context, state) {
        final cubit = context.read<SignupCubit>();

        final hasImage =
            cubit.image != null && (cubit.image?.path.isNotEmpty ?? false);

        return Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              backgroundImage: hasImage
                  ? FileImage(cubit.image!)
                  : AssetImage(AppImages.userIcon),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  cubit.pickImage();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primary,
                  ),
                  child: const Icon(
                    Icons.camera_alt_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            if (hasImage)
              Positioned(
                bottom: 5,
                left: 5,
                child: GestureDetector(
                  onTap: () {
                    cubit.deleteImage();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.error,
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
