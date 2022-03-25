const order = document.getElementById("order");
const pay = document.getElementById("pay");

convert();

function convert(){
    if(order.value == 0){
        order.append("결제대기중");
    } else if(order.value == 1){
        order.append("상품준비중");
    } else if(order.value == 2){
        order.append("배송중");
    } else{
        order.append("배송완료");
    }

    if(pay.value == 0){
        pay.append("미결제");
    } else {
        pay.append("결제완료");
    }
}