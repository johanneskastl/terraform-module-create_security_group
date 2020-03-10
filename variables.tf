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
# security group rule
#

variable "security_group_rule_direction" {
  description = "Whether this rule is for inward or outward traffic"
  default     = "ingress"
}

variable "security_group_rule_ethertype" {
  description = "IPv4 or IPv6?"
  default     = "IPv4"
}

variable "security_group_rule_protocol" {
  description = "Which protocol this rule should match? tcp? udp?"
}

variable "security_group_rule_port_range_min" {
  description = "First port that should be allowed"
}

variable "security_group_rule_port_range_max" {
  description = "Last port that should be allowed"
}

variable "security_group_rule_remote_ip_prefix" {
  description = "Should this rule only match traffic from a certain IP or IP range"
  default     = "0.0.0.0/0"
}
