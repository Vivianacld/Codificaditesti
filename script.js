$(document).ready(function () {
  $("#btn-add").click(function () {
    $("add").css("display", "inline");
  });

  $("#btn-del").click(function () {
    $("del").css("display", "inline");
  });

  $("#btn-gap").click(function () {
    $("gap").css("display", "inline");
  });

  $("#btn-hide").click(function () {
    $("add, del, gap").hide();
  });
});
