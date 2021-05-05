angular.module('mainApp')

    .controller('LoginCtrl', function ($scope, $rootScope, $location, $http, LoginFactory) {

        $scope.currentLocation = window.location.href; // reginter yönlendirmesi için

        //document.getElementById("dashboard").style.visibility = "hidden";


        $scope.getData = function (mail, pass) {

            LoginFactory.getData(mail, pass)
                .then(function (data) {
                    $scope.data = angular.copy(data);

                    console.warn("$scope.dataloginekransdfsadfsafsdfı", $scope.data);
                    return false;
                    return 0;
                    if ($scope.data['admn']) {
                        $location.path('panel');
                        return false;
                    }

                    if ($scope.data['login']) {
                        $location.path('Edefter');

                    } else {
                        swal({
                            title: 'HATALI GİRİŞ !',
                            html: 'Lütfen Kullanıcı adınızı, şifrenizi ve internet bağlantınızı kontrol ediniz !',
                            type: 'error',
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                            allowEnterKey: false,
                            showConfirmButton: true
                        });
                    }
                });
        };

        $scope.goPanel = function () {
            $location.path("panel");
        };

        $scope.sendAdInfo = function (obj) {// servis içi n yazılmıstı
            adminService.addAdminInfo(obj);
        };

        $scope.login = function () {
            $("#nav").removeClass("invisible");

            console.warn("Login Buttonuna tıklandı");
            LoginFactory.getData($scope.user_email, $scope.user_password)
                .then(function (response) {
                    console.warn(response);
                });

        }

    });


