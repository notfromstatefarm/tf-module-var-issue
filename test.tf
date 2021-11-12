locals {
  tests = {
    ab = {
      enabled   = true
      something = "else"
      #bye       = 1337
    }
    cd = {
      enabled   = true
      something = "else"
      #bye       = 1337
    }
  }
}

module "test" {
  source = "./testmodule"
  tests  = local.tests
}

# unaffected
resource "null_resource" "outside_module" {
  for_each = { for name, test in local.tests : name => test if test.enabled == true }
}