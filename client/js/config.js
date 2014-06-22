app.config(function ($routeProvider, $locationProvider) {
  $routeProvider.when(
    '/commits/:repositoryName?/:jiraCode?', 
    {
      templateUrl: '/templates/commits.html',
      controller: 'commitsController'
    }
  );

  $routeProvider.when(
    '/commit/:repositoryName?/:commitHash?', 
    {
      templateUrl: '/templates/commit.html',
      controller: 'commitController'
    }
  );

  $routeProvider.otherwise({ redirectTo: '/commits' });

  $locationProvider.html5Mode(false);
});
