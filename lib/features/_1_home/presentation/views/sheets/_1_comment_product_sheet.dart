import 'package:car_shop_app/core/widgets/custom_text_form_field.dart';
import 'package:car_shop_app/features/_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CommentProductSheet extends StatefulWidget {
  const CommentProductSheet({super.key});

  @override
  State<CommentProductSheet> createState() => _CommentProductSheetState();
}

class _CommentProductSheetState extends State<CommentProductSheet> {
  GlobalKey<FormState> formkey = GlobalKey();

  String comment = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          const Text("Add Comment"),
          const Gap(16),
          CustomTextFormField(
            hintText: "Your Comment",
            maxLines: 5,
            onChange: (data) {
              comment = data;
            },
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).postComment(
                      token: BlocProvider.of<AuthCubit>(context).getToken(),
                      productId: BlocProvider.of<AuthCubit>(context)
                          .getSelectedProductIndex(),
                      comment: comment,
                    );
                    Navigator.pop(context);
                    //setState(() {});
                  }
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: 18,
                  ),
                ),
              ),
              const Gap(16),
            ],
          ),
        ],
      ),
    );
  }
}
