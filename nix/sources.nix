let
  fetchGitHubTarball = { owner, repo, rev, sha256 }:
    fetchTarball {
      url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
      inherit sha256;
    };
in
{
  passenv = fetchGitHubTarball {
    owner = "splintah";
    repo = "passenv";
    rev = "00f6d61f741a6928984477b7da07c421be77ec85";
    sha256 = "18c67wq5w577h2zr8ga7fs8gpr017bwf5gdy7q65hwrbmayc9bvp";
  };
}
