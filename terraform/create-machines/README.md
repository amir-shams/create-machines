# Create Virtual Machine with Terraform in VMware

### Terraform

I wanted to try out teffaform. I decided to use terraform to create a VM on that ESXi host. The official documentation on the vSphere terraform provider can be found here:

Terraform Version is : 
```angular2html
v1.5.4
```

[VMware vSphere Provider](https://www.terraform.io/docs/providers/vsphere/index.html)
[Vsphere-virtual-machine](https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html)

### Installing Terraform

Please follow the link below to install Terraform on Ubuntu:

[APT Packages for Debian and Ubuntu](https://www.terraform.io/cli/install/apt)

### Creating the Terraform Configuration Files


```
.
├── main.tf
├── modules
├── providers.tf
├── README.md
├── terraform.tf
├── terraform.tfvars
└── variables.tf
```
* terraform.tfvars contains the credentials for the vsphere login
* main.tf contains most of the infrastructure definition (this is just a three VMs in this example, but could be much larger)
* variables.tf contains the variables which can be passed into the create-vm.tf file for processing.
* providers.tf for connection to vSphere server
* terraform.tf for download provider from terraform
* modules this is directory and this directory for download and use modules

### Applying the Terraform Configuration files

The first command below is for sorting the contents of the file.

```
terraform fmt
```

Initialize terraform which will also install any plugins that you need:

```
terraform init
```
Now we use this command for validation files.

```
terraform validate
```

Now let’s make sure the plan is okay:

```
terraform plan
```
now let’s apply it:

```
terraform apply
```

to clean up you can use command below:

```
terraform destroy
```
 
 



