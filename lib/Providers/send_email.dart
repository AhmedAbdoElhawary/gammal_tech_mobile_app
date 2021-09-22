import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gammal_tech_mobile_app/Common%20UI/UI.dart';
import 'package:image_picker/image_picker.dart';

class Provider_SendEmail extends ChangeNotifier {
  TextEditingController controlUserName = TextEditingController();
  TextEditingController controlPhoneNumber = TextEditingController();
  TextEditingController controlEmailAddress = TextEditingController();
  TextEditingController controlMessage = TextEditingController();
  List<String> attachments = [];
  Future<void> send(context) async {
    final Email email = Email(
      cc: [controlEmailAddress.text],
      bcc: [controlUserName.text],
      body: controlMessage.text,
      subject: "${controlUserName.text}\n${controlPhoneNumber.text}",
      recipients: ["ahmedabdoelhawari12345asd@gmail.com"],
      attachmentPaths: attachments,
    );
    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
    showToast(platformResponse);
    notifyListeners();
  }

  void openImagePicker() async {
    final picker = ImagePicker();
    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
        attachments.add(pick.path);
    }
    notifyListeners();
  }

  void removeAttachment(int index) {
      attachments.removeAt(index);
      notifyListeners();
  }
}