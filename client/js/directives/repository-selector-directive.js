app.directive('repositorySelector', function (possibleRepositories) {
  return {
    scope: true,
    restrict: 'E',
    replace: true,
    templateUrl: '/templates/repository-selector.html',
    link: function (scope) { scope.repositories = possibleRepositories; }
  };
});
