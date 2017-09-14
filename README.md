# puppet-module-ansible

Puppet module to manage Ansible. Currently it simply installs the
Ansible package.

## Compatibility

This module has been tested to work on the following platforms with
Puppet v4 and v5 using the ruby versions that are shipped with each. See
`.travis.yml` for the exact matrix.

 * EL 6
 * EL 7

# Class Descriptions
## Class `ansible`

### Description

The ansible class manages the Ansible software. To use, simply `include ::ansible`.

### Parameters

---
#### package_name (string)
Name of package to be installed.

- *Default*: 'ansible'
