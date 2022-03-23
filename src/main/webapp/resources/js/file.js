const fileResult = document.getElementById("fileResult");
const fileAdd = document.getElementById("fileAdd");
const del = document.getElementsByClassName("del");

let count = 0;
let num = 0; //id 용도

fileAdd.addEventListener("click", function() {


    if(count > 4) {
        alert("첨부파일은 최대 5개까지만 가능합니다.");
        return ;
    }

    count++;

    // count++;
    // if(count>5) {
    //     alert("첨부파일은 최대 5개까지만 가능합니다.");
    //     count--;
    //     return ;
    // }

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