import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_ai_food_calorie/presentation/utils/app_color.dart';

class ItemTextFormField extends StatefulWidget {
  TextEditingController controller ;
  String? Function(String?) validate ;
  TextInputType keyboardType  ;
  bool obscureText ;
  String textName ;
  String hintText ;
  ItemTextFormField({
    required this.controller,
    required this.validate,
    required this.textName ,
    required this.hintText ,
    this.keyboardType=TextInputType.text,
    this.obscureText=false ,
});

  @override
  State<ItemTextFormField> createState() => _ItemTextFormFieldState();
}

class _ItemTextFormFieldState extends State<ItemTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.textName,style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: 10.h,),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.validate,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColor.darkGreyColor
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColor.darkGreyColor,
                width:  1.w
              )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                    color: AppColor.whiteColor,
                    width:  1.w
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                    color: AppColor.redColor,
                    width:  1.w
                )
            ),
            focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                    color: AppColor.whiteColor,
                    width:  1.w
                )
            ),
            suffixIcon:
                widget.textName =='Password'||widget.textName =='Confirm Password'||widget.textName =='New Password'?
            IconButton(
                onPressed: (){
                  widget.obscureText = !widget.obscureText ;
                  setState(() {

                  });
                }, icon: Icon(widget.obscureText?Icons.visibility_off:Icons.visibility,size: 25.sp,color: AppColor.darkGreyColor,)):
                    null
          ),
        ),
      ],
    );
  }
}
