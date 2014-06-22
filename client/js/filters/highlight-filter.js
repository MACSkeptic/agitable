app.filter('highlight', function ($sce) {
  return function (text, keyword) {
    return $sce.trustAsHtml(text.replace(keyword,
      '<span class="highlight">' + keyword + '</span>'));
  };
});
