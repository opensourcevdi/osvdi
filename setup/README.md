# Setup OpenStack for VDI development

The VDI development setup is based on [DevStack](https://docs.openstack.org/devstack/latest), the original development and functional testing environment for OpenStack.

> :warning: **This development setup is not intented to run as productive VDI cloud instance. Be very careful here!** :warning:


## Requirements

The following requirements are mandatory to delopy and setup a single-node OpenStack instance for VDI development:

  - Machine for OpenStack running a [distribution supported by DevStack](https://docs.openstack.org/devstack/latest/#install-linux)
  - Configuration host equipped with [Ansible](https://www.ansible.com) for automatic setup of DevStack

We recommend to operate the OpenStack development environment within a virtual machine (VM) rather than on top of a bare-metal machine. This simplifies the creation and mangement of machine snapshots to obtain a reproducable and clean development environment. Note that the recommendation requires nested machine virtualiztion support to be enabled, e.g. [nested KVM](https://www.linux-kvm.org/page/Nested_Guests).


## Deployment

The setup is installed and delopyed with the Ansible playbook `playbook_devstack_setup.yml` using the following command line call

```shell
ansible-playbook -i <IP>, -u <USER> -k -K playbook_devstack_setup.yml
```

where `<IP>` is the IP address of the OpenStack machine and `<USER>` is a non-system user with `sudo`-capabilities on the OpenStack machine.


## Credentials

The credentials for various OpenStack components are specified as values in the Ansible playbook `playbook_devstack_setup.yml` and can be changed before the automatic deployment.

The default credentials for the administrator login on the Horizon dashboard are as follows:

```
Username: admin
Password: devstack
```
