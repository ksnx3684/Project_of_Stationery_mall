const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let pwCheck = false;
let pw2Check = false;

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

btn.addEventListener("click", function(){
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

    frm.submit();
});