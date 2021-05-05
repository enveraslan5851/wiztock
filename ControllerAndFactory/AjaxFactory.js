//genel ajax func
angular.module('mainApp').factory('AjaxFactory', function($http, $q, $rootScope, $location){
    var AjaxFactory = {};
    
    // general AJAX function
    AjaxFactory.ajax = function(urlPath, data, loading, alertOnFailure, alertOnWarning) {
//        console.warn('location',$location);
//        var projectName = "ExAngular";
        var url = urlPath; 
        var deferred = $q.defer();
        
//        console.warn("ajaxfactory içinde urlPath",urlPath);
//        console.warn("-------------------ajaxfactory içinde data",data);
        var postReq = {
            async: true,
            method  : 'POST',
            // url     : '/'+ $rootScope.adminSuffix +'/' + urlPath,
            url     : url ,
            headers : { 'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8' },
//            data    : $.param( data )
            data    : data
            
        };
        if(data.postContent !== undefined){
            postReq.data             = data.postContent ;
            postReq.transformRequest = angular.identity ;
            postReq.headers          = {'Content-Type': undefined} ;
        } else {
            postReq.data             = $.param( data ) ;
//            postReq.data             = ( data ) ;
        }
        
//        console.warn("postReq.url",postReq.url);
//        console.log('@ajax, data: ', data);
//        console.log('@ajax, url: ', $location.protocol()+'://'+$location.host()+'/'+projectName+ '/'+postReq.url + '#' ); // tıklama ile gidilebilmesi için 
        
        var ajax = $http(postReq);
        ajax.then( function(response) {

            if(response.status !== 200) {
                swal('HTTP Error !', 'Code: '+response.status+'; Text: '+response.statusText  ,'error');
            } else if (!response.data.success) {
               
                if (alertOnFailure) {
                    $rootScope.swal('', response.data.errMsg  ,'error');
//                    window.location = "http://localhost/ExAngular/#!/"
                }
            } else {  // worked as wanted
                if (alertOnWarning && response.data.errMsg !== null && response.data.errMsg !== undefined) {
                    swal('', response.data.errMsg  ,'warning');
                } else if (alertOnWarning && response.data.warnMsg !== null) {
                     swal('', response.data.warnMsg  ,'warning');
                }
            }
            
            if (data.returnResponse === true) {
                deferred.resolve(response);      // response
            } else {
                deferred.resolve(response.data); // content = response.data anymore
            }
            
        }, function(response) {
            $("body").removeClass("loading");
            console.log('@ajax, response: ', response);
            console.log('@ajax, response.data: ', response.data);

            swal('HTTP Error !', 'Code: '+response.status+'; Text: '+response.statusText  ,'error');
            
            deferred.resolve(response.data); // response = response.data anymore
        });
        return deferred.promise;
    };

    return AjaxFactory;
    
    
    
}) ;
