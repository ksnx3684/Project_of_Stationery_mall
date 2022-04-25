
$(".wishlist").click(function(){
    let productNum = $(this).attr("data-num");
    let id = $("#id").val();
    console.log(productNum);
    console.log(id);

    if($("#id").val()==""){
        let check = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")
        if(check){
            location.replace("../users/login");
        }
        return;
    }

    $.ajax({
        type : "post",
        url : "../users/addWishList",
        data : {
            id : id,
            productNum : productNum
        },

        success : function(result){
            if(result.trim() == 2){
                alert("이미 위시리스트에 있습니다")
            } else{
                alert("위시리스트에 추가 되었습니다");
            }
        },
        error : function(){
            alert("에러가 발생했습니다")
        }
    })

});




// // listpage 위시리스트
// const wishlist = document.getElementsByClassName("wishlist");

//     wishlist[0].addEventListener("click",function(event){

//     //wishlist
//     if(event.target.classList.contains("wishlist")){
//     productNum=event.target.getAttribute("data-num")
//     console.log(productNum);


//         //로그인 안했을 경우
//         if(id.value==""){
//             let check = confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")
//             if(check){
//                 location.replace("../users/login")
//             }
//             return;
//         //로그인 했을 경우 
        
//         }
//             //  count++;

//             //위시리스트 추가 
//             if(event.target.innerHTML=="favorite_border"){ 

//                 let xhttp = new XMLHttpRequest();
//                 xhttp.open("POST","../users/addWishList");
//                 xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
//                 xhttp.send("id="+id.value+"&productNum="+productNum);

//                 xhttp.onreadystatechange = function(){
//                     if(this.readyState==4 && this.status==200){
//                         let result = this.responseText.trim();
//                         if(result=='1'){
//                             event.target.innerHTML="favorite"
//                             console.log("wishlist 추가 ")
//                         }else if(result=='2'){
//                             alert('이미 위시리스트에 추가된 상품입니다.')
//                             event.target.innerHTML="favorite"
//                         }else{
//                             alert('wishlist 추가 실패')
//                         }
//                     }
//                 }

//             }
//             위시리스트 삭제
//             else{
//                 event.target.innerHTML="favorite_border"

//                 let xhttp = new XMLHttpRequest();
//                 xhttp.open("POST","../users/deleteWishList");
//                 xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
//                 xhttp.send("id="+id.value+"&productNum="+productNum);

//                 xhttp.onreadystatechange = function(){
//                     if(this.readyState==4 && this.status==200){
                    
//                         console.log(this.responseText)
//                         let result = this.responseText.trim();
//                         if(result=='1'){
//                         console.log("wishlist 삭제 ")
//                         }
//                         else{
//                             console.log('wishlist 삭제 실패')
//                         }
//                     }
//                 }

//             }

//             }
        
//     });