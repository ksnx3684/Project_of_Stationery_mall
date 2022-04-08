let check = document.querySelectorAll(".check");
let total = new Array();
let count = document.querySelectorAll(".count");
let price = document.querySelectorAll(".price");
let totalPrice = document.querySelectorAll(".totalPrice");
let cc = 0;
let dd = 0;

let option = document.querySelectorAll(".option");

for(let i = 0; i < count.length; i++){
    check[i].addEventListener("click", function(){
        if(check[i].checked){
            console.log("click");
            // count[i] = count[i].innerHTML;
            // price[i] = price.innerText;
            let a = count[i].textContent;
            let b = price[i].textContent;
            const aa = Number(a);
            const bb = Number(b);
            total[i] = aa * bb;
            // console.log(count[i].innerHTML);
            console.log(total[i]);
            
            function sum(){
                // const newSpan = document.createElement('span');
                cc = total[i] + cc;
                const newText = document.createTextNode(cc); // newText에 cc값 담기
            
                totalPrice[0].textContent = ''; // 초기화
                totalPrice[0].appendChild(newText); // newText 출력
            
                // totalPrice[0].after(newSpan);

                // cc = Number(newText); // total에 newText값 담기

                
            };
            // function sum2(){
            //     const newText2 = document.createTextNode(cc);
                
            // }

            sum();
            // sum2();
            
            // totalPrice = total.textContent;
            // console.log(totalPrice);
 
            option[i].disabled = false;

        } else{
            function sum2(){
                console.log("unclick");
                // const newSpan = document.createElement('span');
                cc = cc - total[i];
                console.log(cc);
                const newText2 = document.createTextNode(cc);
                totalPrice[0].textContent = ''; // 초기화
                totalPrice[0].appendChild(newText2);
            }
            sum2();

            option[i].disabled = true;
        }
    })
};




