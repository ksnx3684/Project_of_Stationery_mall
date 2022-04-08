const id = document.getElementById("id");
const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const name = document.getElementById("name");
const phone = document.getElementById("phone");
const email = document.getElementById("email");
const domain = document.getElementById("domain");
const email_id = document.getElementById("email_id");
const email_domain = document.getElementById("email_domain");
const gender = document.getElementById("gender");
const postalCode = document.getElementById("postalCode");
const detailAdd = document.getElementById("detailAddress");
const addressPhone = document.getElementById("addressPhone");
const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let idCheck = false;
let pwCheck = false;
let pw2Check = false;
let nameCheck = false;
let phoneCheck = false;
let emailCheck = false;
let email_idCheck = false;
let addressDetailCheck = false;
let addressPhoneCheck = false;

// ID Check
id.addEventListener("blur", function(){
    if(id.value == ""){
        // idResult.innerHTML = "필수 입력사항입니다";
        idCheck = false;
    } else {
        // idResult.innerHTML = "";
        idCheck = true;
    }
});

// PW Check
pw.addEventListener("blur", function(){
    if(pw.value.length > 7 && pw.value.length < 17){
        pwResult1.innerHTML = "조건에 맞습니다";
        pwResult2.innerHTML = "";
        pwCheck = true;
    } else {
        pwResult1.innerHTML = "";
        pwResult2.innerHTML = "비밀번호는 8글자 이상 16글자 이하로 설정하십시오";
        pwCheck = false;
    }
});

// PW값이 변경 될 경우
pw.addEventListener("change", function(){
    pwCheck = false;
    pw2Check = false;
    pw2.value = "";
    pwResultCheck1.innerHTML = "";
    pwResultCheck2.innerHTML = "";
    pw.focus();
});

// PW2 check
pw2.addEventListener("blur", function(){
    if(pw.value != pw2.value){
        pwResultCheck1.innerHTML = "비밀번호가 일치하지 않습니다";
        pwResultCheck2.innerHTML = "";
        pw2Check = false;
    } else {
        pwResultCheck1.innerHTML = "";
        pwResultCheck2.innerHTML = "비밀번호가 일치합니다";
        pw2Check = true;
    }
});

// Name
name.addEventListener("blur", function(){
    if(name.value != ""){
        nameCheck = true;
    } else {
        nameCheck = false;
    }
});

// Phone
phone.addEventListener("blur", function(){
    if(phone.value != ""){
        phoneCheck = true;
    } else {
        phoneCheck = false;
    }
});

// Email
email_id.addEventListener("blur", function(){
    if(email_id.value != ""){
        email_idCheck = true;
    } else {
        email_idCheck = false;
    }
});

domain.addEventListener("change", function(){
    if(domain.value == "1"){
        email_domain.value = "";
        email_domain.readOnly = false;
        email_domain.focus();
        
    } else {
        email_domain.value = domain.value;
        email_domain.readOnly = true;
    }
});

const btnCheck = document.querySelector("#total");
btnCheck.addEventListener("mousemove", function(){
    let email_id = document.querySelector("#email_id").value;
    let email_domain = document.querySelector("#email_domain").value;
    let at = "@";
    let address = document.querySelector("#address").value;
    let detailAddress = document.querySelector('#detailAddress').value;
    let extraAddress = document.querySelector("#extraAddress").value;

    document.querySelector("#email").value = email_id + at + email_domain;
    document.querySelector("#addressDetail").value = address + detailAddress + extraAddress;
});

// AddressDetail
detailAdd.addEventListener("focus", function(){
    if(postalCode.value != ""){
        addressDetailCheck = true;
    } else {
        addressDetailCheck = false;
    }
});

// AddressPhone
addressPhone.addEventListener("input", function(){
    if(addressPhone.value != ""){
        addressPhoneCheck = true;
    } else {
        addressPhoneCheck = false;
    }
});

// Join
btn.addEventListener("click", function(){
    if(!idCheck){
        alert("ID를 입력하십시오");
        id.focus();
        return;
    }
    if(!pwCheck){
        alert("비밀번호를 입력하십시오");
        pw.focus();
        return;
    }
    if(!pw2Check){
        alert("비밀번호가 일치하지 않습니다");
        pw2.focus();
        return;
    }
    if(!nameCheck){
        alert("이름을 입력하십시오");
        name.focus();
        return;
    }
    if(!phoneCheck){
        alert("전화번호를 입력하십시오");
        phone.focus();
        return;
    }
    if(!email_idCheck){
        alert("이메일 아이디를 입력하십시오");
        email_id.focus();
        return;
    }

    // Email 유효성 체크
    function valid_email (email){
        let pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        return (email.value != '' && email.value != 'undefined' && pattern.test(email.value));
    }
    if(!valid_email(email)){
        alert("이메일을 형식에 맞게 입력하십시오")
        email_domain.focus();
        return;
    }

    if(!addressDetailCheck){
        alert("주소를 입력하십시오");
        postalCode.focus();
        return;
    }
    if(!addressPhoneCheck){
        alert("배송연락처를 입력하십시오");
        addressPhone.focus();
        return;
    }
    frm.submit();
    alert("회원가입이 완료되었습니다");
});