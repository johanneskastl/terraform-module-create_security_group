#

resource "openstack_networking_secgroup_v2" "create_security_group" {
  name                 = var.security_group_name
  description          = var.security_group_description
}

resource "openstack_networking_secgroup_rule_v2" "security_group_rule_nodes" {
  direction         = var.security_group_rule_direction
  ethertype         = var.security_group_rule_ethertype
  protocol          = var.security_group_rule_protocol
  port_range_min    = var.security_group_rule_port_range_min
  port_range_max    = var.security_group_rule_port_range_max
  remote_ip_prefix  = var.security_group_rule_remote_ip_prefix
  security_group_id = openstack_networking_secgroup_v2.create_security_group.id
}
