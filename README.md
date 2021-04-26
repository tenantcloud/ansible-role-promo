
![Lint Ansible Roles](https://github.com/tenantcloud/ansible-role-promo/workflows/Lint%20Ansible%20Roles/badge.svg?branch-master)

tenantcloud.promo
=========

Ansible role for install promo project.

  - tenantcloud_promo

Requirements
------------

Install tenantcloud.software_common
Install tenantcloud.software_dev
Install tenantcloud.dashboard

Role Variables
--------------

ansible_user: "user" os username
ansible_pass: "password" of os username
work_dir: "work"
work_domain:
promo_git:
promo_git_branch:
promo_dir:
bcl_package_install:

Dependencies
------------

  - homebrew
  - python@3
  - ansible

Example Playbook
----------------

```yaml
- hosts: localhost
  become: no
  vars:
    ansible_user: "user"
    ansible_pass: "password"
    work_dir: "work"
    work_domain:
    promo_git:
    promo_git_branch:
    promo_dir:
    bcl_package_install: true
  roles:
    - tenantcloud.promo
```

License
-------

BSD

Author Information
------------------

TenantCloud DevOps Team
