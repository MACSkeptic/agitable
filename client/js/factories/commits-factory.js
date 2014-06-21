app.factory('commitsFactory', function ($resource) {
  var api = {};
  var commitsResource = $resource('/commits/:repositoryName/:jiraCode');

  api.byRepositoryNameAndJiraCode = function (repositoryName, jiraCode) {
    return commitsResource.query({
      jiraCode: jiraCode,
      repositoryName: repositoryName
    }).$promise;
  };

  return api;
});
