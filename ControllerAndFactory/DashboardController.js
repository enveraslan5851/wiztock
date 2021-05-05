angular.module('mainApp')

    .controller('DashboardCtrl', function ($scope, $rootScope, $location, $http, DashboardFactory) {
        $("#nav").removeClass("invisible");
        $("#accordionSidebar").removeClass("invisible");
       
        $scope.currentLocation =  window.location.href; // reginter yönlendirmesi için

        console.warn(window.location);
        $scope.path = window.location.origin + window.location.pathname + "#!/dene";
        console.info($scope.path);


        $scope.init = function () {
            
            console.warn("sdfsdfsdfsdfsdfsdfsd");

            document.body.classList.remove("register-page");
            document.body.classList.remove("login-page");
            document.body.classList.add("hold-transition");
            document.body.classList.add("sidebar-mini");


        };


 
    });