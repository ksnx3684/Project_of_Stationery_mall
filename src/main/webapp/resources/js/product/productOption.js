const optionAdd_btn = document.getElementById("optionAdd_btn")
const optionResult = document.getElementById("optionResult")


let count1 =0;
let num1=0; 

optionAdd_btn.addEventListener("click",function(){

    if(count1>4){
        alert('옵션은 최대 5개 까지만 가능합니다. ')
        return;
    }

    count1++;

    let div =document.createElement('div')
    div.setAttribute("id","optiondel"+num1);

    let color=document.createElement('input') 
    color.setAttribute("type","text") 
    color.setAttribute("name","optionContents") 
    color.setAttribute("placeholder","ex) red")


    let stock=document.createElement('input')
    stock.setAttribute("type","text") 
    stock.setAttribute("name","optionStock") 
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



optionResult.addEventListener("click",function(event){
    let cn=  event.target;

    if(cn.classList.contains('optiondel')){
       let delNum = cn.getAttribute("data-num");
       document.getElementById(delNum).remove();
       count--;
    }
  

})

// optionResult.addEventListener("keyup",function(event){
//     console.log("key up")

//   let stocks= event.target.contains('stock1').value
//    console.log(stocks)
// })


