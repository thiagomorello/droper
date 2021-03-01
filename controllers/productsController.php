<?php

switch ($action) {
  
  case 'get':
    

    $apikey = "d0337619d35e2c45cee6b39ab4268f62af15332f5f4b1b1aa5e0e8fc0750dd5cb9ae2a2d";
    $outputType = "json";
    $url = 'https://bling.com.br/Api/v2/produtos/' . $outputType;
    
    $products = executeGetProducts($url, $apikey);
    $products = $products['retorno']['produtos'];
    

    
    for($i=0; $i<sizeof($products); $i++){
      $p = $products[$i]['produto'];
      
      if(!$p['codigoPai']){
        $data = array(
          'sku' => $p['codigo'],
          'title' => $p['descricao'],
          'price' => $p['preco'],
          'description' => $p['descricaoCurta'],
          'img' => $p['imageThumbnail'],
        );
        print_r($p);
        break;
      }
      
      
      
    }
    
    


  break;
  
  default:
    # code...
  break;
}


function executeGetProducts($url, $apikey){
  $curl_handle = curl_init();
  curl_setopt($curl_handle, CURLOPT_URL, $url . '&apikey=' . $apikey.'&estoque=S');
  curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, TRUE);
  $response = curl_exec($curl_handle);
  curl_close($curl_handle);
  return json_decode($response, true);
}