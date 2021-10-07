<?php
header("Content-type: text/css");
$body_bg = "red";
$box_bg = "blue";
$top = "200";
?>

body{
background-color: red;
}

#box{
position: absolute;
background-color: red;
background-color: <?php echo 'blue'?>;
border-radius: 15px;
top: <?php echo $top;>;
width: 400px;
height: 300px;
left: 60px;
line-height: 18px;
padding-left: 15px;
padding-right: 12px;
}
