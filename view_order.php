<?php
	session_start();
    
   
define('myyshop', true);
    
    if (isset($_GET["logout"]))
    {
        unset($_SESSION["auth_admin"]);
        header("Location: login.php");
    }
    
    $_SESSION['urlpage'] = "<a href='index.php'>Главная</a> \ <a href='view_order.php'>Просмотр заказов</a>";
    
    include("include/db_connect.php");
    include("include/functions.php"); 
    
    $id = clear_string($_GET["id"]);
    $action = $_GET["action"];
  if (isset($action))
{
   switch ($action) {

	    case 'accept':
        
        if($_SESSION['accept_orders'] == '1')
        {
            $update = mysql_query("UPDATE orders SET order_confirmed='accept' WHERE order_id = '$id'",$link);
        }else
        {
            $msgerror = 'У вас нет прав на подтверждение заказов';
        }   
              
     	 break;
        
        case 'reject':        
        
        if($_SESSION['delete_orders'] == '1')
        {
           $delete = mysql_query("UPDATE orders SET order_confirmed='reject' WHERE order_id = '$id'",$link);
        }
        else{
             $msgerror = 'У вас нет прав на отмену заказов';
        }
        
        break;
        
        case 'delivery':
       
           $delivery = mysql_query("UPDATE orders SET order_confirmed='delivery' WHERE order_id = '$id'",$link);      
         
	    break;        
	
         case 'close':
       
           $close = mysql_query("UPDATE orders SET order_confirmed='close' WHERE order_id = '$id'",$link);      
         
	    break;  
    }     
    
}    
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style3.css" rel="stylesheet" type="text/css" />
    <link href="jquery_confirm/jquery_confirm.css" rel="stylesheet" type="text/css" />      
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script> 
    <script type="text/javascript" src="js/script.js"></script> 
    <script type="text/javascript" src="jquery_confirm/jquery_confirm.js"></script> 

	<title>Панель управления - Просмотр заказов</title>
</head>

<body>

<div id="block-body">
<?php
//	include("include/block-header.php");     
?>
<div id="block-content">

<div id="block-parameters">
<p id="title-page">Просмотр заказа</p>
</div>

<?php

if(isset($msgerror)) echo '<p id="form-error" align="center">'.$msgerror.'</p>';

    $result = mysql_query("SELECT * FROM orders WHERE order_id = '$id'",$link);
 
 If (mysql_num_rows($result) > 0)
{
$row = mysql_fetch_array($result);
do
{
if ($row["order_confirmed"] == 'accept')
{
    $status = '<span class="orange"> В процессе сборки</span>';
} 
else if ($row["order_confirmed"] == 'reject')
{
    $status = '<span class="red">Отклонен</span>';
}
else if ($row["order_confirmed"] == 'delivery')
{
    $status = '<span class="purple">Доставляется</span>';
}
else if ($row["order_confirmed"] == 'close')
{
    $status = '<span class="green">Закрыт</span>';
}
else
{
    $status = '<span class="silver">Не обработан</span>';    
}

 echo '

  <p class="order-datetime" >'.$row["order_datetime"].'</p>
  <p class="order-number" >Заказ № '.$row["order_id"].' - '.$status.'</p>

<TABLE align="center" CELLPADDING="10" WIDTH="100%">
<TR>
<TH>№</TH>
<TH>Наименование товара</TH>
<TH>Цена (за 1 единицу)</TH>
<TH>Количество</TH>
</TR>
';
$query_product = mysql_query("SELECT * FROM buy_products,table_products WHERE buy_products.buy_id_order = '$id' AND table_products.products_id = buy_products.buy_id_product",$link);
 
$result_query = mysql_fetch_array($query_product);
do
{
$price = $price + ($result_query["price"] * $result_query["buy_count_product"]);    
$index_count =  $index_count + 1; 
echo '
 <TR>
<TD  align="CENTER" >'.$index_count.'</TD>
<TD  align="CENTER" >'.$result_query["title"].'</TD>
<TD  align="CENTER" >'.$result_query["price"].' грн</TD>
<TD  align="CENTER" >'.$result_query["buy_count_product"].'</TD>
</TR>

';
} while ($result_query = mysql_fetch_array($query_product));


if  ($row["order_confirmed"] == 'close')
{
    $statpay = '<span class="green">Оплачено</span>';
}else
{
    $statpay = '<span class="red">Не оплачено</span>';
}
//<li>Дата оплаты - <span>'.$row["order_datetime"].'</span></li>
echo '
</TABLE>
<ul id="info-order">
<li>Общая цена - <span>'.$price.'</span> грн</li>
<li>Способ доставки - <span>'.$row["order_dostavka"].'</span></li>
<li>Статус оплаты - '.$statpay.'</li>
<li> <span>'.$row["order_type_pay"].'</span></li>

</ul>


<TABLE align="center" CELLPADDING="10" WIDTH="100%">
<TR>
<TH>ФИО</TH>
<TH>Адрес</TH>
<TH>Контакты</TH>
<TH>Примечание</TH>
</TR>

 <TR>
<TD  align="CENTER" >'.$row["order_fio"].'</TD>
<TD  align="CENTER" >'.$row["order_address"].'</TD>
<TD  align="CENTER" >'.$row["order_phone"].'</br>'.$row["order_email"].'</TD>
<TD  align="CENTER" >'.$row["order_note"].'</TD>
</TR>
</TABLE>

<p id="href"><a id="btn" href="my_orders.php">Назад</a></p>  
 ';   
    
} while ($row = mysql_fetch_array($result));
}


?>

</div>
</div>
</body>
</html>
<script type="text/javascript">
<!--
	function hide(){
	   document.getElementById("green").style.display = "none";
	}
-->
</script>
<?php

?>