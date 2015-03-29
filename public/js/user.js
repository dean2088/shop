var xmlRequest
function createRequest() {
   if(window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
   } else if(window.XMLHttpRequest) {
         return new XMLHttpRequest();   
   }
}

function responseHander() {
   if(xmlRequest.readyState == 4 && xmlRequest.status==200) {
       var msg = xmlRequest.responseText;
       alert(msg);
    }
}
function ajaxTest() {
    
    xmlRequest = createRequest();
    xmlRequest.onreadystatechange=responseHander;
    var uname = document.getElementById("uname").value;
    xmlRequest.open("GET","http://localhost:3000/users/checkname?uname="+uname);
    //控制器users的checkname方法
    xmlRequest.send(null);
}

function t_test() {
   ajaxTest();
}