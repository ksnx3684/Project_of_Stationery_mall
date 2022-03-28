const phone = document.getElementById("phone");
const email = document.getElementById("email");
const domain = document.getElementById("domain");
const email_id = document.getElementById("email_id");
const email_domain = document.getElementById("email_domain");
const postalCode = document.getElementById("postalCode");
const detailAdd = document.getElementById("detailAddress");
const addressPhone = document.getElementById("addressPhone");
const frm = document.getElementById("frm");
const btn = document.getElementById("btn");

let phoneCheck = false;
let emailCheck = false;
let email_idCheck = false;
let addressDetailCheck = false;
let addressPhoneCheck = false;

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
});


const fileDeleteBtn = document.querySelector(".fileDeleteBtn");
const files = document.querySelector("#files");
const profile = document.querySelector("#profile");

// 버튼을 클릭했을 때 각각의 fileNum 콘솔에 출력
files.addEventListener("click", function(event){

    if(event.target.classList.contains('fileDeleteBtn')){
        let div = document.createElement('div'); // <div></div>
        div.setAttribute("id", "fileupload");

        let file = document.createElement("input"); // <input>
        file.setAttribute("type", "file"); // <input type="file">
        file.setAttribute("name", "multipartFile"); // <input type="file" name="multipartFile">
        file.setAttribute("id", "multipartFile"); // <input type="file" name="multipartFile" id="multipartFile">

        div.append(file);

        profile.append(div);
    }

    if(event.target.classList.contains('fileDeleteBtn')){
        
        // ajax로 파라미터는 fileNum, method는 post, url은 fileDelete, controller의 메서드 명 : fileDelete
        let check = window.confirm("삭제하시겠습니까?");

        if(!check){
            return;
        }

        let fileNum = event.target.getAttribute("data-fileNum");

        let xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./fileDelete");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("fileNum=" + fileNum);

        xhttp.onreadystatechange=function(){
            if(this.readyState == 4 && this.status == 200){
                let result = this.responseText.trim();
                if(result = '1'){
                    console.log("file 삭제");
                    files.remove();
                    // event.target.parentNode.remove();
                }
            }
        }
    }
});