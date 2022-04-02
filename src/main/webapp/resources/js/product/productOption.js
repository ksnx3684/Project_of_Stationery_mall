const optionAdd_btn = document.getElementById("optionAdd_btn")
const optionResult = document.getElementById("optionResult")
const oriOption= document.getElementById("oriOption")
const optionDeleteBtn=document.getElementById("optionDeleteBtn")
const options = document.getElementById("options")
const getProductNum= document.getElementById("getProductNum")
const stockForm = document.getElementById("stockForm")

let count1 =0;
let num1=0; 
let productNum=getProductNum.value;

console.log(getProductNum.value);



options.addEventListener("click",function(event){
    if(event.target.classList.contains("optionDeleteBtn")){
        let check = confirm("삭제시 복구 불가능함 삭제할겨? ")
        if(!check){
            return;
        }

        let optionNum = event.target.getAttribute("data-fileNum")
     

        let xhttp = new XMLHttpRequest();
	    xhttp.open("POST","./optionDelete");
	    xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
	    xhttp.send("optionNum="+optionNum+"&productNum="+productNum);

        xhttp.onreadystatechange = function(){
	        if(this.readyState==4 && this.status==200){
	            let result = this.responseText.trim();
	        	if(result=='1'){
	               console.log("기존 옵션 삭제 ")
	               event.target.parentNode.remove();
	            }else{
	                alert('기존옵션 삭제 실패')
	            }
	        }
	    }
    }

})

//옵션추가 버튼 클릭시 
optionAdd_btn.addEventListener("click",function(){

stockForm.setAttribute("readonly","true");

//기존의 옵션이 없는 경우 
if(oriOption==null){
    if(count1>4){
        alert('옵션은 최대 5개 까지만 가능합니다. ')
        return;
    }
 //기존 옵션이 있는 경우    
}else {
    if(count1+oriOption.getElementsByTagName('li').length>4){
        alert('옵션은 최대 5개 까지만 가능합니다. ')
        return;
    }
    
}



    count1++;

    let div =document.createElement('div')
    div.setAttribute("id","optiondel"+num1);

    let color=document.createElement('input') 
    color.setAttribute("type","text") 
    color.setAttribute("name","options") 
    color.setAttribute("placeholder","ex) 빨강")


    let stock=document.createElement('input')
    stock.setAttribute("type","text") 
    stock.setAttribute("name","options") 
    stock.setAttribute("placeholder","ex) 10")
    stock.setAttribute("id","stock"+num1)


    let button = document.createElement('button');
    button.setAttribute("type","button");
    button.className="optiondel";
    button.setAttribute("data-num","optiondel"+num1)
    button.innerHTML="DEL";

    div.append('색상')
    div.append(color);
    div.append('재고')
    div.append(stock)
    div.append(button)

    optionResult.append(div)
    num1++;
})


// 추가된 태그 삭제 
optionResult.addEventListener("click",function(event){
    let cn=  event.target;

    if(cn.classList.contains('optiondel')){
       let delNum = cn.getAttribute("data-num");
       document.getElementById(delNum).remove();
       count1--;
    }
  

})



// optionResult.addEventListener("keyup",function(event){
//     console.log("key up")

//   let stocks= event.target.contains('stock1').value
//    console.log(stocks)
// })


