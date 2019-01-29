package pl.coderslab.validator;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.coderslab.entity.User;
import pl.coderslab.service.UserService;

@Component
public class UserLogValidator implements Validator {

    @Autowired
    UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        if(userService.findByEmail(user.getEmail()) == null){
            errors.rejectValue("email", "nonExisting.userLog.email");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if(!userService.verify(user)){
            errors.rejectValue("password", "nonMatching.userLog.password");
        }
    }
}
