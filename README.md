tenantcloud.ansible_role_promo
=========

Ansible role for install promo project.

  - tenantcloud_promo
  - keller_promo

Requirements
------------

Install tenantcloud.ansible_role_software_common
Install tenantcloud.ansible_role_software_dev
Install tenantcloud.ansible_role_dashboard

Role Variables
--------------

work_user: "user"
work_dir: "work"
promo_git:
promo_git_branch:
promo_dir:
work_domain:
database:
app_key:
minio_key:
minio_secret:
app_env:

Dependencies
------------

  - homebrew
  - python@3
  - ansible

Example Playbook
----------------

    - hosts: localhost
      become: no
      vars:
        work_user: "user"
        work_dir: "work"
        promo_git:
        promo_git_branch:
        promo_dir:
        work_domain:
        database:
        app_key:
        minio_key:
        minio_secret:
        app_env:
      roles:
        - tenantcloud.ansible_role_promo

License
-------

BSD

Author Information
------------------

TenantCloud DevOps Team
