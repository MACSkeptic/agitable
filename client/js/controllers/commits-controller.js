app.controller('commitsController',
  function ($scope, $resource, commitsFactory, possibleRepositories) {
    $scope.repositories = possibleRepositories;
    $scope.repositoryName = $scope.repositories[0];

    $scope.showCommits = function () {
      $scope.commits = [];

      commitsFactory.byRepositoryNameAndJiraCode(
        $scope.repositoryName,
        $scope.jiraCode
      ).then(function (response) {
        response.commits.forEach(function (commit) {
          $scope.commits.push(commit);
        });
      });
    };
  }
);
