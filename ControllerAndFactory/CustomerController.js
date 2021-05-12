angular.module('mainApp')

    .controller('CustomerCtrl', function ($scope, $rootScope, $location, $http, CustomerFactory) {
        $("#nav").removeClass("invisible");
        $("#accordionSidebar").removeClass("invisible");

        $("#individual_information").hide();



        $scope.currentLocation = window.location.href; // reginter yönlendirmesi için

        console.warn(window.location);
        $scope.path = window.location.origin + window.location.pathname + "#!/dene";
        console.info($scope.path);


        $scope.init = function () {

            $scope.getCustomerList();

            //document.body.classList.remove("register-page");
            //document.body.classList.remove("login-page");
            //document.body.classList.add("hold-transition");
            //document.body.classList.add("sidebar-mini");


        };


        $scope.changeCustomerTypeHandler = function () {

            if ($("#corporate_customer").get(0).checked === true) {
                console.log("Corporate");
                $("#individual_information").hide();
                $("#corporate_information1").show();
                $("#corporate_information2").show();

            } else {
                console.log("Individual");
                $("#corporate_information1").hide();
                $("#corporate_information2").hide();
                $("#individual_information").show();
            }

        };

        $scope.clearAllField = function () {
            $scope.corporate_title = "";
            $scope.corporate_short_name = "";
            $scope.corporate_tax_number = "";
            $scope.corporate_tax_office = "";
            $scope.individual_name = "";
            $scope.individual_surname = "";
            $scope.individual_ssn = "";
            $scope.customer_email = "";
            $scope.customer_phone = "";
            $scope.customer_address = "";
            $scope.customer_town = "";
            $scope.customer_city = "";
            $scope.customer_postal_code = "";
        }

        $scope.cancelHandler = function () {
            $('#createCustomerModal').modal('toggle');
            $scope.clearAllField();
        }

        $scope.submitHandler = function () {

            var postData = {}

            if ($("#corporate_customer").get(0).checked === true) {
                postData = {
                    customer_is_corporate: 1,
                    customer_is_customer: 1,
                    customer_is_supplier: 0,
                    corporate_title: $scope.corporate_title,
                    corporate_short_name: $scope.corporate_short_name,
                    corporate_tax_number: $scope.corporate_tax_number,
                    corporate_tax_office: $scope.corporate_tax_office,
                    individual_name: null,
                    individual_surname: null,
                    individual_ssn: null,
                    customer_email: $scope.customer_email,
                    customer_phone: $scope.customer_phone,
                    customer_address: $scope.customer_address,
                    customer_town: $scope.customer_town,
                    customer_city: $scope.customer_city,
                    customer_postal_code: $scope.customer_postal_code,
                    func: 'funcInsertCustomer',
                }
            } else {
                postData = {
                    customer_is_corporate: 0,
                    customer_is_customer: 1,
                    customer_is_supplier: 0,
                    corporate_title: null,
                    corporate_short_name: null,
                    corporate_tax_office: null,
                    individual_name: $scope.individual_name,
                    individual_surname: $scope.individual_surname,
                    individual_ssn: $scope.individual_ssn,
                    customer_email: $scope.customer_email,
                    customer_phone: $scope.customer_phone,
                    customer_address: $scope.customer_address,
                    customer_town: $scope.customer_town,
                    customer_city: $scope.customer_city,
                    customer_postal_code: $scope.customer_postal_code,
                    func: 'funcInsertCustomer'
                }
            }
            CustomerFactory.submitCustomer(postData)
                .then(function (response) {
                    $scope.submitRes = angular.copy(response);
                    console.warn($scope.submitRes);
                })
                .catch(function (err) {
                    console.warn($scope.submitRes);
                });
            $('#createCustomerModal').modal('toggle');
            $scope.clearAllField();


            $scope.getCustomerList();
        }

        $scope.getCustomerList = function () {
            var postData = {
                func: "getCustomerList"
            };
            CustomerFactory.getCustomerList(postData)
                .then(response => {
                    $scope.customerList = angular.copy(response.data);
                    console.log($scope.customerList);
                })
                .catch(err => {

                });
        }

        $scope.createHandler = function () {
            $('#createCustomerModal').modal('toggle');
            $scope.customerModalTitle = "Create Customer";
        }

        $scope.editHandler = function (customer) {
            $scope.customerModalTitle = "Edit Customer";
            $('#createCustomerModal').modal('toggle');

            var postData = {
                customer: customer,
                func: "getCustomer"
            };
            CustomerFactory.getCustomer(postData)
                .then(function (response) {
                    $scope.customer = angular.copy(response.data[0]);
                    console.log($scope.customer);

                    $scope.corporate_title = $scope.customer.title;
                    $scope.corporate_short_name = $scope.customer.short_name;
                    $scope.corporate_tax_number = $scope.customer.tax_number;
                    $scope.corporate_tax_office = $scope.customer.tax_office;
                    var name = $scope.customer.name_surname.split(" ");
                    $scope.individual_name = $scope.customer.name_surname.split(" ").slice(0, -1).join();
                    $scope.individual_surname = name[name.length - 1];
                    $scope.individual_ssn = $scope.customer.ssn;
                    $scope.customer_email = $scope.customer.email;
                    $scope.customer_phone = $scope.customer.phone;
                    $scope.customer_address = $scope.customer.address;
                    $scope.customer_town = $scope.customer.town;
                    $scope.customer_city = $scope.customer.city;
                    $scope.customer_postal_code = $scope.customer.postal_code;



                    if ($scope.customer.is_corporate === 1) {
                        $("#corporate_customer").prop('checked', true);
                        $("#individual_customer").prop('checked', false)
                        $scope.changeCustomerTypeHandler();
                    } else {
                        $("#individual_customer").prop('checked', true);
                        $("#corporate_customer").prop('checked', false);
                        $scope.changeCustomerTypeHandler();
                    }

                })
                .catch(err => {

                });

        }

        $scope.createContactCancelHandler = function () {
            $('#createCompanyContact').modal('toggle');
            $scope.clearAllField();
        }

        $scope.createContactCancelSubmitHandler = function () {
            $('#createCompanyContact').modal('toggle');
            $scope.clearAllField();
        }

        $scope.init();
    });