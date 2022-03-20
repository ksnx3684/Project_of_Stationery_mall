const checkAll = document.getElementById("checkAll");
const checkRule = document.getElementsByClassName("checkRule");
const checkBox = document.getElementById("checkBox");
const btn = document.getElementById("btn");

// 전체동의 기능
checkAll.addEventListener("click", function(){
    for(check of checkRule){
        check.checked = checkAll.checked;
    }
});

// 한 개라도 체크가 해제 되어있으면 전체동의 체크 해제
for(discheck of checkRule){
    discheck.addEventListener("click", function(){
        let final = true;
        for(check of checkRule){
            if(!check.checked){
                final = false;
            }
        }
        checkAll.checked = final;
    })
};

// 약관에 모두 동의 시 join.jsp로 이동
btn.addEventListener("click", function(){
    if(checkAll.checked){
        window.location.href = "./join";
    } else {
        alert("약관에 모두 동의해주십시오");
    }
});