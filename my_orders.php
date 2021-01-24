<?php session_start(); ?>
<?php
define('myyshop', true); 
    
    include("include/db_connect.php");
    include("include/functions.php"); 
            
    $id = clear_string($_GET["id"]);
   
  
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
      <link href="css/style3.css" rel="stylesheet" type="text/css" />    
    <link href="jquery_confirm/jquery_confirm.css" rel="stylesheet" type="text/css" />      
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script> 
    <script type="text/javascript" src="js/script.js"></script> 
    <script type="text/javascript" src="jquery_confirm/jquery_confirm.js"></script> 

	<title>Панель управления - Заказы</title>
</head>

<body>
<?php
	    
  $login = $_SESSION["session_username"];
         
			if(isset($_SESSION["session_username"]))
    {
        
?>
<div id="block-body">
<div id="block-head">
<?php
	
echo '<h1 id="order_label">Все заказы клиента по имени '.$_SESSION['auth_name'].'.</h1>';

?>
</div>
<?php             
    $all_count = mysql_query("SELECT * FROM orders",$link); 
    $all_count_result = mysql_num_rows($all_count);
    
    $buy_count = mysql_query("SELECT * FROM orders WHERE order_confirmed = 'close'",$link); 
    $buy_count_result = mysql_num_rows($buy_count);
    
    $no_buy_count = mysql_query("SELECT * FROM orders WHERE order_confirmed = 'reject'",$link); 
    $no_buy_count_result = mysql_num_rows($no_buy_count);
 
    $gen_orders_proc = mysql_query("SELECT * FROM orders WHERE order_confirmed = 'accept' OR order_confirmed = 'delivery'",$link); 
    $gen_orders_proc_result = mysql_num_rows($gen_orders_proc);
    
    $forgetted_result= $all_count_result - $buy_count_result - $no_buy_count_result - $gen_orders_proc_result;
?>
<div id="block-content">



<?php   
// $fio_user = mysql_query("select * from orders where order_email = ' $login'",$link);
//print_r($_SESSION);
$ses=$_SESSION['auth_login'];
	$result = mysql_query("SELECT * FROM orders WHERE define_session='$ses'",$link);
    
    if(mysql_num_rows($result) > 0)
    {
        $row = mysql_fetch_array($result);
        do
        {
            if($row["order_confirmed"] == 'accept')
            {
                $status = '<span class="orange"> В процессе сборки</span>';
            } 
            else if ($row["order_confirmed"] == 'reject'){
                 $status = '<span class="red">Отклонен</span>';
            }
            else if ($row["order_confirmed"] == 'delivery'){
                 $status = '<span class="purple">Доставляется</span>';
            }
            else if ($row["order_confirmed"] == 'close'){
                 $status = '<span class="green">Закрыт</span>';
            }
            else
            {
                $status = '<span class="silver">Не обработан</span>';
            }
            
            echo '
            <div class="block-order">
            
            <p class="order-datetime" >'.$row["order_datetime"].'</p>
            <p class="order-number">Заказ № '.$row["order_id"].' - '.$status.'</p>
            <p class="order-link"><a class="green" href="view_order.php?id='.$row["order_id"].'">Подробнее</a></p>
            </div>  
                    
            ';
        } while ($row = mysql_fetch_array($result));
    }
    else{
        echo'<h1 class="no_orders" style="text-align: center;">Нет заказов!</h1>';
    }
?>
<p id="href"><a id="btn" href="index.php">На главную</a></p>  

</div>

</div>

</body>
</html>

<?php
}
else{
    header("Location: index.php");    
}
?>