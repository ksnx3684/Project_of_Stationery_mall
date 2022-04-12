// listpage 위시리스트 + 장바구니

const id= document.getElementById("id")
const ultag = document.getElementById("ultag")



let count=0;



ultag.addEventListener("click",function(event){
    //cart
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

    //wishlist
    if(event.target.classList.contains("wishlist")){
    productNum=event.target.getAttribute("data-num")


        //로그인 안했을 경우
        if(id.value==""){
            let check = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")
            if(check){
                location.replace("../users/login")
            }
            return;
        //로그인 했을 경우 
        //#로그인 후 리스트페이지로 다시 돌아오는것도 추가해야됨
        }else{
             count++;

            //위시리스트 추가 
            if(count%2==1){ 

                event.target.innerHTML="favorite"

                let xhttp = new XMLHttpRequest();
                xhttp.open("POST","../users/addWishList");
                xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
                xhttp.send("id="+id.value+"&productNum="+productNum);

                xhttp.onreadystatechange = function(){
                    if(this.readyState==4 && this.status==200){
                        let result = this.responseText.trim();
                        if(result=='1'){
                        console.log("wishlist 추가 ")
                        }else if(result=='2'){
                            alert('이미 위시리스트에 추가된 상품입니다.')
                        }else{
                            alert('wishlist 추가 실패')
                        }
                    }
                }


            //위시리스트 삭제
            }else{
                event.target.innerHTML="favorite_border"

                let xhttp = new XMLHttpRequest();
                xhttp.open("POST","../users/deleteWishList");
                xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
                xhttp.send("id="+id.value+"&productNum="+productNum);

                xhttp.onreadystatechange = function(){
                    if(this.readyState==4 && this.status==200){
                    
                        console.log(this.responseText)
                        let result = this.responseText.trim();
                        if(result=='1'){
                        console.log("wishlist 삭제 ")
                        }
                        else{
                            console.log('wishlist 삭제 실패')

                        }
                    }
                }

            }

            }
        }

}) 
 

