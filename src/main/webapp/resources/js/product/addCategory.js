const subCategory_btn=document.getElementById("subCategory_btn")
const subcategoryResult=document.getElementById("subcategoryResult")
const categoryDeleteBtn = document.querySelectorAll(".categoryDeleteBtn")
const categoryList=document.getElementById("categoryList")

let count=0;
let num=0;

//하위카테고리 추가 
subCategory_btn.addEventListener("click",function(event){
    console.log("click")

    if(count>7){
        alert('하위 카테고리는 최대 9개 까지만 가능합니다. ')
        return;
    }

    count++;

    let div =document.createElement('div')
    div.setAttribute("id","del"+num);


    let subcategory=document.createElement('input') 
    subcategory.setAttribute("type","text") 
    subcategory.setAttribute("name","categoryName") 

    let button = document.createElement('button');
    button.setAttribute("type","button");
    button.className="del";
    button.setAttribute("data-num","del"+num)
    button.innerHTML="DEL";

    div.append("카테고리 이름")
    div.append(subcategory);
    div.append(button);


    subcategoryResult.append(div)
    num++;
})
//하위카테고리 추가버튼 삭제 
subcategoryResult.addEventListener("click",function(event){
    let cn=  event.target;
console.log("del click")
    if(cn.classList.contains('del')){
       let delNum = cn.getAttribute("data-num");
       document.getElementById(delNum).remove();
       count--;
    }

})

//카테고리 삭제
categoryList.addEventListener("click",function(event){
    if(event.target.classList.contains("categoryDeleteBtn")){
        let check = confirm("삭제시 복구 불가능합니다 삭제하시겠습니까? ")
        if(!check){
            return;
        }
    }
    console.log(event.target.getAttribute("data-num"))
    let cateNum = event.target.getAttribute("data-num")
    
    
    
    let xhttp = new XMLHttpRequest();
    xhttp.open("POST","./delete");
    xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
    xhttp.send("categoryNum="+cateNum);
    
    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
            
            console.log(this.responseText)
            let result = this.responseText.trim();
            if(result=='1'){
                console.log("삭제")
                console.log(event.target.parentNode)
                //event.target.parentNode.remove();
                
                if (!event.target.classList.contains("del")){
                    let cateNum1=document.querySelectorAll(".cate"+cateNum)
                    console.log(cateNum)
      
                    for(c of cateNum1){
                        c.remove();
                    }
                }else{
                    console.log("자식 클릭")
                    event.target.parentNode.remove();
                }
             
            }else{
                alert('삭제 실패')
            }
        }
    }

})
