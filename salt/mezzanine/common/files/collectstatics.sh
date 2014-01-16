/home/django/virtualenvs/django/bin/python /home/django/virtualenvs/django/project/manage.py collectstatic -v 0 --noinput > /home/django/collectstatic_stdout 2> /home/django/collectstatic_stderr

case "$?" in
0 )
WORKED="True"
echo
echo "changed=yes comment='Collectstatic run successfully.'"
;;
1 )
WORKED="False"
echo
echo "changed=no comment='Collectstatic failed.'"
;;
esac



# # This is the condition test I use to set the build status as UNSTABLE
# if [ ${WORKED} == "False" ]; then
#   echo WARNING: Salt command failed.

#   # Download the Jenkins CLI JAR:
#   curl -o jenkins-cli.jar ${JENKINS_URL}/jnlpJars/jenkins-cli.jar

#   # Set build status to unstable
#   java -jar jenkins-cli.jar -s ${JENKINS_URL}/ set-build-result unstable

# fi
