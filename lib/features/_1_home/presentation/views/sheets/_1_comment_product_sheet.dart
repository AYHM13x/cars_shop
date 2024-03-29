import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../_0_auth/presentation/model_view/auth_cubit/auth_cubit.dart';
import '../../model_view/_1_one_product_cubit/one_product_cubit.dart';

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
          const Gap(8),
          const Text("Add Comment"),
          const Gap(8),
          CustomTextFormField(
            hintText: "Your Comment",
            maxLines: 5,
            onChange: (data) {
              comment = data;
            },
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<OneProductCubit>(context)
                        .setIsLoadingComment(true);
                    await BlocProvider.of<OneProductCubit>(context).postComment(
                      token: BlocProvider.of<AuthCubit>(context).getToken(),
                      productId: BlocProvider.of<OneProductCubit>(context)
                          .getSelectedProductIndex(),
                      comment: comment,
                    );
                    BlocProvider.of<OneProductCubit>(context)
                        .setIsLoadingComment(false);
                  }
                  // await Future.delayed(const Duration(milliseconds: 700));
                  if (!BlocProvider.of<OneProductCubit>(context)
                      .getIsLoadingComment()) {
                    Navigator.pop(context);
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
              const Gap(8),
            ],
          ),
        ],
      ),
    );
  }
}
