# Udacity EC2 Terraform for Deep Learning

This is a HCL (HashiCorp Configuration Language) project that allows you to create a GPU p2.xlarge
instance on AWS for the purpose of training Deep Learning networks and running jupyter handbooks.
This will save you creating EC2 instance, security groups etc. manually.

![screenshot](https://github.com/techfort/udacity-ec2-gpu/blob/master/screenshot.png)

## Usage

in `terraform.tfvars` replace your `aws_profile` and `aws_region` accordingly.
On Unix/Mac OS X you should have a `~/.aws/credentials` file that looks like the `credentials~sample` file 
included in this project. If you don't, go to your AWS account and obtain your security credentials, then store 
them in the same format as the `credentials~sample` file.
If you have AWS experience, then you know you can also configure your profile with the `aws-cli` or with ENV vars.

Replace the profile in `terraform.tfvars` with the profile you intend to use if you have multiple aws accounts.

### Install terraform

Install terraform [here](https://www.terraform.io/downloads.html)
Make sure to add it to your `$PATH`.

### Run the project

To make sure things are going to plan run `terraform plan`. If you get no errors go ahead and run `terraform apply`.

### Beware the costs!

If you get errors, and want to avoid runnning a bill, run `terraform destroy`. Terraform is fantastic software and is very reliable,
but it does not rollback in the face of errors, so make sure to log onto your AWS account and make sure all unused resource are
terminated or destroyed.

### Issues

Sometimes the provisioning (cloning of git repo, cd'ing into folder, starting conda and running jupyter) may not go according to plan.
All you need to do is ssh into the machine at the IP address and issue the instructions that failed again.
Also, this is only the basic setup, follow the instructions of the particular project/assignment you are working on to download further repos and assets.
