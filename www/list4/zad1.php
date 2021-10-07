<?php
$IsPostFormData = (isset($_POST["sent"]) && ($_POST["sent"]=="y"));
$IsGetFormData = (isset($_GET["sent"]) && ($_GET["sent"]=="y"));
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Zad1</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<style type="text/css">
td,th,body { font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10pt; }
		</style>
	</head>

	<body>
		<form name="dane" action="zad1.php" method="get">
			<table align="center" cellpadding="4" cellspacing="2" border="0" bgcolor="#FF9900">
				<tr><th align="left">Nr karty:</th><td>
									<input name="cardNumber[]" type="text" size="4" maxlength="4" value="">
									<input name="cardNumber[]" type="text" size="4" maxlength="4" value="">
									<input name="cardNumber[]" type="text" size="4" maxlength="4" value="">
									<input name="cardNumber[]" type="text" size="4" maxlength="4" value="">
				<tr><th align="left">Data ważności:	</th><td><input name="date" type="text" size="20" maxlength="40" value=""></td></tr>
				<tr><th align="left">CVC:			</th><td><input name="cvc" type="text" size="3" maxlength="3" value="">
				<tr><th align="left">Imie:			</th><td><input name="name" type="text" size="11" maxlength="11" value=""></td></tr>
				<tr><th align="left">Nazwisko:		</th><td><input name="surname" type="text" size="11" maxlength="11" value=""></td></tr>
				<tr><th align="left">Email:			</th><td><input name="email" type="text" size="11" maxlength="11" value=""></td></tr>
				<tr><th align="left">Nr tel:		</th><td><input name="phone" type="text" size="11" maxlength="11" value=""></td></tr>
				<tr><th align="left">Kwota:			</th><td><input name="ammount" type="text" size="11" maxlength="11" value=""></td></tr>
				<tr><td align="right" colspan="2"><input type="submit" value="Wyślij"></td></tr>
			</table>
			<input name="sent" type="hidden" value="y">
		</form>

	<?php if ( $IsGetFormData ): ?>
		 <table cellpadding="4" cellspacing="2" border="1" align="center">
			 <tr><th>Nr karty:</th><td>	<?php echo join($_GET["cardNumber"],"-"); ?></td></tr>
			 <tr><th>Data:</th><td>		<?php echo $_GET["date"]; ?></td></tr>
			 <tr><th>CVC:</th><td>		<?php echo $_GET["cvc"]; ?></td></tr>
			 <tr><th>Imie:</th><td>		<?php echo $_GET["name"]; ?></td></tr>
			 <tr><th>Nazwisko:</th><td>	<?php echo $_GET["surname"]; ?></td></tr>
			 <tr><th>Email:</th><td>	<?php echo $_GET["email"]; ?></td></tr>
			 <tr><th>Nr tel:</th><td>	<?php echo $_GET["phone"]; ?></td></tr>
			 <tr><th>Kwota:</th><td>	<?php echo $_GET["ammount"]; ?></td></tr>
		 </table>
	<?php endif; ?>
	</body>
</html>
