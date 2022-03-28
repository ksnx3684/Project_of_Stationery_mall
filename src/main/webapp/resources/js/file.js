
const fileResult = document.getElementById("fileResult")
const fileAdd=document.getElementById("fileAdd")
const del=document.getElementsByClassName("del")

let count =0;
let num=0; //id용도 

fileAdd.addEventListener("click",function(event){

   //fileadd버튼 클릭하면 카운트 +1 되고 
   //<div id="del"+num></>
//<input type="file" name="files">
//<button type= button class=del data-num=del+num>del</>
{/* <div id="del"+num>
        <input type="file" name="files">
        <button type= button class=del data-num=del+num>del</>
    </> */}

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
const fileDeleteBtn_t = document.querySelectorAll(".fileDeleteBtn_t")
const files =document.querySelector("#files")
const fileResult_t = document.getElementById("fileResult_t")
// const hiddenfileNum = document.getElementById("hiddenfileNum")
const tCheck=document.getElementById("tCheck")
tCheck.setAttribute("value","2")

// x클릭하면 그 파일의 파일num 넘어가고 파일 삭제됨 
//근데 썸네일삭제하면 썸네일 다시넣어줘야되는데 
//사진 추가시에 product table에 thumbnail에 Filename넣어줘야됨 
// 근데 썸네일 조건이 <c:when test="${state.first}">이걸로 해놔서
//썸네일 삭제하면 그 다음사진이 썸네일이 됨 
//=> filenum을 기억해서 다시 넣어줘야할듯 





files.addEventListener("click",function(event){
    if(event.target.classList.contains("fileDeleteBtn")){ //x눌렀을시 
        console.log(event.target.classList.contains("hiddenfileNum"))

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

    //Thumbnail
    //썸네일 삭제시 다시 태그 생성 
    if(event.target.classList.contains("fileDeleteBtn_t")){ //x눌렀을시 

        tCheck.setAttribute("value","1")
   

	console.log('대표이미지 삭제 click')
        let check = confirm("삭제시 복구 불가능함 삭제할겨? ")

        if(!check){
            return;
        }
	
        tCheck.setAttribute("value","1")
        console.log("value:"+tCheck.getAttribute("value"))

        let fileNum = event.target.getAttribute("data-fileNum")
 
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
                   console.log('아래')
                   console.log(event.target.parentNode)
	               event.target.parentNode.remove();
	              
	            }else{
	                alert('file 삭제 실패')
	            }
	        }
	    }



    let div =document.createElement('div') //<div id=del+num></div>
    div.setAttribute("id","del"+num);


    let file=document.createElement('input') //<input>
    file.setAttribute("type","file") //<input type="file">
    file.setAttribute("name","files") //<input type="file" name="files">
    file.prepend('썸네일')

    // //<input type="hidden" name="fileNum" value="${f.fileNum}"> 
    // let fileNum=document.createElement('input')
    // fileNum.setAttribute("type","hidden")
    // fileNum.setAttribute("name","fileNum")
    // fileNum.setAttribute("value","${f.fileNum}")

    div.append(file);
    // div.append(fileNum);

    


    fileResult_t.append(div)
    fileResult_t.prepend('대표이미지')

	fileResult_t.addEventListener("click",function(event){
        let cn=  event.target;
   
        if(cn.classList.contains('del')){
           let delNum = cn.getAttribute("data-num");
           document.getElementById(delNum).remove();
        }
   
   })

   //대표이미지 X누르지 않았을시 
    }



    
//---------





})


