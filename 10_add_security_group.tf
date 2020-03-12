#
# create security group
#
resource "openstack_networking_secgroup_v2" "create_security_group" {
  name                 = var.security_group_name
  description          = var.security_group_description
}

#
# allow ICMP (to have working pings...) on IPv4
#
resource "openstack_networking_secgroup_rule_v2" "security_group_rule_icmp_ipv4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  security_group_id = openstack_networking_secgroup_v2.create_security_group.id
}

#
# allow ICMP (to have working pings...) on IPv6
#
resource "openstack_networking_secgroup_rule_v2" "security_group_rule_icmp_ipv6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "icmp"
  security_group_id = openstack_networking_secgroup_v2.create_security_group.id
}

#
# create rules defined by the user
#
resource "openstack_networking_secgroup_rule_v2" "security_group_rule_nodes" {

    for_each = var.security_group_rules

    direction         = each.value.security_group_rule_direction
    ethertype         = each.value.security_group_rule_ethertype
    protocol          = each.value.security_group_rule_protocol
    port_range_min    = each.value.security_group_rule_port_range_min
    port_range_max    = each.value.security_group_rule_port_range_max
    remote_ip_prefix  = each.value.security_group_rule_remote_ip_prefix
    security_group_id = openstack_networking_secgroup_v2.create_security_group.id
}
