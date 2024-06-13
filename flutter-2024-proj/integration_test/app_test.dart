import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:video_game_catalogue_app/main.dart' as app;



void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Signup Page Integration Tests", () {
    testWidgets("Successful Signup", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("signup button")));
      await tester.pumpAndSettle();

      final userNameField = find.byKey(const Key("username_field"));
      final emailField = find.byKey(const Key("email_field"));
      final passwordField = find.byKey(const Key("password_field"));
      final confirmPasswordField = find.byKey(const Key("confirm_password_field"));

      await tester.enterText(userNameField, "username");
      await tester.enterText(emailField, 'we@gmail.com');
      await tester.enterText(passwordField, 'password');
      await tester.enterText(confirmPasswordField, 'password');
    
      final signupButton = find.byKey(const Key("create_account_field"));

      await tester.tap(signupButton);
      await tester.pumpAndSettle();

      expect(find.text("Browse"), findsOneWidget);

      final logOutButton = find.byKey(const Key("logout"));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(logOutButton);
      await tester.pumpAndSettle();

    });

    testWidgets("Invalid Email", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("signup button")));
      await tester.pumpAndSettle();

      final userNameField = find.byKey(const Key("username_field"));
      final emailField = find.byKey(const Key("email_field"));
      final passwordField = find.byKey(const Key("password_field"));
      final confirmPasswordField = find.byKey(const Key("confirm_password_field"));

      await tester.enterText(userNameField, "testuear");
      await tester.enterText(emailField, 'testInvalidEmail');
      await tester.enterText(passwordField, 'TestPassword123');
      await tester.enterText(confirmPasswordField, 'TestPassword123');
    
      final signupButton = find.byKey(const Key("create_account_field"));

      await tester.tap(signupButton);
      await tester.pumpAndSettle();

      expect(find.text("Email address is not in the correct format."), findsOneWidget);

      final loginButton = find.byKey(const Key("login_field"));

      await tester.pumpAndSettle();
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 100));

    });

    testWidgets("Password lessthan 8 characters ", (tester) async {
      
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("signup button")));
      await tester.pumpAndSettle();

      final userNameField = find.byKey(const Key("username_field"));
      final emailField = find.byKey(const Key("email_field"));
      final passwordField = find.byKey(const Key("password_field"));
      final confirmPasswordField = find.byKey(const Key("confirm_password_field"));

      await tester.enterText(userNameField, "testuear");
      await tester.enterText(emailField, 'testemail@gmail.com');
      await tester.enterText(passwordField, 'short');
      await tester.enterText(confirmPasswordField, 'short');
    
      final signupButton = find.byKey(const Key("create_account_field"));

      await tester.tap(signupButton);
      await tester.pumpAndSettle();

      expect(find.text("Password must be at least 8 characters."), findsOneWidget);

      final loginButton = find.byKey(const Key("login_field"));

      await tester.pumpAndSettle();
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(milliseconds: 100));
    });


   });

   group("Login page Integration Tests", () { 
      testWidgets("Successful Login", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        expect(find.text("Browse"), findsOneWidget);

        final logOutButton = find.byKey(const Key("logout"));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(logOutButton);
      await tester.pumpAndSettle();
      });
      testWidgets("Invalid Login credentials", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password123");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        expect(find.text("Exception: Invalid credentials: Login failed"), findsOneWidget);

        final logOutButton = find.byKey(const Key("logout"));
      await tester.pumpAndSettle();
      });
      testWidgets("Empty fields", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        expect(find.text("Please fill in all of the fields."), findsOneWidget);
      });
   });
   group("Profile related tests", () { 
      testWidgets("profile name displayed correctly", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        final profileButton = find.byKey(const Key("profile_icon"));

        await tester.tap(profileButton);
        await tester.pumpAndSettle();

        expect(find.text("username"), findsAtLeast(2));

        final logOutButton = find.byKey(const Key("logout"));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(logOutButton);
      await tester.pumpAndSettle();
      });

      testWidgets("Incorrect profile update partial update!", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        final profileButton = find.byKey(const Key("profile_icon"));
        final updateButton = find.byKey(const Key("update"));
        final confirmButton = find.byKey(const Key("confirm"));

        final updateUsername = find.byKey(const Key("username_field"));

        await tester.tap(profileButton);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();

        await tester.enterText(updateUsername, "newUserName");
        await tester.pumpAndSettle();
        //print("I have reached here");
        await tester.tap(updateButton);
        await tester.pumpAndSettle();

        await tester.tap(confirmButton);
        await tester.pumpAndSettle();



        expect(find.text("Please fill in all three fields."), findsOneWidget);

        final logOutButton = find.byKey(const Key("logout"));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(logOutButton);
      await tester.pumpAndSettle();
      });

      testWidgets("Incorrect Profile update wrong email format.", (tester) async {
        
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        final profileButton = find.byKey(const Key("profile_icon"));
        final updateButton = find.byKey(const Key("update"));
        final confirmButton = find.byKey(const Key("confirm"));

        final updateUsername = find.byKey(const Key("username_field"));
        final updateEmail = find.byKey(const Key("email"));
        final updatePassword = find.byKey(const Key("newPassword"));

        await tester.tap(profileButton);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();

        await tester.enterText(updateUsername, "new_username");
        await tester.pumpAndSettle();
        await tester.enterText(updateEmail, "new_email");
        await tester.pumpAndSettle();
        await tester.enterText(updatePassword, "new_password");
        await tester.pumpAndSettle();
        //print("I have reached here");
        await tester.tap(updateButton);
        await tester.pumpAndSettle();

        await tester.tap(confirmButton);
        await tester.pumpAndSettle();



        expect(find.text("Email address is not in the correct format."), findsOneWidget);


        final logOutButton = find.byKey(const Key("logout"));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(logOutButton);
      await tester.pumpAndSettle();
      });

      testWidgets("Profile updated successfully.", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        final profileButton = find.byKey(const Key("profile_icon"));
        final updateButton = find.byKey(const Key("update"));
        final confirmButton = find.byKey(const Key("confirm"));

        final updateUsername = find.byKey(const Key("username_field"));
        final updateEmail = find.byKey(const Key("email"));
        final updatePassword = find.byKey(const Key("newPassword"));

        await tester.tap(profileButton);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle();

        await tester.enterText(updateUsername, "new_username");
        await tester.pumpAndSettle();
        await tester.enterText(updateEmail, "new_email@gmail.com");
        await tester.pumpAndSettle();
        await tester.enterText(updatePassword, "new_password");
        await tester.pumpAndSettle();
        //print("I have reached here");
        await tester.tap(updateButton);
        await tester.pumpAndSettle();

        await tester.tap(confirmButton);
        await tester.pumpAndSettle();



        expect(find.text("Account updated successfully."), findsOneWidget);

        await tester.enterText(updateUsername, "username");
        await tester.pumpAndSettle();
        await tester.enterText(updateEmail, "we@gmail.com");
        await tester.pumpAndSettle();
        await tester.enterText(updatePassword, "password");
        await tester.pumpAndSettle();
        //print("I have reached here");
        await tester.tap(updateButton);
        await tester.pumpAndSettle();

        await tester.tap(confirmButton);
        await tester.pumpAndSettle();


        final logOutButton = find.byKey(const Key("logout"));

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      await tester.tap(logOutButton);
      await tester.pumpAndSettle();
      });
   
   });
   
  testWidgets("profile Termination", (tester) async {
        app.main();

        await tester.pumpAndSettle();

        final userNameField = find.byKey(const Key("login_username"));
        final passwordField = find.byKey(const Key("login_password"));

        await tester.enterText(userNameField, "username");
        await tester.enterText(passwordField, "password");

        final loginButton = find.byKey(const Key("Login_button"));

        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        final profileButton = find.byKey(const Key("profile_icon"));

        await tester.tap(profileButton);
        await tester.pumpAndSettle();
        final terminateConfirm = find.byKey(const Key("terminated"));
        final terminateButton = find.byKey(const Key("terminate"));

        await tester.tap(terminateButton);
        await tester.pumpAndSettle();

        await tester.tap(terminateConfirm);
        await tester.pumpAndSettle();

        expect(find.text("Login"), findsOneWidget);
        await tester.pumpAndSettle();
      });  
}