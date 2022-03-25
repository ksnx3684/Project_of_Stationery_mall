const fileResult = document.getElementById("fileResult");
const fileAdd = document.getElementById("fileAdd");
const del = document.getElementsByClassName("del");
const fileDeleteBtn = document.querySelectorAll(".fileDeleteBtn");
const files = document.querySelector("#files");

let count = 0;
let num = 0; //id 용도

count = files.getElementsByClassName("fileDeleteBtn").length;
fileAdd.addEventListener("click", function() {
    if(count > 4) {
        alert("첨부파일은 최대 5개까지만 가능합니다.");
        return ;
    }

    count++;

    let div = document.createElement("div");
    div.setAttribute("id", "del"+num);

    let file = document.createElement("input"); 
    file.setAttribute("type", "file"); 
    file.setAttribute("name", "files");

    let button = document.createElement("button");
    button.setAttribute("type", "button");
    button.className="del";
    button.setAttribute("data-num", "del"+num)
    button.innerHTML="DEL";

    div.append(file);
    div.append(button);

    fileResult.append(div);

    num++;
})

fileResult.addEventListener("click",function(event) {
    let cn = event.target;

    if(cn.classList.contains('del')) {
        let delNum = cn.getAttribute("data-num");
        document.getElementById(delNum).remove();
        count--;
    }
})

//-------------------------------------------------------



files.addEventListener("click", function(event) {
    if(event.target.classList.contains("fileDeleteBtn")) {
        let check = confirm("삭제시 복구 불가능합니다. 삭제하시겠습니까?");
        if(!check) {
            return ;
        }
        let fileNum = event.target.getAttribute("data-fileNum");

        let xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../notices/fileDelete");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("fileNum="+fileNum);

        xhttp.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200) {
                if(this.responseText.trim()=='1') {
                    console.log("file 삭제");
                    event.target.parentNode.remove();          
                }else{
                    console.log("file 삭제 실패");
                }
            }
        }
    }
});
