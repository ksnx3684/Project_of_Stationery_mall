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
//                 div.className="detailBox panels";

//                 td.setAttribute("colspan",5);
//                 tr.append(td);

//                 div.innerText=newText;
//                 td.append(div);

//                 console.log(event.target.parentNode.parentNode.nextSibling.nextSibling);
//                 // let panels = event.target.parentNode.parentNode.nextSibling;
//                 event.target.parentNode.parentNode.after(tr);


//                 }
//                 else{
//                     console.log("detail 출력 실패");
//                 }
//         }
//     }
// });

//---------------------------------------

//---------------------------------------------------------
const pagerArea = document.querySelector("#pagerArea");
const qnaResult = document.querySelector("#qna-Result");

getList2();

function getList2() {
    let productNum = inputProductNum.value;
    console.log(productNum);
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../qnas/qnaDetailList?productNum="+productNum);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if(this.readyState == 4 && this.status == 200){ 
            console.log(this.responseText.trim())
            qnaResult.innerHTML = this.responseText.trim();
        }
    }
}

//페이지번호 클릭시
qnaResult.addEventListener("click", function(event) {
    if(event.target.classList.contains("pageNum")) {
        let location= event.target.offsetTop;
        console.log(location);
        let pageNum = event.target.innerText;
        console.log("pageNum = "+pageNum)
        let productNum = inputProductNum.value;
        console.log("pre : "+event.target.getAttribute('data-pre'));
        console.log("productNum = "+productNum);
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","../qnas/qnaDetailList?page="+pageNum+"&productNum="+productNum);
        //send("이름 = 값 & 이름2 = 값2...")
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               qnaResult.innerHTML = this.responseText.trim();
               window.scrollTo({top:location, behavior:'auto'});
        }
    }
    }
    
}); 

qnaResult.addEventListener("click", function(event) {
    
    if(event.target.classList.contains("accordion")) {
        const acc = document.getElementsByClassName("accordion");
        const contents = document.getElementsByClassName("contents");
        /* 	let panels = acc[0].parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
        console.log(panels); */
        
        
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
                // console.log(this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0]); //div 제대로 가르킴
                
                   let panels = this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
                if (panels.style.maxHeight){
                    this.classList.remove("active");
                    panels.style.maxHeight = null;
                } else {
                    panels.style.maxHeight = panels.scrollHeight + "px";
                }  
         
              } 
              
        } 
    }       
});

qnaResult.addEventListener("click",function(event) {
    if(event.target.classList.contains("accordion")) {
    //이벤트 전달

    var modals = document.getElementsByClassName("modal");
    var btns = document.getElementsByClassName("btn");
    var spanes = document.getElementsByClassName("close");
    var funcs = [];
     
    // Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
    function Modal(num) {
        return function() {
        // 클릭하면 Modal 띄우기
        btns[num].onclick =  function() {
            modals[num].style.display = "block";
            console.log(num);
        };

        // <span> 태그(X 버튼)를 클릭하면 Modal 닫힘
        spanes[num].onclick = function() {
            modals[num].style.display = "none";
        };
    };
    }
           
    // Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의
    for(var i = 0; i < btns.length; i++) {
        funcs[i] = Modal(i);
    }
           
     // 원하는 Modal 수만큼 funcs 함수를 호출
    for(var j = 0; j < btns.length; j++) {
        funcs[j]();
    }
           
     //Modal 영역 밖을 클릭하면 Modal 꺼지기
     window.onclick = function(event) {
        if (event.target.className == "modal") {
            event.target.style.display = "none";
            }
        };
    }
});

  

//이전 페이지 클릭시
qnaResult.addEventListener("click", function(event) {
    if(event.target.classList.contains("pre")) {

        console.log("pre click");
        let preNum = event.target.getAttribute('data-pre');
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","../qnas/qnaDetailList?page="+preNum+"&productNum="+productNum);
        //send("이름 = 값 & 이름2 = 값2...")
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               qnaResult.innerHTML = this.responseText.trim();
        }
    }
    }
    
});

//다음 페이지 클릭시
qnaResult.addEventListener("click", function(event) {
    if(event.target.classList.contains("next")) {

        console.log("next click");
        let nextNum = event.target.getAttribute('data-next');
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","../qnas/qnaDetailList?page="+nextNum+"&productNum="+productNum);
        //send("이름 = 값 & 이름2 = 값2...")
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               qnaResult.innerHTML = this.responseText.trim();
        }
    }
    }
    
});

//----------------------------------------------

