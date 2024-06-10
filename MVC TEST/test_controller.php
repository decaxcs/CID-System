<?php 
    include_once "c_db.php";
    include_once "test_model.php";
    $activity_model = new ActivityModel();
    $get_all_activity = $activity_model->getAll();
    
    header('Content-Type: application/json');

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        if(isset($_POST['get_all_test'])){
            $get_all_activity = $activity_model->getAll();
            if($get_all_activity){

            echo json_encode($get_all_activity);
                
            } else{
                echo json_encode('No Data');
            }
        }

        if(isset($_POST['input_test'])){
            $input_test = $_POST['input_test'];
            $save_data = $activity_model->insertData($input_test);

            if($save_data){
                echo json_encode(['status' => 'success', 'message' => 'Saved successfully']);
            } else{
                echo json_encode(['failure' => 'success', 'message' => 'Not saved successfully']);
            }
        }
    }
