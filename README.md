Demonstrates bug in Terraform where adding a key to a subset of objects in a map affects a module's resources using for_each with if statements

Steps to reproduce:
1. Apply as is
2. Uncomment *one* of the bye parameters in test.tf
3. Apply will now show it deleting the resource inside the module that uses a for_each with an if statement, but *not the unconditional for_each*, nor the resource outside of the module.

If both byes are uncommented, everything is normal.