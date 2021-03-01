<?php

switch ($action) {
  
  case 'import':
    

    $apikey = "d0337619d35e2c45cee6b39ab4268f62af15332f5f4b1b1aa5e0e8fc0750dd5cb9ae2a2d";
    $outputType = "json";
    $url = 'https://bling.com.br/Api/v2/produtos/' . $outputType;
    
    $products = executeGetProducts($url, $apikey);
    $products = $products['retorno']['produtos'];
    

    
    for($i=0; $i<sizeof($products); $i++){
      $p = $products[$i]['produto'];
      
      if(!$p['codigoPai'] && !$p['variacoes']){

        $data = array(
          'id_category' => $p['categoria']['id'],
          'sku' => $p['codigo'],
          'title' => $p['descricao'],
          'price' => $p['preco'],
          'description' => $p['descricaoCurta'],
          'img' => $p['imageThumbnail'],
          'ean' => $p['gtin'],
          'weight' => $p['pesoBruto'],
          'width' => $p['larguraProduto'],
          'height' => $p['alturaProduto'],
          'length' => $p['profundidadeProduto'],
          'stock' => $p['estoqueAtual'],
          'brand' => $p['marca']
        );
        $db->table('products')->insertUpdate($data,$data);
        
      }
      
    }
    $db->query('DELETE FROM products WHERE sku LIKE "CC%"');
    


  break;

  
  default:
    $smarty->display('views/base.html');
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