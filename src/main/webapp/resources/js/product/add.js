const btn = document.getElementById('btn');
const name1= document.getElementById('Field1')
const contents = document.getElementById('Field2')
const price= document.getElementById('Field3')
const stock= document.getElementById('stockForm')
const thumbnail=document.getElementById('thumbnail')
const frm=document.getElementById('frm')
const optionResult1=document.getElementById('optionResult')

btn.addEventListener("click", function(){
    console.log(optionResult.innerHTML)
    
    if(name1.value==""){
        alert("이름을 입력해주세요");
        name1.focus();
        return;
    }
    if(contents.value==""){
        alert("설명을 입력해주세요");
        contents.focus();
        return;
    }
    if(price.value==""){
        alert("가격을 입력해주세요");
        price.focus();
        return;
    }
    //옵션없는 상품 총 재고 입력안했을 경우 
    if(optionResult.innerHTML=="" &&stock.value==""){
        alert("재고를 입력해주세요");
        stock.focus();
        return;
    }
    if(thumbnail.value==""){
        alert("썸네일 사진은 필수입니다.");
        thumbnail.focus();
        return;
    }
    frm.submit();
    alert("상품이 추가되었습니다.");
});