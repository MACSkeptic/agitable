app.config(function ($routeProvider, $locationProvider) {
  $routeProvider.when(
    '/commits/:repositoryName?/:jiraCode?', 
    {
      templateUrl: '/templates/commits.html',
      controller: 'commitsController'
    }
  );

  $routeProvider.otherwise({ redirectTo: '/commits' });

  $locationProvider.html5Mode(false);
});
