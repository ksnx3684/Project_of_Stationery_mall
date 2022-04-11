const notices = document.querySelector("#notices");
const faq = document.querySelector("#faq");

const contentsArea = document.querySelector("#contentsArea");

getList();

function getList() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../notices/list");
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if(this.readyState == 4 && this.status == 200){ 
            console.log(this.responseText.trim())
            contentsArea.innerHTML = this.responseText.trim();
        }
    }
}

notices.addEventListener("click", function() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../notices/list");
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if(this.readyState == 4 && this.status == 200){ 
            console.log(this.responseText.trim())
            contentsArea.innerHTML = this.responseText.trim();
        }
    }
});

contentsArea.addEventListener("click", function(event) {
    if(event.target.classList.contains("boardNum")) {
        let boardNum = event.target.innerText;
        console.log(boardNum);
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "../notices/detail?num="+boardNum);
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               contentsArea.innerHTML = this.responseText.trim();
        }
    }

    }
});

contentsArea.addEventListener("click", function(event) {
    if(event.target.classList.contains("add-board")) {
        const xhttp = new XMLHttpRequest();
        xhttp.open("GET", "../notices/add");
        xhttp.send();

        //응답 처리
        xhttp.onreadystatechange = function() {
           
            if(this.readyState == 4 && this.status == 200) {
               contentsArea.innerHTML = this.responseText.trim();
        }
    }
    }
});

contentsArea.addEventListener("click", function(event) {
    if(event.target.classList.contains("subminBtn")) {
        const xhttp = new XMLHttpRequest();
        xhttp.open("POST", "../notices/add");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        
    }
})

faq.addEventListener("click", function() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "../faq/list");
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if(this.readyState == 4 && this.status == 200){ 
            console.log(this.responseText.trim())
            contentsArea.innerHTML = this.responseText.trim();
        }
    }
});

