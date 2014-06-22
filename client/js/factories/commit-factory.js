app.factory('commitFactory', function ($resource) {
  var api = {};
  var commitResource = $resource('/commit/:repositoryName/:commitHash');

  api.byRepositoryNameAndCommitHash = function (repositoryName, commitHash) {
    return commitResource.get({
      repositoryName: repositoryName,
      commitHash: commitHash
    }).$promise;
  };

  return api;
});
