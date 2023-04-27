import 'package:auto_route/auto_route.dart';
import 'package:crybse/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:crybse/shared/constants/dimension.dart';
import 'package:crybse/shared/constants/keys.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static String routeName = '/signInPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.SIGNIN_SCREEN,
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
            const SignInFormWidget(),
          ],
        ),
      ),
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
        if (next.status == FormzSubmissionStatus.failure && next.message.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.message)),
          );
        }
      },
    );
    return Form(
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
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: kMediumPadding),
            TextFormField(
              validator: (input) => password.error?.getMessage(),
              onChanged: (value) => ref.read(signInNotifierProvider.notifier).updatePassword(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: 'Password',
                hintText: 'Password',
                suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            const SizedBox(height: kMediumPadding * 2),
            SizedBox(
              width: double.infinity,
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => ref.read(signInNotifierProvider.notifier).signInWithPassword(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).focusColor,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  child: ref.watch(signInNotifierProvider).status == FormzSubmissionStatus.inProgress
                      ? const SizedBox(width: 30, height: 30, child: CircularProgressIndicator())
                      : Text('Sign In', style: Theme.of(context).textTheme.titleMedium!.apply(color: Theme.of(context).scaffoldBackgroundColor)),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: kMediumPadding),
                Text('OR', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: kMediumPadding),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue, width: 1.5),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                    icon: const Icon(FontAwesomeIcons.google),
                    onPressed: () {},
                    label: const Text('Sign in with Google'),
                  ),
                ),
                const SizedBox(height: kMediumPadding),
                TextButton(
                  onPressed: () {
                    // Get.toNamed(RegisterScreen.routeName);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(color: Colors.blue),
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
