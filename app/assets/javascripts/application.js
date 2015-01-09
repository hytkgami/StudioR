// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

var timer = new Array(13);
var time  = new Array(13);

$(document).ready(function(){
  // マウスオーバーで表示,アウトで非表示
  $('span#list1').hover(
    // hover then
    function() {
      $('#detail1').css("display", "inline");
    },
    // out then
    function() {
      $('#detail1').css("display", "none");
    }
  );

  $('span#list2').hover(
    // hover then
    function() {
      $('#detail2').css("display", "inline");
    },
    // out then
    function() {
      $('#detail2').css("display", "none");
    }
  );
  $('span#list3').hover(
    // hover then
    function() {
      $('#detail3').css("display", "inline");
    },
    // out then
    function() {
      $('#detail3').css("display", "none");
    }
  );
  $('span#list4').hover(
    // hover then
    function() {
      $('#detail4').css("display", "inline");
    },
    // out then
    function() {
      $('#detail4').css("display", "none");
    }
  );
  // クリックで開閉
  $('.head').click(function(){
    $(this).next('.row').stop(true, true).slideToggle();
  });
});

window.onload = function(){
  for(var i = 1; i < timer.length; i++ ){
    timer[i] = document.getElementById("timer" + i).innerHTML;
    time[i] = i + "時"
  }
  addfrom();
  console.log(time);
}



function addfrom(){
  from = document.getElementById("booking_from")
  for(var i = 1; i < timer.length; i++ ){
    if(timer[i] == 0){
      var option = document.createElement('option');
      option.innerHTML = time[i];
      option.setAttribute("value", i)
      from.appendChild(option); 
    }
  }
}

function addTo(){
  fromTime = parseInt(from[from.selectedIndex].value)
  to = document.getElementById("booking_to")
  to.length = 0;
  for(var i = fromTime; i <= time.length; i++ ){
    if(timer[i] == 1){
      break;
    }
    else{
      console.log(i)
      var option = document.createElement('option');
      option.innerHTML = time[i+1];
      option.setAttribute("value", i+1)
      to.appendChild(option)
    }
  }
}

