
const fileResult = document.getElementById("fileResult")
const fileAdd=document.getElementById("fileAdd")
const del=document.getElementsByClassName("del")

let count =0;
let num=0; //id용도 

fileAdd.addEventListener("click",function(event){

   

    if(count>9){
        alert('파일 첨부는 최대 10개 까지만 가능합니다. ')
        return;
    }

    count++;

    let div =document.createElement('div')
    div.setAttribute("id","del"+num);


    let file=document.createElement('input') //<input>
    file.setAttribute("type","file") //<input type="file">
    file.setAttribute("name","files") //<input type="file" name="files">

    let button = document.createElement('button');
    button.setAttribute("type","button");
    //class이름 
    button.className="del";
    button.setAttribute("data-num","del"+num)
    button.innerHTML="DEL";

    div.append(file);
    div.append(button);


    fileResult.append(div)
    num++;
   
})

fileResult.addEventListener("click",function(event){
 let cn=  event.target;

 if(cn.classList.contains('del')){
    let delNum = cn.getAttribute("data-num");
    document.getElementById(delNum).remove();
    count--;
 }

})















//------------------
const fileDeleteBtn = document.querySelectorAll(".fileDeleteBtn")
const files =document.querySelector("#files")


files.addEventListener("click",function(event){
    if(event.target.classList.contains("fileDeleteBtn")){

        let check = confirm("삭제시 복구 불가능함 삭제할겨? ")
        if(!check){
            return;
        }
	
        let fileNum = event.target.getAttribute("data-fileNum")
       	console.log(fileNum); //잘나옴 
 
	      let xhttp = new XMLHttpRequest();
	      xhttp.open("POST","./fileDelete");
	      xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded")
	      xhttp.send("fileNum="+fileNum);



    xhttp.onreadystatechange = function(){
        if(this.readyState==4 && this.status==200){
        console.log("ㄹㅇㅁㄹㅇㄴㄹ")
           console.log(this.responseText)
            let result = this.responseText.trim();
            if(result=='1'){
               console.log("file 삭제 ")
               event.target.parentNode.remove();
               console.log(event.target.parentNode)
            }else{
                alert('file 삭제 실패')
            }
        }

    }


   
}
})

