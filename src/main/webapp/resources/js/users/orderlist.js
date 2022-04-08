let order = document.querySelectorAll("#order");
let pay = document.querySelectorAll("#pay");
let orderval = document.querySelectorAll(".orderval");
let payval = document.querySelectorAll(".payval");
// let ordercheck = new Array();

// for(let i = 0; i < order.length; i++){
//     ordercheck[i] = document.getElementsByClassName("order").value;
//     console.log(ordercheck[i]);
// }



function convert(){
    for(let i = 0; i < order.length; i++){
        if(order[i].value == 0){
            orderval[i].append("결제대기중");
        } else if(order[i].value == 1){
            orderval[i].append("상품준비중");
        } else if(order[i].value == 2){
            orderval[i].append("배송중");
        } else{
            orderval[i].append("배송완료");
        }
    }
    for(let i = 0; i < pay.length; i++){
        if(pay[i].value == 0){
            payval[i].append("미결제");
        } else {
            payval[i].append("결제완료");
        }
    }
}

convert();