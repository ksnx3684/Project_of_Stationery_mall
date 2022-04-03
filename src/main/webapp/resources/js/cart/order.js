const totalPrice = document.getElementsByClassName("totalPrice");
const count = document.querySelectorAll(".count");
const price = document.querySelectorAll(".price");

const total = new Array;
let totaling = 0;

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


const btnCheck = document.querySelector(".mainStreet");
btnCheck.addEventListener("mousemove", function(){
    
    let address = document.querySelector("#address").value;
    let detailAddress = document.querySelector('#detailAddress').value;
    let extraAddress = document.querySelector("#extraAddress").value;

    document.querySelector("#addressDetail2").value = address + detailAddress + extraAddress;
});
