#
# security group
#

variable "security_group_name" {
  description = "Name for the security group"
}

variable "security_group_description" {
  description = "Description for the security group"
}

#
# Allow the user to disable ICMP IPv4
#
variable "disable_ping_ipv4" {
  description = ""
  default     = false
}

#
# Allow the user to disable ICMP IPv6
#
variable "disable_ping_ipv6" {
  description = ""
  default     = false
}

#
# security group rule
#

variable "security_group_rules" {
  description = "List of elements, each defining a security rule"
  type = map(object({
    security_group_rule_direction        = string
    security_group_rule_ethertype        = string
    security_group_rule_protocol         = string
    security_group_rule_port_range_min   = number
    security_group_rule_port_range_max   = number
    security_group_rule_remote_ip_prefix = string
  }))
}
