// const qna = document.querySelectorAll(".qna");
// const qnaTable = document.querySelector("#qnaTable");
// const contents = document.querySelectorAll(".contents");

// qnaTable.addEventListener("click", function(event) {
//     if(event.target.classList.contains("qna")) {
//         console.log("qna click");

//         let num = event.target.getAttribute("data-num");
//        // console.log(num); // 여기까지 확인
//         let contents = event.target.parentNode.nextSibling.nextSibling.childNodes[0].value;
//        // console.log(contents); 확인
//         let newText = contents.replace(/<p>/ig, "\n"); //p 태그 개행으로 바꾸기
//         newText = newText.replace(/<\/p>/ig,""); // </p> 태그 제거
//         newText = newText.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, ""); //모든 html 태그 제거

//         event.target.classList.toggle("active");

//         let xhttp = new XMLHttpRequest();
//         xhttp.open("GET", "../qnas/qnaDetail");
//         xhttp.send("num="+num.value);


//         xhttp.onreadystatechange = function() {
//             if(this.readyState == 4 && this.status == 200) {
//                 console.log("detail 출력");
//                 let tr = document.createElement('tr');
//                 let td = document.createElement('td');
//                 // let br = document.createElement('br');
//                 let div= document.createElement('div');
//                 div.className="detailBox panel";

//                 td.setAttribute("colspan",5);
//                 tr.append(td);

//                 div.innerText=newText;
//                 td.append(div);

//                 console.log(event.target.parentNode.parentNode.nextSibling.nextSibling);
//                 // let panel = event.target.parentNode.parentNode.nextSibling;
//                 event.target.parentNode.parentNode.after(tr);


//                 }
//                 else{
//                     console.log("detail 출력 실패");
//                 }
//         }
//     }
// });

//---------------------------------------

const acc = document.getElementsByClassName("accordion");
const contents = document.getElementsByClassName("contents");
/* 	let panel = acc[0].parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
console.log(panel); */

 for(con of contents) {
     //con.innerHtml = con.innerText.replace(/.$/, '');
    //마지막 글자 공백으로 변경..근데 왜 안돼
 }

  for (let i = 0; i < acc.length; i++) {
      acc[i].onclick = function(event) {	 
         // 클릭이 일어났을 때 기존에 열려 있던 아코디언을 접는다. (1개의 아코디언만 열리게)
         for (let j = 0 ; j<acc.length; j++){
            // 버튼 상태에 입혀진 active 라는 클래스를 지운다.
             acc[j].classList.remove("active");
            // 버튼 다음에 있는 div 콘텐츠 높이를 0으로 만든다. == 아코디언을 접는다.
             if (this!==acc[j]) {
                 acc[j].parentNode.parentNode.nextSibling.nextSibling.children[0].children[0].style.maxHeight = null;
             }
         }

         this.classList.toggle("active");
         console.log(this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0]); //div 제대로 가르킴
        
           let panel = this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
        if (panel.style.maxHeight){
            this.classList.remove("active");
            panel.style.maxHeight = null;
        } else {
            panel.style.maxHeight = panel.scrollHeight + "px";
        }  
 
      } 
      
}  

//---------------------------------------------------------
// const pagerArea = document.querySelector("#pagerArea");
// const pre = '${pager.startNum-1}';
// const i = '${i}';
// const kind = '${pager.kind}';
// const search = '${pager.search}';
// const next = '${pager.lastNum+1}';
// const productNum = '${dto.productNum}';

// pagerArea.addEventListener("click", function(event) {
//     if(event.target.classList.contains("pageNum")) {

//         console.log("pageNum click");
//         const xhttp = new XMLHttpRequest();
//         xhttp.open("GET","../qnas/list?page="+i+"&kind="+kind+"&search="+search+"&productNum="+productNum);
//         //send("이름 = 값 & 이름2 = 값2...")
//         xhttp.send();

//         //응답 처리
//         xhttp.onreadystatechange = function() {
//             if(this.readyState == 4 && this.status == 200) {
//                 let result = this.responseText.trim();
//                 if(result=='1') {
//                     console.log("성공");
//                 }
//                 else{
//                     console.log("실패");
//                 }
//         }
//     }
//     }
    
// })
