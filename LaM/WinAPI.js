//Begin of MCJSRADDL 28.02.2017
function api(command){
  location = command;
}

function hideform(form){
  api(form + ".hide()");
}

function showform(form){
  api(form + ".show()");
}

function settransparent(form, level){
  api(form + ".alphablend(True)");
  api(form + ".alphablendvalue(" + level + ")");
}

function setcaption(form, caption){
  api(form + ".caption(" + caption + ")");
}

function setsize(form, x, y, width, height){
  api(form + ".x(" + x + ")");
  api(form + ".y(" + y + ")");
  api(form + ".width(" + width + ")");
  api(form + ".height(" + height + ")");
}

function settocorner(){
  api(form + ".x(0)");
  api(form + ".y(0)");
}

function closeform(form){
  api(form + ".close(" + form + ");");
}

function showmodalform(form){
  api(form + ".showmodal(" + form + ")");
}

function seticons(form, cross, max, min){
  s = "";
  if (cross){
    s = s + "1";
  } else {
    s = s + "0";
  }

  if (max){
    s = s + "1";
  } else {
    s = s + "0";
  }

  if (min){
    s = s + "1";
  } else {
    s = s + "0";
  }
  api(form + ".icons(" + s + ")");
}

function setborder(form, border){
  api(form + ".border(" + border + ")");
}

//End