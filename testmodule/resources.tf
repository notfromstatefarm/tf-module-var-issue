resource "null_resource" "inside_module" {
  for_each = { for name, test in var.tests : name => test if test.enabled == true }
}

resource "null_resource" "inside_module_unaffected" {
  for_each = { for name, test in var.tests : name => test }
}