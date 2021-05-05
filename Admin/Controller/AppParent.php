<<<<<<< HEAD
<?php

namespace Admin\Controller;

class AppParent{
    public function __construct() {
        
    }
    public function dumpResponse ($response) {
        ob_clean();
        echo json_encode($response);
        return true;
    }
}
=======
<?php

namespace Admin\Controller;

class AppParent{
    public function __construct() {
        
    }
    public function dumpResponse ($response) {
        ob_clean();
        echo json_encode($response);
        return true;
    }
}
>>>>>>> dd14514c83da3c7b204d00d7563969c1aa460684
