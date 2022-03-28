let order = document.querySelectorAll("#order");
let pay = document.querySelectorAll("#pay");


function convert(){
    for(let i = 0; i < order.length; i++){
        if(order[i].value == 0){
            order[i].append("결제대기중");
        } else if(order[i].value == 1){
            order[i].append("상품준비중");
        } else if(order[i].value == 2){
            order[i].append("배송중");
        } else{
            order[i].append("배송완료");
        }
    }
    for(let i = 0; i < pay.length; i++){
        if(pay[i].value == 0){
            pay[i].append("미결제");
        } else {
            pay[i].append("결제완료");
        }
    }
}

convert();