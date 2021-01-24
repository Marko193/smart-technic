<?php
	session_start();
    if ($_SESSION['auth_admin'] == "yes_auth")
    {
define('myyshop', true);
    if (isset($_GET["logout"]))
    {
        unset($_SESSION["auth_admin"]);
        header("Location: login.php");
    }
    $_SESSION['urlpage'] = "<a href='index.php'>Главная</a> \ <a href='orders.php'>Заказы</a>";
    include("include/db_connect.php");
    include("include/functions.php"); 
    
    $id = clear_string($_GET["id"]);
    $sort = $_GET["sort"];
    switch ($sort) {
        
        case 'reject':
        $sort = "order_confirmed = 'reject' DESC";
        $sort_name = 'Отклоненные';
        break;
        
        case 'accept':
        $sort = "order_confirmed = 'accept' DESC";
        $sort_name = 'Собираемые';
        break;
        
        case 'delivery':
        $sort = "order_confirmed = 'delivery' DESC";
        $sort_name = 'Доставляемые';
        break;
        
        case 'close':
        $sort = "order_confirmed = 'close' DESC";
        $sort_name = 'Закрытые';
        break;
        
        
        case 'all-orders':
        $sort = "order_id DESC";
        $sort_name = 'От новых к старых';
        break;
         
        
        
        default:
        $sort = "order_id DESC";
        $sort_name = 'От новых к старых';     
        break;       
    }
  
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="content-type" content="text/html" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="jquery_confirm/jquery_confirm.css" rel="stylesheet" type="text/css" />      
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script> 
    <script type="text/javascript" src="js/script.js"></script> 
    <script type="text/javascript" src="jquery_confirm/jquery_confirm.js"></script> 

	<title>Панель управления - Заказы</title>
</head>

<body>

<div id="block-body">
<?php
	include("include/block-header.php");  
    
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

<div id="block-parameters">

<ul id="options-list">
<li>Сортировать</li>
<li><a id="select-links" href="#"><? echo $sort_name; ?></a>

<ul id="list-links-sort">
<li><a href="orders.php?sort=delivery">Доставляемые</a></li>
<li><a href="orders.php?sort=close">Закрытые</a></li>
<li><a href="orders.php?sort=accept">Собираемые</a></li>
<li><a href="orders.php?sort=reject">Отклоненные</a></li>
<li><a href="orders.php?sort=all-orders">От новых к старых</a></li>


</ul>

</li>
</ul>
</div>

<div id="block-info">

<ul id="review-info-count">
<li>Всего заказов - <strong><?php echo $all_count_result;?></strong></li>
<li>Необработанных - <strong><?php echo $forgetted_result;?></strong></li>
<li>В процессе обработки - <strong><?php echo $gen_orders_proc_result;?></strong></li>
<li>Отклоненных - <strong><?php echo $no_buy_count_result;?></strong></li>
<li>Закрытых - <strong><?php echo $buy_count_result;?></strong></li>


</ul>
</div>

<?php
	$result = mysql_query("SELECT * FROM orders ORDER BY $sort",$link);
    
    if(mysql_num_rows($result) > 0)
    {
        $row = mysql_fetch_array($result);
        do
        {
            if($row["order_confirmed"] == 'accept')
            {
                $status = '<span class="orange">В процессе сборки</span>';
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
        echo'<h1 class="no_orders">No orders!</h1>';
    }
?>

</div>
</div>
</body>
</html>

<?php
} else
{
    header("Location: login.php");
}	
?>