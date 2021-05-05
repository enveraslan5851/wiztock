angular.module('mainApp')
    .factory('LoginFactory', function ($q, AjaxFactory) {
        var LoginFactory = {};

        LoginFactory.getData = function (user_mail, user_password) {
            console.warn("mail", user_mail);
            console.warn("pass", user_password);
            var deferred = $q.defer();
            var url = 'Admin/Controller/Index.php';
            var postData = {};
            postData.func = "loginFunction";//postData.funcloginMain = "funcloginMain";
            postData.mail = user_mail;
            postData.pass = user_password;
            // loading, alertOnFailure, alertOnWarning
            AjaxFactory.ajax(url, postData, true, true, true).then(function (content) {
                deferred.resolve(content.data);
            });

            return deferred.promise;
        };

        return LoginFactory;

    });