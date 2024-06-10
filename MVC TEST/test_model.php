<?php
    class ActivityModel extends Dbh {
        public function getAll(){
            try{
                $stmt = $this->connect()->prepare("SELECT * FROM test_table");

                if(!$stmt->execute()){
                    return false;
                    die();
                }

                $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
                return $result;

                }catch(PDOException $e){
                    print ("error: " . $e->getMessage() ."");
                }finally{
                    $stmt = null;
            }
        }

        public function insertData($test_name){
            try{
                $stmt = $this->connect()->prepare("INSERT INTO test_table (test_name) VALUES (?)");
    
                if(!$stmt->execute([$test_name])){
                    return false;
                    die();
                }
    
                return true;
    
            }catch(PDOException $e){
                print ("error". $e->getMessage() ."");
            }finally{
                $stmt = null;
            }
        }

        public function updateActivityType($activity_type, $current_date, $activity_id){
            try{
                $stmt = $this->connect()->prepare("UPDATE activity SET activity_type = ?, activity_edited_time = ? WHERE activity_id = ?");
    
                if(!$stmt->execute([$activity_type, $current_date, $activity_id])){
                    return false;
                    die();
                }
    
                return true;
    
            }catch(PDOException $e){
                print ("error". $e->getMessage() ."");
            }finally{
                $stmt = null;
            }
        }
}
