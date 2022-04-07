//지영 추가 

// const wishlist = document.getElementById("wishlist")
const id= document.getElementById("id")
const ultag = document.getElementById("ultag")



let count=0;


// if(id.value!=null){
ultag.addEventListener("click",function(event){
    if(event.target.classList.contains("material-icons-outlined")){
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
                    
                        console.log(this.responseText)
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
                    
                        console.log(event.target.parentNode)
                        }
                        else{
                            alert('wishlist 삭제 실패')

                        }
                    }
                }

            }

            }
        }

}) 
 

