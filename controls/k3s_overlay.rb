include_controls 'k8s-node-stig-baseline' do
  control 'V-242405' do
    impact 0.0
    desc 'caveat', 'K3S deployments are not applied using manifest files and hence non-applicable.'
  end
  control 'V-242408' do
    impact 0.0
    desc 'caveat', 'K3S deployments are not applied using manifest files and hence non-applicable.'
  end
  control 'V-242444' do
    impact 0.0
    desc 'caveat', 'K3S deployments are not applied using manifest files and hence non-applicable.'
  end
  control 'V-242458' do
    impact 0.0
    desc 'caveat', 'K3S deployments are not applied using manifest files and hence non-applicable.'
  end
  control 'V-242454' do
    impact 0.0
    desc 'caveat', 'K3S deployments are not configured through Kubeadm and hence non-applicable.'
  end
  control 'V-242455' do
    impact 0.0
    desc 'caveat', 'K3S deployments are not configured through Kubeadm and hence non-applicable.'
  end

  control 'V-242429' do
    unless kube_apiserver.exist?
      impact 0.0
      desc 'caveat', 'Kubernetes API Server process is not running on the target.'
    end

    describe kube_apiserver do
      its('datastore-cafile') { should_not be_nil }
    end
  end
  control 'V-242430' do
    unless kube_apiserver.exist?
      impact 0.0
      desc 'caveat', 'Kubernetes API Server process is not running on the target.'
    end

    describe kube_apiserver do
      its('datastore-certfile') { should_not be_nil }
    end
  end
  control 'V-242431' do
    unless kube_apiserver.exist?
      impact 0.0
      desc 'caveat', 'Kubernetes API Server process is not running on the target.'
    end

    describe kube_apiserver do
      its('datastore-keyfile') { should_not be_nil }
    end
  end
end
