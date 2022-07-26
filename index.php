<?php
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://compras.natal.rn.gov.br/paginas/licitacoes/consulta/?mod=5");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$returno = curl_exec($ch);
$page = utf8_decode($returno);
curl_close ($ch);

$form = explode('<div class="CSSTableGenerator">', $returno);
$certo = utf8_decode($form[1]);

echo utf8_encode($form[1]);
//echo "<p>$//page</p>";

