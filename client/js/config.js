app.config(function ($routeProvider, $locationProvider) {
  $routeProvider.when(
    '/commits', 
    {
      templateUrl: '/templates/commits.html',
      controller: 'commitsController'
    }
  );

  $routeProvider.otherwise({ redirectTo: '/commits' });

  $locationProvider.html5Mode(false);
});
