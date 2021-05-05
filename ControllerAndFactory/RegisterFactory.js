angular.module('mainApp')
    .factory('RegisterFactory', function ($q, AjaxFactory) {
        var RegisterFactory = {};

        RegisterFactory.registerCompany = function (companyTitle, employeeNameSurname, employeeEmail, emplyeePassword) {
            var deferred = $q.defer();
//            var url = 'Admin/Controller/DatabaseFunc.php';
            var url = 'Admin/Controller/Company.php';
            var postData = {};
            postData.funcInsertCompany = "funcInsertCompany";//postData.funcloginMain = "funcloginMain";
            postData.companyTitle = companyTitle;
            postData.employeeNameSurname = employeeNameSurname;
            postData.employeeEmail = employeeEmail;
            postData.emplyeePassword = emplyeePassword;
            
            
            // loading, alertOnFailure, alertOnWarning
            AjaxFactory.ajax(url, postData, true, true, true).then(function (content) {
                deferred.resolve(content.data);
            });

            return deferred.promise;
        };

        return RegisterFactory;

    });