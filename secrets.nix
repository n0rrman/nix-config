let
  zenbook = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILD5368VF/6IpwYFpPBU76d1B9cFLkkf4UidaZr3QNEz";
in
{
  "secrets/wireguard.age".publicKeys = [ zenbook ];
}
