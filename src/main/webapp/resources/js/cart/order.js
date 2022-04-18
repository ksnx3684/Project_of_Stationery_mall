const totalPrice = document.getElementsByClassName("totalPrice");
const deliver = document.getElementsByClassName("deliver");
const count = document.querySelectorAll(".count");
const price = document.querySelectorAll(".price");
const law = document.getElementById("law");
let finalPay = document.getElementById("finalPay");

const total = new Array;
let totaling = 0;
const frm = document.getElementById("frm");

window.onload = function(){
    for(let i = 0; i < count.length; i++){
        // console.log("test");
        let counting = Number(count[i].textContent);
        let pricing = Number(price[i].textContent);
        total[i] = counting * pricing
        // console.log(counting);
        // console.log(pricing);
        // console.log("-----")
        // console.log(total[i]);

        totaling += total[i];
        // console.log(totaling);
    }
    if(totaling < 30000){
        totaling += 2500;
        const fee = document.createTextNode(" 2500 원");
        deliver[0].appendChild(fee);
    } else{
        const fee = document.createTextNode("Free");
        deliver[0].appendChild(fee);
    }
    
    const newText1 = document.createTextNode(totaling);
    const newText2 = document.createElement('input');
    newText2.setAttribute("type","hidden");
    newText2.setAttribute("name", "totalPrice");
    newText2.setAttribute("id", "totalPrice");
    newText2.setAttribute("value", totaling);
    totalPrice[0].appendChild(newText1);
    totalPrice[0].appendChild(newText2);
}

    


// window.addEventListener("load", function(){
//     for(let i = 0; i < count.length; i++){
//         counting = count[i].textContent;
//         pricing = price[i].textContent;

//         total[0] = counting + pricing;
//     }
//     console.log(total[0]);
//     // totalPrice.textContent(total);
// });


const btnCheck = document.querySelector(".main-content-wrapper");
btnCheck.addEventListener("mousemove", function(){
    
    let address = document.querySelector("#address").value;
    let detailAddress = document.querySelector('#detailAddress').value;
    let extraAddress = document.querySelector("#extraAddress").value;

    document.querySelector("#addressDetail2").value = address + detailAddress + extraAddress;
});

const kakaoPay = document.getElementById("kakaoPay");
const naverPay = document.getElementById("naverPay");
const cashPay = document.getElementById("cashPay");
kakaoPay.addEventListener("click", function(){
    frm.submit();
});
naverPay.addEventListener("click", function(){
    frm.submit();
});
cashPay.addEventListener("click", function(){
    frm.submit();
});