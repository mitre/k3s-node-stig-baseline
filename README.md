## K3S Node STIG Automated Compliance Validation Profile

InSpec profile to validate the secure configuration of a Kubernetes node against DISA's Kubernetes Secure Technical Implementation Guide (STIG) Version 1 Release 1.

It is to be used in conjunction with the <b>[K3S Cluster](https://github.com/mitre/k3s-node-stig-baseline.git)</b> profile that performs automated compliance checks of the <b>K3S Cluster</b>.

## Kubernetes STIG Overview

The <b>Kubernetes</b> STIG (https://public.cyber.mil/stigs/) by the United States Defense Information Systems Agency (DISA) offers a comprehensive compliance guide for the configuration and operation of various technologies.
DISA has created and maintains a set of security guidelines for applications, computer systems or networks connected to the DoD. These guidelines are the primary security standards used by many DoD agencies. In addition to defining security guidelines, the STIG also stipulates how security training should proceed and when security checks should occur. Organizations must stay compliant with these guidelines or they risk having their access to the DoD terminated.

[STIG](https://en.wikipedia.org/wiki/Security_Technical_Implementation_Guide)s are the configuration standards for United States Department of Defense (DoD) Information Assurance (IA) and IA-enabled devices/systems published by the United States Defense Information Systems Agency (DISA). Since 1998, DISA has played a critical role enhancing the security posture of DoD's security systems by providing the STIGs. The STIGs contain technical guidance to "lock down" information systems/software that might otherwise be vulnerable to a malicious computer attack.

The requirements associated with the <b>Kubernetes</b> STIG are derived from the [National Institute of Standards and Technology](https://en.wikipedia.org/wiki/National_Institute_of_Standards_and_Technology) (NIST) [Special Publication (SP) 800-53, Revision 4](https://en.wikipedia.org/wiki/NIST_Special_Publication_800-53) and related documents.

While the Kubernetes STIG automation profile check was developed to provide technical guidance to validate information with security systems such as applications, the guidance applies to all organizations that need to meet internal security as well as compliance standards.

## Getting Started

### Requirements

#### K3S Cluster
- K3S Platform deployment
- Access to the K3S Node over ssh
- Account providing appropriate permissions to perform audit scan


#### Required software on the InSpec Runner
- git
- [InSpec](https://www.chef.io/products/chef-inspec/)

### Setup Environment on the InSpec Runner
#### Install InSpec
Goto https://www.inspec.io/downloads/ and consult the documentation for your Operating System to download and install InSpec.


#### Ensure InSpec version is at least 4.23.10 
```sh
inspec --version
```
### Update Profile Input Values
Update the following `Inputs` in `inspec.yml` if the default values differ in your platform.

```yml
  - name: pki_path
    description: 'Path to K3S PKI files on the target node'
    type: string
    value: '/var/lib/rancher/k3s/server/tls/'
    required: true
    profile: k8s-node-stig-baseline

  - name: kubectl_path
    description: 'Path to kubectl on the target node'
    type: string
    value: '/usr/local/bin/kubectl'
    required: true
    profile: k8s-node-stig-baseline

  - name: kubectl_minversion
    description: 'Minimum version of the kubectl binary on the target node'
    type: string
    value: '1.12.9'
    required: true
    profile: k8s-node-stig-baseline

  - name: kubernetes_conf_files
    description: 'Path to Kubernetes conf files on the target node'
    type: array
    value:
        - /var/lib/rancher/k3s/server/cred/admin.kubeconfig
        - /var/lib/rancher/k3s/server/cred/scheduler.kubeconfig
        - /var/lib/rancher/k3s/server/cred/controller.kubeconfig
    required: true
    profile: k8s-node-stig-baseline
```

### How to execute this instance  
(See: https://www.inspec.io/docs/reference/cli/

**Execute the K3S Node profile on each node in the cluster. The profile will adapt its checks based on the K3S components located on the node.**

#### Execute a single Control in the Profile 
**Note**: Replace the profile's directory name - e.g. - `<Profile>` with `.` if currently in the profile's root directory.

```sh
inspec exec <Profile> -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY> --controls=<control_id> --reporter cli
```

#### Execute a Single Control and save results as JSON 
```sh
inspec exec <Profile> -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY> --controls=<control_id> --reporter json:results.json
```

#### Execute All Controls in the Profile 
```sh
inspec exec <Profile>  -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY> --reporter cli
```

#### Execute all the Controls in the Profile and save results as JSON 
```sh
inspec exec <Profile> -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY>. --reporter json:results.json
```

#### Execute all the Controls in the Profile and see results as they are run
```sh
inspec exec <Profile> -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY>. --reporter progress-bar
```

#### Execute all the Controls in the Profile and see results as they are run and json at the same time
```sh
inspec exec <Profile> -t ssh://TARGET_USERNAME@TARGET_IP:TARGET_PORT --sudo -i <your_PEM_KEY>. --reporter progress-bar json:my-results.json
```
