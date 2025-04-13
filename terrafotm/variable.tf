variable "ami" {
  type = string
  default =  "ami-0f9de6e2d2f067fca"
}

variable "key" {
  type = string
}

variable "i-type" {
  type = string
  default =  "t2.small"
}

variable "c-1" {
  type = number
  default =  1
}

variable "subnet1" {
  type = string
  default =  "subnet-123456789"
}

variable "env-tag" {
  type = string
  default = "Production"
}
variable "az-v1" {
  type = string
  default = "us-east-1f"
}

variable "size-v1" {
  type = number
  default =  32
}

variable "sg-vpcid" {
  type = string
  default = "vpc-12345567"
}

variable "vol-type" {
  type = string
  }
