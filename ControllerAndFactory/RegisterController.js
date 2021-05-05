angular.module('mainApp')

    .controller('RegisterCtrl', function ($scope, $rootScope, $location, $http, RegisterFactory) {
        $scope.init = function () {
            document.body.classList.add("hold-transition");
            document.body.classList.add("register-page");
        }

        $scope.registerCompany = function (companyTitle, employeeNameSurname, employeeEmail, emplyeePassword) {

            RegisterFactory.registerCompany(companyTitle, employeeNameSurname, employeeEmail, emplyeePassword)
                .then(function (data) {
                    $scope.data = angular.copy(data);

                    console.warn("$scope.dataloginekransdfsadfsafsdfı", $scope.data);

                    if ($scope.data['admn']) {
                        $location.path('panel');
                        return false;
                    }

                    //if ($scope.data['login']) {
                    //$location.path('Edefter');

                    //} else {
                    //swal({
                    //title: 'HATALI GİRİŞ !',
                    //html: 'Lütfen Kullanıcı adınızı, şifrenizi ve internet bağlantınızı kontrol ediniz !',
                    //type: 'error',
                    //allowOutsideClick: false,
                    //allowEscapeKey: false,
                    //allowEnterKey: false,
                    // showConfirmButton: true
                    //});
                    //}
                });
        };

        $scope.goPanel = function () {
            $location.path("panel");
        };

        $scope.sendAdInfo = function (obj) {// servis içi n yazılmıstı
            adminService.addAdminInfo(obj);
        };

        $scope.register = function () {

            var companyTitle = $scope.companyTitle;
            var employeeNameSurname = $scope.employeeNameSurname;
            var employeeEmail = $scope.employeeEmail;
            var emplyeePassword = $scope.emplyeePassword;

            $scope.registerCompany(companyTitle, employeeNameSurname, employeeEmail, emplyeePassword);
        };

        $scope.init();
    });


