<?php

switch ($action) {
  
  case 'import':
    

    $apikey = "d0337619d35e2c45cee6b39ab4268f62af15332f5f4b1b1aa5e0e8fc0750dd5cb9ae2a2d";
    $outputType = "json";
    $url = 'https://bling.com.br/Api/v2/categorias/' . $outputType;
    
    $categories = executeGetCategories($url, $apikey);
    
    $categories = $categories['retorno']['categorias'];

    for($i=0; $i<sizeof($categories); $i++){
      $c = $categories[$i];

      $data = array(
        'id' => (int) $c['categoria']['id'],
        'title' => $c['categoria']['descricao'],
        'slug' => (int) $c['categoria']['id'].'-'.slugify($c['categoria']['descricao']),
        'parent_id' => (int) $c['categoria']['idCategoriaPai']
      );

      $db->table('categories')->insertUpdate($data,$data);
      
    }


  break;
  
  default:
    # code...
  break;
}


function executeGetCategories($url, $apikey){
  $curl_handle = curl_init();
  curl_setopt($curl_handle, CURLOPT_URL, $url . '&apikey=' . $apikey);
  curl_setopt($curl_handle, CURLOPT_RETURNTRANSFER, TRUE);
  $response = curl_exec($curl_handle);
  curl_close($curl_handle);
  return json_decode($response, true);
}