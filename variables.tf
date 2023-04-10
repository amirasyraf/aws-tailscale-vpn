variable "auth_key" {
  description = "Tailscale auth key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "Deployment region"
  type        = string
  default     = "ap-southeast-1"
}