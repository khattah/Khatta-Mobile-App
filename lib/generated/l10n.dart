// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `KHATTAH`
  String get app_title {
    return Intl.message(
      'KHATTAH',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get nameDoneBtn {
    return Intl.message(
      'Done',
      name: 'nameDoneBtn',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nameNextBtn {
    return Intl.message(
      'Next',
      name: 'nameNextBtn',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get namePrevBtn {
    return Intl.message(
      'Previous',
      name: 'namePrevBtn',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get nameSkipBtn {
    return Intl.message(
      'Skip',
      name: 'nameSkipBtn',
      desc: '',
      args: [],
    );
  }

  /// `welcome`
  String get intro_slider_title1 {
    return Intl.message(
      'welcome',
      name: 'intro_slider_title1',
      desc: '',
      args: [],
    );
  }

  /// `Join us`
  String get intro_slider_title2 {
    return Intl.message(
      'Join us',
      name: 'intro_slider_title2',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get intro_slider_title3 {
    return Intl.message(
      'Subscribe',
      name: 'intro_slider_title3',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get intro_slider_title4 {
    return Intl.message(
      'Pay',
      name: 'intro_slider_title4',
      desc: '',
      args: [],
    );
  }

  /// `share`
  String get intro_slider_title5 {
    return Intl.message(
      'share',
      name: 'intro_slider_title5',
      desc: '',
      args: [],
    );
  }

  /// `redeem`
  String get intro_slider_title6 {
    return Intl.message(
      'redeem',
      name: 'intro_slider_title6',
      desc: '',
      args: [],
    );
  }

  /// `enjoy`
  String get intro_slider_title7 {
    return Intl.message(
      'enjoy',
      name: 'intro_slider_title7',
      desc: '',
      args: [],
    );
  }

  /// `JT trading app is app help you to gain extra money.`
  String get intro_slider_info1 {
    return Intl.message(
      'JT trading app is app help you to gain extra money.',
      name: 'intro_slider_info1',
      desc: '',
      args: [],
    );
  }

  /// `To join us you need to register to our system or login to it if you already have account.`
  String get intro_slider_info2 {
    return Intl.message(
      'To join us you need to register to our system or login to it if you already have account.',
      name: 'intro_slider_info2',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe to any package and gain the reward.`
  String get intro_slider_info3 {
    return Intl.message(
      'Subscribe to any package and gain the reward.',
      name: 'intro_slider_info3',
      desc: '',
      args: [],
    );
  }

  /// `Pay for the package you want to subscribe.`
  String get intro_slider_info4 {
    return Intl.message(
      'Pay for the package you want to subscribe.',
      name: 'intro_slider_info4',
      desc: '',
      args: [],
    );
  }

  /// `Share the package with friends, family and social media ,so they can able to subscribe.`
  String get intro_slider_info5 {
    return Intl.message(
      'Share the package with friends, family and social media ,so they can able to subscribe.',
      name: 'intro_slider_info5',
      desc: '',
      args: [],
    );
  }

  /// `Redeem the money you gain after people subscribe to your package.`
  String get intro_slider_info6 {
    return Intl.message(
      'Redeem the money you gain after people subscribe to your package.',
      name: 'intro_slider_info6',
      desc: '',
      args: [],
    );
  }

  /// `Now you can enjoy our service.`
  String get intro_slider_info7 {
    return Intl.message(
      'Now you can enjoy our service.',
      name: 'intro_slider_info7',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number(with no zero)`
  String get phone_number_hint {
    return Intl.message(
      'Phone number(with no zero)',
      name: 'phone_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone number(with no zero))`
  String get phone_number_hint_sign_up {
    return Intl.message(
      'Phone number(with no zero))',
      name: 'phone_number_hint_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forget_passwordQ {
    return Intl.message(
      'Forget Password?',
      name: 'forget_passwordQ',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account? `
  String get don_have_account {
    return Intl.message(
      'Don\'t have account? ',
      name: 'don_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get last_name {
    return Intl.message(
      'Last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get first_name {
    return Intl.message(
      'First name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `ex:Ali`
  String get last_name_hint {
    return Intl.message(
      'ex:Ali',
      name: 'last_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `ex:Ahmed`
  String get first_name_hint {
    return Intl.message(
      'ex:Ahmed',
      name: 'first_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: '',
      args: [],
    );
  }

  /// `I accept the `
  String get i_accept {
    return Intl.message(
      'I accept the ',
      name: 'i_accept',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get term_conditions {
    return Intl.message(
      'Terms of use',
      name: 'term_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully Sign in now.`
  String get forget_password_done_message {
    return Intl.message(
      'Password changed successfully Sign in now.',
      name: 'forget_password_done_message',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully.`
  String get change_password_done_message {
    return Intl.message(
      'Password changed successfully.',
      name: 'change_password_done_message',
      desc: '',
      args: [],
    );
  }

  /// `A text message containing the activation code will be sent to your number`
  String get forget_password_message {
    return Intl.message(
      'A text message containing the activation code will be sent to your number',
      name: 'forget_password_message',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the verification code that sent to your number ,to complete your account activation`
  String get verification_msg {
    return Intl.message(
      'Please enter the verification code that sent to your number ,to complete your account activation',
      name: 'verification_msg',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Click again to exit!`
  String get click_again_to_exit {
    return Intl.message(
      'Click again to exit!',
      name: 'click_again_to_exit',
      desc: '',
      args: [],
    );
  }

  /// `Packages`
  String get packages {
    return Intl.message(
      'Packages',
      name: 'packages',
      desc: '',
      args: [],
    );
  }

  /// `Active Packages`
  String get active_packages {
    return Intl.message(
      'Active Packages',
      name: 'active_packages',
      desc: '',
      args: [],
    );
  }

  /// `state`
  String get state {
    return Intl.message(
      'state',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Browse Packages`
  String get browse_Packages {
    return Intl.message(
      'Browse Packages',
      name: 'browse_Packages',
      desc: '',
      args: [],
    );
  }

  /// `History packages`
  String get history_packages {
    return Intl.message(
      'History packages',
      name: 'history_packages',
      desc: '',
      args: [],
    );
  }

  /// `Package details`
  String get package_details {
    return Intl.message(
      'Package details',
      name: 'package_details',
      desc: '',
      args: [],
    );
  }

  /// `Buy package`
  String get buy_package {
    return Intl.message(
      'Buy package',
      name: 'buy_package',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get view_details {
    return Intl.message(
      'View Details',
      name: 'view_details',
      desc: '',
      args: [],
    );
  }

  /// `Account settings`
  String get account_settings {
    return Intl.message(
      'Account settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are your sure?`
  String get are_you_sure {
    return Intl.message(
      'Are your sure?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get choose_language {
    return Intl.message(
      'Choose language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Mange your password ,ex change it`
  String get change_your_password {
    return Intl.message(
      'Mange your password ,ex change it',
      name: 'change_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Change number`
  String get change_number {
    return Intl.message(
      'Change number',
      name: 'change_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_your_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Profile photo`
  String get profile_photo {
    return Intl.message(
      'Profile photo',
      name: 'profile_photo',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Please wait ...`
  String get please_wait {
    return Intl.message(
      'Please wait ...',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `wait ...`
  String get wait {
    return Intl.message(
      'wait ...',
      name: 'wait',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get please_fill_all_fields {
    return Intl.message(
      'Please fill all fields',
      name: 'please_fill_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalid_username {
    return Intl.message(
      'Invalid phone number',
      name: 'invalid_username',
      desc: '',
      args: [],
    );
  }

  /// `Password should be 4 letters minimum`
  String get short_password {
    return Intl.message(
      'Password should be 4 letters minimum',
      name: 'short_password',
      desc: '',
      args: [],
    );
  }

  /// `please enter valid name`
  String get invalid_name {
    return Intl.message(
      'please enter valid name',
      name: 'invalid_name',
      desc: '',
      args: [],
    );
  }

  /// `password does't match the confirmation`
  String get password_not_match {
    return Intl.message(
      'password does\'t match the confirmation',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `username or password is not correct`
  String get invalid_login {
    return Intl.message(
      'username or password is not correct',
      name: 'invalid_login',
      desc: '',
      args: [],
    );
  }

  /// `Accept the terms of use first`
  String get check_term_of_user {
    return Intl.message(
      'Accept the terms of use first',
      name: 'check_term_of_user',
      desc: '',
      args: [],
    );
  }

  /// `Message has been sent to this number check your sms`
  String get forget_message {
    return Intl.message(
      'Message has been sent to this number check your sms',
      name: 'forget_message',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Updating...`
  String get updating {
    return Intl.message(
      'Updating...',
      name: 'updating',
      desc: '',
      args: [],
    );
  }

  /// `Updated`
  String get updated {
    return Intl.message(
      'Updated',
      name: 'updated',
      desc: '',
      args: [],
    );
  }

  /// `IN PROGRESS`
  String get on_progress {
    return Intl.message(
      'IN PROGRESS',
      name: 'on_progress',
      desc: '',
      args: [],
    );
  }

  /// `You don't currently participate in any package`
  String get no_active_packages {
    return Intl.message(
      'You don\'t currently participate in any package',
      name: 'no_active_packages',
      desc: '',
      args: [],
    );
  }

  /// `You don't currently any package in your history`
  String get no_history_packages {
    return Intl.message(
      'You don\'t currently any package in your history',
      name: 'no_history_packages',
      desc: '',
      args: [],
    );
  }

  /// `Send Invitations`
  String get send_invitations {
    return Intl.message(
      'Send Invitations',
      name: 'send_invitations',
      desc: '',
      args: [],
    );
  }

  /// `Invitation`
  String get invitation {
    return Intl.message(
      'Invitation',
      name: 'invitation',
      desc: '',
      args: [],
    );
  }

  /// `Earn`
  String get you_earn {
    return Intl.message(
      'Earn',
      name: 'you_earn',
      desc: '',
      args: [],
    );
  }

  /// `Put`
  String get you_give {
    return Intl.message(
      'Put',
      name: 'you_give',
      desc: '',
      args: [],
    );
  }

  /// `SDG`
  String get sdg {
    return Intl.message(
      'SDG',
      name: 'sdg',
      desc: '',
      args: [],
    );
  }

  /// `Subscribers`
  String get referrals {
    return Intl.message(
      'Subscribers',
      name: 'referrals',
      desc: '',
      args: [],
    );
  }

  /// `Redeemed Via`
  String get redeemed_via {
    return Intl.message(
      'Redeemed Via',
      name: 'redeemed_via',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Reward`
  String get redeem_reward {
    return Intl.message(
      'Redeem Reward',
      name: 'redeem_reward',
      desc: '',
      args: [],
    );
  }

  /// `Vendor`
  String get vendor {
    return Intl.message(
      'Vendor',
      name: 'vendor',
      desc: '',
      args: [],
    );
  }

  /// `Accept Invitation`
  String get accept_invitation {
    return Intl.message(
      'Accept Invitation',
      name: 'accept_invitation',
      desc: '',
      args: [],
    );
  }

  /// `Referrals needed`
  String get referrals_needed {
    return Intl.message(
      'Referrals needed',
      name: 'referrals_needed',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get finished_state {
    return Intl.message(
      'Completed',
      name: 'finished_state',
      desc: '',
      args: [],
    );
  }

  /// `Un paid`
  String get un_paid {
    return Intl.message(
      'Un paid',
      name: 'un_paid',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `No subscribers accepted yet, please send invitation or share package with others`
  String get no_subscribers_msg {
    return Intl.message(
      'No subscribers accepted yet, please send invitation or share package with others',
      name: 'no_subscribers_msg',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Pay now`
  String get pay {
    return Intl.message(
      'Pay now',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Payment process will be done here later`
  String get payment_later {
    return Intl.message(
      'Payment process will be done here later',
      name: 'payment_later',
      desc: '',
      args: [],
    );
  }

  /// `Redeem process will be done here later`
  String get redeem_later {
    return Intl.message(
      'Redeem process will be done here later',
      name: 'redeem_later',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Pay later`
  String get pay_Later {
    return Intl.message(
      'Pay later',
      name: 'pay_Later',
      desc: '',
      args: [],
    );
  }

  /// `Update App ?`
  String get update_app {
    return Intl.message(
      'Update App ?',
      name: 'update_app',
      desc: '',
      args: [],
    );
  }

  /// `Close app`
  String get close_app {
    return Intl.message(
      'Close app',
      name: 'close_app',
      desc: '',
      args: [],
    );
  }

  /// `Update Now`
  String get update_now {
    return Intl.message(
      'Update Now',
      name: 'update_now',
      desc: '',
      args: [],
    );
  }

  /// `A new version of KHATA app is available !\nPlease update your Fatish app to latest version`
  String get update_message {
    return Intl.message(
      'A new version of KHATA app is available !\nPlease update your Fatish app to latest version',
      name: 'update_message',
      desc: '',
      args: [],
    );
  }

  /// `Resend SMS`
  String get resend_activation_code {
    return Intl.message(
      'Resend SMS',
      name: 'resend_activation_code',
      desc: '',
      args: [],
    );
  }

  /// `resend`
  String get resend {
    return Intl.message(
      'resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get old_password {
    return Intl.message(
      'Old password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm New password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Please contact customer service to complete the cash payment for subscription to package No`
  String get customer_service_info_message {
    return Intl.message(
      'Please contact customer service to complete the cash payment for subscription to package No',
      name: 'customer_service_info_message',
      desc: '',
      args: [],
    );
  }

  /// `Please contact customer service to complete the redeem progress for subscription No`
  String get customer_service_info_message_redeem {
    return Intl.message(
      'Please contact customer service to complete the redeem progress for subscription No',
      name: 'customer_service_info_message_redeem',
      desc: '',
      args: [],
    );
  }

  /// `Pay cash`
  String get pay_cash {
    return Intl.message(
      'Pay cash',
      name: 'pay_cash',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Customer service phone number`
  String get customer_service_number {
    return Intl.message(
      'Customer service phone number',
      name: 'customer_service_number',
      desc: '',
      args: [],
    );
  }

  /// `Cash card`
  String get pay_noqod {
    return Intl.message(
      'Cash card',
      name: 'pay_noqod',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to subscribe on this package`
  String get subscribe_ask {
    return Intl.message(
      'Are you sure you want to subscribe on this package',
      name: 'subscribe_ask',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `No internet network connection`
  String get no_internet {
    return Intl.message(
      'No internet network connection',
      name: 'no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the process`
  String get complete_process {
    return Intl.message(
      'Please complete the process',
      name: 'complete_process',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Redeem`
  String get redeem {
    return Intl.message(
      'Redeem',
      name: 'redeem',
      desc: '',
      args: [],
    );
  }

  /// `Bank card number`
  String get card_id {
    return Intl.message(
      'Bank card number',
      name: 'card_id',
      desc: '',
      args: [],
    );
  }

  /// `Bank card number(Optional)`
  String get card_id_hint {
    return Intl.message(
      'Bank card number(Optional)',
      name: 'card_id_hint',
      desc: '',
      args: [],
    );
  }

  /// `Edit bank card number`
  String get edit_card_id {
    return Intl.message(
      'Edit bank card number',
      name: 'edit_card_id',
      desc: '',
      args: [],
    );
  }

  /// `Not added`
  String get not_added {
    return Intl.message(
      'Not added',
      name: 'not_added',
      desc: '',
      args: [],
    );
  }

  /// `subscription link`
  String get subscribe_link {
    return Intl.message(
      'subscription link',
      name: 'subscribe_link',
      desc: '',
      args: [],
    );
  }

  /// `Please enter or past subscription link here`
  String get subscribe_link_past {
    return Intl.message(
      'Please enter or past subscription link here',
      name: 'subscribe_link_past',
      desc: '',
      args: [],
    );
  }

  /// `Please enter or past subscription link`
  String get subscribe_link_enter {
    return Intl.message(
      'Please enter or past subscription link',
      name: 'subscribe_link_enter',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct subscription link`
  String get subscribe_link_valid {
    return Intl.message(
      'Please enter correct subscription link',
      name: 'subscribe_link_valid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}