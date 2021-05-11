angular.module('mainApp')
    .factory('CustomerFactory', function ($q, AjaxFactory) {
        var CustomerFactory = {};

        CustomerFactory.submitCustomer = function (postData) {
            var deferred = $q.defer();
            var url = 'Admin/Controller/Index.php';
            AjaxFactory.ajax(url, postData, true, true, true).then(function (content) {
                deferred.resolve(content);
            });

            return deferred.promise;
            /*
            
            var url = 'Admin/Controller/Index.php';
            var postData = {};
            postData.func = "loginFunction";//postData.funcloginMain = "funcloginMain";
            postData.mail = user_mail;
            postData.pass = user_password;
            // loading, alertOnFailure, alertOnWarning
            AjaxFactory.ajax(url, postData, true, true, true).then(function (content) {
                deferred.resolve(content);
            });

            return deferred.promise;
            */
        };

        CustomerFactory.getCustomerList = function (postData) {
            var deferred = $q.defer();

            var url = 'Admin/Controller/Index.php';
            AjaxFactory.ajax(url, postData, true, true, true).then(function (content) {
                deferred.resolve(content);
            });

            return deferred.promise;

        }

        CustomerFactory.getCustomer = function (postData) {
            var deferred = $q.defer();

            var url = 'Admin/Controller/Index.php';
            AjaxFactory.ajax(url, postData, true, true, true).then(function (content) {
                deferred.resolve(content);
            });

            return deferred.promise;
        }

        return CustomerFactory;
    });