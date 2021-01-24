<?php require_once("include/connection.php");?>
<?php session_start(); ?>
<!-- Основной верхний блок -->
<div id="block-header">
<!-- Верхний блок с навигацией -->
<div id="header-top-block">
<!-- Список с навигацией -->
<ul id="header-top-menu">
<li>Ваш город - <span>Харьков</span></li>
<li><a href="o-nas.php">О нас</a></li>
<li><a href="magaziny.php">Магазины</a></li>
<li><a href="feedback.php">Контакты</a></li>
</ul>
<!-- Вход и Регистрация -->

<?php
    
  $login = $_SESSION["session_username"];
         
			if(isset($_SESSION["session_username"]))
    {
    
	   echo '<p id="auth-user-info" align="right"><img src="/images/user.png">Здравствуйте, '.$_SESSION['auth_name'].'!</p>';
	}else{
       	echo '<p id="reg-auth-title" align="right"><a href="login.php" class="top-auth">Вход</a>
<a href="registration.php">Регистрация</a></p>   ';
			}
  
?>


<div id="block-top-auth">
<div class="corner"></div>

</div>

</div>
<!-- Линия -->
<div id="top-line"></div>

<div id="block-user" >
<div class="corner2"></div>
<ul>
<li><img src="/images/user_info.png" /><a href="my_orders.php">Заказы</a></li>
<li><img src="/images/user_info.png" /><a href="profile.php">Профиль</a></li>
<li><img src="/images/logout.png" /><a id="logout" href="logout.php" >Выход</a></li>
</ul>
</div>

<!-- Логотип -->
<a href="index.php"><img id="img-logo" src="/images/logo.png"/></a>
<!-- Информационный блок -->
<div id="personal-info">
<br />
<p align="right">Звонок бесплатный</p>
<h3 align="right">8 (800) 100-12-34</h3>
<img src="/images/phone-icon.png"/><br />
<p align="right">Режим работы</p>
<p align="right">Будние дни: с 9:00 до 18:00</p>
<p align="right">Суббота, воскресенье - выходные</p>
<img src="/images/time-icon.png"/>
</div>
<!-- Форма поиска -->
<div id="block-search">
<form method="GET" action="search.php?q=" >
<span></span>
<input type="text" id="input-search" name="q" placeholder="Поиск среди всех товаров" value="<?php echo $search; ?>" />
<input type="submit" id="button-search" value="Поиск"/>
</form>

<ul id="result-search">


</ul>


</div>
</div>

<div id="top-menu">

<ul>

<li><img src="/images/shop.png"/><a href="index.php">Главная</a></li>
<li><img src="/images/new-32.png"/><a href="view_aystopper.php?go=news">Новинки</a></li>
<li><img src="/images/bestprice-32.png"/><a href="view_aystopper.php?go=leaders">Лидеры продаж</a></li>
<li><img src="/images/sale-32.png"/><a href="view_aystopper.php?go=sale">Распродажа</a></li>
</ul>

<p align="right" id="block-basket"><img src="/images/cart-icon.png"/><a href="cart.php?action=oneclick">Корзина пуста</a></p>
<div id="nav-line"></div>

</div>