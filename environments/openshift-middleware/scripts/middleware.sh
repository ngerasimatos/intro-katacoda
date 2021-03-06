# Bug in the Redhat Docker Image? 
# https://bugzilla.redhat.com/show_bug.cgi?id=1510187#c2
# https://www.mail-archive.com/users@lists.openshift.redhat.com/msg04484.html
yum install python-rhsm-certificates -y
mkdir -p /etc/docker/certs.d/registry.access.redhat.com/
ln -s /etc/rhsm/ca/redhat-uep.pem /etc/docker/certs.d/registry.access.redhat.com/redhat-ca.crt

yum install java-1.8.0-openjdk-devel -y
wget http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xzf apache-maven-3.3.9-bin.tar.gz
rm -rf apache-maven-3.3.9-bin.tar.gz
mkdir /usr/local/maven
mv apache-maven-3.3.9/ /usr/local/maven/
alternatives --install /usr/bin/mvn mvn /usr/local/maven/apache-maven-3.3.9/bin/mvn 1
alternatives --config mvn

docker pull registry.access.redhat.com/jboss-eap-7/eap70-openshift
docker pull registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift
docker pull registry.access.redhat.com/jboss-fuse-6/fis-java-openshift
docker pull registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift
docker pull registry.access.redhat.com/jboss-decisionserver-6/decisionserver64-openshift
docker pull registry.access.redhat.com/jboss-processserver-6/processserver64-openshift
docker pull registry.access.redhat.com/jboss-datagrid-7/datagrid71-openshift
docker pull registry.access.redhat.com/jboss-datagrid-7/datagrid71-client-openshift
docker pull registry.access.redhat.com/jboss-datavirt-6/datavirt63-openshift
docker pull registry.access.redhat.com/jboss-datavirt-6/datavirt63-driver-openshift
docker pull registry.access.redhat.com/jboss-amq-6/amq63-openshift
docker pull registry.access.redhat.com/redhat-sso-7/sso71-openshift
docker pull bucharestgold/centos7-s2i-nodejs


# Requires RHEL subscription
# docker pull registry.access.redhat.com/jboss-fuse-6/fis-karaf-openshift

curl -k -L -o /opt/jboss-image-streams.json https://raw.githubusercontent.com/redhat-middleware-hackathon/openshift-files/master/jboss-image-streams.json
