import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/auth/presentation/controller/sign_up_controller.dart';
import 'package:crybse/generated/locale_keys.g.dart';
import 'package:crybse/routers/app_route.gr.dart';
import 'package:crybse/shared/constants/dimension.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static String routeName = '/signUpPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.SIGNUP_SCREEN,
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Scaffold(
        body: Column(
          children: [
            Image.asset(
              'assets/icon/icon.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const SignUpFormWidget(),
          ],
        ),
      ),
    );
  }
}

class SignUpFormWidget extends HookConsumerWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signUpNotifierProvider).email;
    final password = ref.watch(signUpNotifierProvider).password;
    final confirmPassword = ref.watch(signUpNotifierProvider).confirmPassword;

    ref.listen(
      signUpNotifierProvider.select((value) => value),
      (previous, next) {
        if (next.message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.message)),
          );
        }
        if (next.status == FormzSubmissionStatus.success) {
          AutoRouter.of(context).pop(const SignInPageRoute());
        }
      },
    );
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kMediumPadding, horizontal: kMinPadding),
        child: Column(
          children: [
            TextFormField(
              validator: (input) => email.error?.getMessage(),
              onChanged: (value) => ref.read(signUpNotifierProvider.notifier).updateEmail(value),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: LocaleKeys.email.tr(),
                hintText: LocaleKeys.email.tr(),
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              validator: (input) => password.error?.getMessage(),
              onChanged: (value) => ref.read(signUpNotifierProvider.notifier).updatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: LocaleKeys.password.tr(),
                hintText: LocaleKeys.password.tr(),
                suffixIcon: const IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              validator: (input) => confirmPassword.error?.getMessage(),
              onChanged: (value) => ref.read(signUpNotifierProvider.notifier).updateConfirmPassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: LocaleKeys.confirmPassword.tr(),
                hintText: LocaleKeys.confirmPassword.tr(),
                suffixIcon: const IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            const SizedBox(height: kMediumPadding * 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              width: double.infinity,
              child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => ref.read(signUpNotifierProvider.notifier).signUpWithPassword(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).focusColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),
                    child: ref.watch(signUpNotifierProvider).status == FormzSubmissionStatus.inProgress
                        ? const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(),
                          )
                        : Text(LocaleKeys.signup.tr(),
                            style: Theme.of(context).textTheme.titleMedium!.apply(
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                )),
                  )),
            ),
            Column(
              children: [
                const SizedBox(height: kMediumPadding),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).pop(const SignInPageRoute());
                  },
                  child: Text.rich(
                    TextSpan(
                      text: LocaleKeys.haveAnAccount.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: ' ${LocaleKeys.signin.tr()}',
                          style: const TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
