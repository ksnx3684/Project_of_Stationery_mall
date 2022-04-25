const id= document.getElementById("id")
const ultag = document.getElementById("ultag")

ultag.addEventListener("click",function(event){

    if(event.target.classList.contains("cart")){
        productNum=event.target.getAttribute("data-num")

   
            let xhttp = new XMLHttpRequest();
            xhttp.open("POST","./addCart");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
            xhttp.send("productNum="+productNum+"&productCount=1&optionNum=0");

            xhttp.onreadystatechange = function(){
                if(this.readyState==4 && this.status==200){
                    let result = this.responseText.trim();
                    console.log(result)
                    if(result=='1'){
                        alert("장바구니에 추가되었습니다.")
                        console.log("장바구니 추가 ")
                    }else if(result=='2'){
                        alert("이미 장바구니에 추가된 상품입니다.")
                    }else if(result=='3'){ 
                        let check = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")
                            if(check){
                                location.replace("../users/login")
                            }
                            return;
                    }else if(result=='4'){
                        alert("옵션을 선택해주세요. 상세페이지로 이동합니다")
                        location.replace("./detail?productNum="+productNum)
                    }
                }
            }
    }
});