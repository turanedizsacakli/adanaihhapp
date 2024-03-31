import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'admin_page_for_news_widget.dart' show AdminPageForNewsWidget;
import 'package:flutter/material.dart';

class AdminPageForNewsModel extends FlutterFlowModel<AdminPageForNewsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameController;
  String? Function(BuildContext, String?)? productNameControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    productNameFocusNode?.dispose();
    productNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }
}
