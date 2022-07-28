<?php

$html = "https://compras.natal.rn.gov.br/paginas/licitacoes/consulta/?mod=5";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $html);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$webPage = curl_exec($ch);
curl_close ($ch);

$dom = new DOMDocument();
$dom->loadHTML($webPage);
$td = $dom->getElementsByTagName('td');

$bids = [];
$cont = 0;
foreach ($td as $element) {
  $text = $element->textContent;

  switch($cont){
    case '0': 
      $licitacao = $text;
      break;
    case '1': 
      $process = $text;
      break;
    case '2': 
      $type = $text;
      break;
    case '3': 
      $organ = $text;
      break;
    case '4': 
      $date = $text;
      break;
    case '5': 
      $goal = $text;
      break;
    default: echo 'errro';
    }
  
  $cont++;
  if($cont == 6){
    array_push($bids, array(
      "biddingNumber" =>  $licitacao,
      "process" => $process,
      "type" => $type,
      "organ" => $organ,
      "date" => $date,
      "goal" => $goal
    ));

    $licitacao = null;
    $process = null;
    $type = null;
    $organ = null;
    $date = null;
    $goal = null;

    $cont=0;
  }
}
$json = json_encode($bids, JSON_UNESCAPED_UNICODE + JSON_UNESCAPED_SLASHES + JSON_PRETTY_PRINT);

echo "<pre>$json</pre>";

print_r($td);
?>


