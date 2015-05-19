//= require jquery
//= require app/models.js
//= require_tree views
//= require_self

var lib = lib || {};
lib.init = function(){
    lib.listBorrower();
}

lib.listBorrower = function(){
    var app = angular.module('borrowerList', []);
    app.controller('borrowerCtrl', function($scope, $http) {
        $http.get("/library/borrower/getBorrowers")
            .success(function(response) {$scope.borrowers = response.borrower;});
    });

}

$(function(){
    lib.init();
});