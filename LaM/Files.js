//Begin of MCJSRADDL 28.02.2017
function NoLinessavetofile(form, sub, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  api(form + ".savetofile(" + s + "," + sub + ")");
}
function savetofile(form, sub, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  arr = sub.split("\n");
  api(form + ".savetofile(" + s + ",)");
  for (i = 0; i <= arr.length; i++){
	  api(form + ".addtofile(" + path + ",1" + arr[i] + ")");
  }
  //api(form + ".savetofile(" + s + "," + sub + ")");
}

function openfromfile(form, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  text = "";
  api(form + ".openfromfile(" +  s + ")");
  return text;                            
}

function push(form, a){
  savetofile(form, a, getpath(form) + '~');
}

function pop(form){
  s =  openfromfile(form, getpath(form) + '~');
  return (s).substr(0, s.length-2);
}

function deletefile(form, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  api(form + ".deletefile(" + s + ")");
}

function fileexists(form, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  result = false;
  api(form + ".fileexists(" + s + ")");
  return result;
}

function createfile(form, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  api(form + ".createfile(" + s + ")")
}

function addtofile(form, sub, path){
  s = path;
  s = path.replace(new RegExp("\ ".charAt(0), 'g'), "^");
  s = s.replace(new RegExp("/ ".charAt(0), 'g'), "^");
  api(form + ".addtofile(" + path + ")");
}

function getpath(form){
  result = "";
  api(form + ".getpath()");
  return result;
}
//End