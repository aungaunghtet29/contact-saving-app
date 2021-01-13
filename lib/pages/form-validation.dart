class AppValidation{
    String validateName(String value){
      if(value.length < 4 || value.isEmpty){
        return "Please Enter Your Name";
      }
      return null;
    }
    String validateEmail(String value){
      if(!value.contains("@") || value.isEmpty){
        return "Please Enter Your Email";
      }
      return null;
    }
    String validatePhone(String value){
      if(value.isEmpty || value.length < 7){
        return "Please Enter Your Phone";
      }
      return null;
    }
}