import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:crybse/features/auth/presentation/provider/auth_provider.dart';
import 'package:crybse/gen/locale_keys.g.dart';
import 'package:crybse/routers/app_route.gr.dart';
import 'package:crybse/shared/core/constants/dimension.dart';
import 'package:crybse/shared/core/constants/keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});
  static String routeName = '/signInPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: Keys.SIGNIN_SCREEN,
      appBar: AppBar(
        shadowColor: Colors.transparent,
      ),
      body: Container(
        child: ref.watch(authNotifierProvider).maybeWhen(orElse: () => const SignInFormWidget(), data: (data) => const SignOutWidget()),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon/icon.png',
      width: 150,
      height: 150,
    );
  }
}

class SignOutWidget extends HookConsumerWidget {
  const SignOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: LogoWidget(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: Center(
            child: TextButton(
              child: Text(
                LocaleKeys.signout.tr(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
            ),
          ),
        )
      ],
    );
  }
}

class SignInFormWidget extends HookConsumerWidget {
  const SignInFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(signInNotifierProvider).email;
    final password = ref.watch(signInNotifierProvider).password;

    ref.listen(
      signInNotifierProvider.select((value) => value),
      (previous, next) {
        if (next.message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.message)),
          );
        }
        if (next.status == FormzSubmissionStatus.success) {
          AutoRouter.of(context).pushAndPopUntil(const HomePageRoute(), predicate: (_) => false);
        }
      },
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          const LogoWidget(),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: kMediumPadding, horizontal: kMinPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (input) => email.error?.getMessage(),
                    onChanged: (value) => ref.read(signInNotifierProvider.notifier).updateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: LocaleKeys.email.tr(),
                      hintText: LocaleKeys.email.tr(),
                    ),
                  ),
                  const SizedBox(height: kMediumPadding),
                  TextFormField(
                    obscureText: true,
                    validator: (input) => password.error?.getMessage(),
                    onChanged: (value) => ref.read(signInNotifierProvider.notifier).updatePassword(value),
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.fingerprint),
                      labelText: LocaleKeys.password.tr(),
                      hintText: LocaleKeys.password.tr(),
                      // suffixIcon: const IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
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
                          onPressed: () => ref.read(signInNotifierProvider.notifier).signInWithPassword(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).focusColor,
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          ),
                          child: ref.watch(signInNotifierProvider).status == FormzSubmissionStatus.inProgress
                              ? const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(),
                                )
                              : Text(LocaleKeys.signin.tr(),
                                  style: Theme.of(context).textTheme.titleMedium!.apply(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                      )),
                        )),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: kMediumPadding),
                      Text(LocaleKeys.or.tr(), style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: kMediumPadding),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
                        width: double.infinity,
                        height: 45,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue, width: 1.5),
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          ),
                          icon: const Icon(FontAwesomeIcons.google),
                          onPressed: () {},
                          label: Text(LocaleKeys.signinWithGoogle.tr()),
                        ),
                      ),
                      const SizedBox(height: kMediumPadding),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(
                            const SignUpPageRoute(),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: LocaleKeys.dontHaveAnAccount.tr(),
                            style: Theme.of(context).textTheme.titleMedium,
                            children: [
                              TextSpan(
                                text: ' ${LocaleKeys.signup.tr()}',
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
          ),
        ],
      ),
    );
  }
}
