let userAccount = document.querySelectorAll("#userAccount");

function convert(){
    
    for(let i = 0; i < userAccount.length; i++){
        if(userAccount[i].value == 0){
            userAccount[i].append("관리자");
        } else{
            userAccount[i].append("일반회원");
        }
    }
}

convert();




