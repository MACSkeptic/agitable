app.directive('linkForCommit', function () {
  return {
    scope: true,
    restrict: 'E',
    replace: true,
    templateUrl: '/templates/link-for-commit.html'
  };
});
