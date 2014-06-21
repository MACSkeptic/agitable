app.controller('commitsController',
  function ($scope, $resource, $routeParams, $location, commitsFactory, possibleRepositories) {
    $scope.repositories = possibleRepositories;
    $scope.repositoryName = $routeParams.repositoryName;
    $scope.jiraCode = $routeParams.jiraCode;

    $scope.clearCommits = function () { $scope.commits = []; };
    $scope.setCommits = function (commits) { $scope.commits = commits; };

    $scope.goTo = function () {
      $location.path('/commits/' + $scope.repositoryName + '/' + $scope.jiraCode);
    };

    $scope.showCommits = function () {
      $scope.clearCommits();

      commitsFactory.byRepositoryNameAndJiraCode(
        $scope.repositoryName,
        $scope.jiraCode
      ).then($scope.setCommits);
    };

    $scope.repositoryName && $scope.jiraCode && $scope.showCommits();
  }
);
