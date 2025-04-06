{
  nix = {
    settings = {
      substituters = [
        "https://attic.kennel.juneis.dog/conduwuit"
        "https://attic.kennel.juneis.dog/conduit"
        "https://conduwuit.cachix.org"
      ];
      trusted-public-keys = [
        "conduwuit:BbycGUgTISsltcmH0qNjFR9dbrQNYgdIAcmViSGoVTE="
        "conduit:eEKoUwlQGDdYmAI/Q/0slVlegqh/QmAvQd7HBSm21Wk="
        "conduwuit.cachix.org-1:MFRm6jcnfTf0jSAbmvLfhO3KBMt4px+1xaereWXp8Xg="
      ];
    };
  };
}
