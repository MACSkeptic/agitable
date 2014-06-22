app.controller('commitController',
  function ($scope, $routeParams, $location, commitFactory) {
    $scope.repositoryName = $routeParams.repositoryName;
    $scope.commitHash = $routeParams.commitHash;

    $scope.clearCommit = function () { $scope.commit = {}; };
    $scope.setCommit = function (commit) { $scope.commit = commit; };

    $scope.goTo = function () {
      $location.path(
        '/commit/' + $scope.repositoryName + '/' + $scope.commitHash);
    };

    $scope.showCommit = function () {
      $scope.clearCommit();

      commitFactory.byRepositoryNameAndCommitHash(
        $scope.repositoryName,
        $scope.commitHash
      ).then($scope.setCommit);
    };

    $scope.repositoryName && $scope.commitHash && $scope.showCommit();
  }
);
