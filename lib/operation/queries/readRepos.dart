const String readRepos = r'''
  query readRepos($numRepo: Int!) {
    viewer {
      avatarUrl
      repositories(last: $numRepo) {
        nodes {
          id
          name
          description
          __typename
        }
      }
    }
  }
''';