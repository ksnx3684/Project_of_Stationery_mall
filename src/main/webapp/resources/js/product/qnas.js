const qna = document.querySelectorAll(".qna");
const qnaTable = document.querySelector("#qnaTable");
const contents = document.querySelectorAll(".contents");

qnaTable.addEventListener("click", function(event) {
    if(event.target.classList.contains("qna")) {
        console.log("qna click");
        
        let num = event.target.getAttribute("data-num");
       // console.log(num); // 여기까지 확인
        let contents = event.target.parentNode.nextSibling.nextSibling.childNodes[0].value;
       // console.log(contents); 확인
        let newText = contents.replace(/<p>/ig, "\n"); //p 태그 개행으로 바꾸기
        newText = newText.replace(/<\/p>/ig,""); // </p> 태그 제거
        newText = newText.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, ""); //모든 html 태그 제거
        
        console.log(event.target.parentNode.parentNode);

        let xhttp = new XMLHttpRequest();
        xhttp.open("GET", "../qnas/qnaDetail");
        xhttp.send("num="+num.value);

        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                    console.log("detail 출력");
                    let tr = document.createElement('tr');
                    let td = document.createElement('td');
                   // let br = document.createElement('br');
                    let div= document.createElement('div');
                    div.className="detailBox";
                   
                    td.setAttribute("colspan",5);
                    tr.append(td);
                
                    div.innerText=newText;
                    td.append(div);
                    
                    event.target.parentNode.parentNode.after(tr);
       
                }
                else{
                    console.log("detail 출력 실패");
                }
        }
    }
});

//---------------------------------------


