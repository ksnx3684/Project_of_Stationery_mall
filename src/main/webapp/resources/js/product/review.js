const reviewResult = document.querySelector("#review-Result");
const inputProductNum = document.querySelector("#productNum");

getList();
function getList() {
    let productNum = inputProductNum.value;
    console.log(productNum);
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../review/reviewDetailList?productNum="+productNum);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if(this.readyState == 4 && this.status == 200){ 
            console.log(this.responseText.trim())
            reviewResult.innerHTML = this.responseText.trim();
        }
    }
}

//아코디언
reviewResult.addEventListener("click", function(event) {
    
    if(event.target.classList.contains("accordion")) {
        const acc = document.getElementsByClassName("accordion");
        const contents = document.getElementsByClassName("contents");
        /* 	let panel = acc[0].parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
        console.log(panel); */
        
        
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
                
                   let panel = this.parentNode.parentNode.nextSibling.nextSibling.children[0].children[0];
                if (panel.style.maxHeight){
                    this.classList.remove("active");
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }  
         
              } 
              
        } 
    }       
});

//이미지 modal
reviewResult.addEventListener("click",function(event) {
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

//페이지번호 클릭시
reviewResult.addEventListener("click", function(event) {
    if(event.target.classList.contains("pageNum")) {
        let location= event.target.offsetTop;
        let pageNum = event.target.innerText;
        console.log("pageNum = "+pageNum)
        let productNum = inputProductNum.value;
        console.log("productNum = "+productNum);
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","../review/reviewDetailList?page="+pageNum+"&productNum="+productNum);
        //send("이름 = 값 & 이름2 = 값2...")
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               reviewResult.innerHTML = this.responseText.trim();
               window.scrollTo({top:location, behavior:'auto'});
        }
    }
    }
    
}); 


//이전 페이지 클릭시
reviewResult.addEventListener("click", function(event) {
    if(event.target.classList.contains("pre")) {

        console.log("pre click");
        let preNum = event.target.getAttribute('data-pre');
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","../review/reviewDetailList?page="+preNum+"&productNum="+productNum);
        //send("이름 = 값 & 이름2 = 값2...")
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               reviewResult.innerHTML = this.responseText.trim();
        }
    }
    }
    
});

//다음 페이지 클릭시
reviewResult.addEventListener("click", function(event) {
    if(event.target.classList.contains("next")) {

        console.log("next click");
        let nextNum = event.target.getAttribute('data-next');
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","../review/reviewDetailList?page="+nextNum+"&productNum="+productNum);
        //send("이름 = 값 & 이름2 = 값2...")
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               reviewResult.innerHTML = this.responseText.trim();
        }
    }
    }
    
});
