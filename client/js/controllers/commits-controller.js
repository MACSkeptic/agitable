app.controller('commitsController',
  function ($scope, $resource, commitsFactory, possibleRepositories) {
    $scope.repositories = possibleRepositories;
    $scope.repositoryName = $scope.repositories[0];

    $scope.clearCommits = function () { $scope.commits = []; };
    $scope.setCommits = function (commits) { $scope.commits = commits; };

    $scope.showCommits = function () {
      $scope.clearCommits();

      commitsFactory.byRepositoryNameAndJiraCode(
        $scope.repositoryName,
        $scope.jiraCode
      ).then($scope.setCommits);
    };
  }
);
