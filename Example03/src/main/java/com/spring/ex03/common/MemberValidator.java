package com.spring.ex03.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.spring.ex03.vo.MemberVO;

public class MemberValidator implements Validator {

	private static final String idRegExp = "^[a-zA-z0-9]{4,20}$";
	private static final String pwRegExp = "^[a-zA-z0-9]{8,30}$";


	private Matcher matcher =null;
	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberVO vo = (MemberVO) target;
		String id = vo.getId();
		String pw = vo.getPassword();
		String pwChk = vo.getPwCheck();
		String name = vo.getName();
		
		if(id.trim().isEmpty() || id == null) {
			errors.rejectValue("id", "required", "아이디를 입력해주세요");
		}else {
			matcher = Pattern.compile(idRegExp).matcher(id);
			if(!matcher.matches())
				errors.rejectValue("id", "bad", "아이디는 영문자와 숫자로만 이루어져야 합니다(4~20자)");
		}
	
		if(pw.trim().isEmpty() || pw == null) {
			errors.rejectValue("password", "required", "비밀번호를 입력해주세요");
		}else {
			matcher = Pattern.compile(pwRegExp).matcher(pw);
			if(!matcher.matches())
				errors.rejectValue("password", "bad", "비밀번호는 영문자와 숫자로만 이루어져야 합니다(8~30자)");
		}
		
		if(!pw.equals(pwChk)) {
			errors.rejectValue("pwCheck", "비밀번호가 일치하지 않습니다");
		}
		
		if(name.trim() == null) {
			errors.rejectValue("name", "required", "필수 정보입니다");
		}else {
			if(name.length() > 10 || name.length() < 1)
				errors.rejectValue("name", "bad", "이름은 10글자 이내로");
		}
		
	}

}
