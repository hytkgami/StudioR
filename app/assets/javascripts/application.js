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
  var cnt = 0;
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
  // すべて開くボタン
  var message = ['すべて開く', 'すべて閉じる'];
  $('.open').click(function(){
    cnt = (cnt + 1) % 2;
    if (cnt == 0) {
      $('.row').stop(true, true).slideUp();
    } else {
      $('.row').stop(true, true).slideDown();
    }
    $(this).html(message[cnt]);
  });
  // タイムテーブルを埋める処理
  console.log(gon.reserved_table);
  var tmp, cells;
  for(var i=0; i<4; i++) {
    tmp = $('tr#room'+i);
    console.log(tmp);
    cells = $('tr#room'+(i+1)+' td:first-child').next();
    console.log(cells);
    for(var j=0; j<24; j++) {
      if (gon.reserved_table[i][j] == 1) {
        cells.removeClass("blue");
        cells.addClass("red");
      }
      cells = cells.next();
    }
  }
});

