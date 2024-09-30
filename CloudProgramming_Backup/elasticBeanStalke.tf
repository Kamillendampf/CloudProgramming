# Elastic Beanstalk Application für das Backend
resource "aws_elastic_beanstalk_application" "backend_application" {
  name        = "my-backend-app"
  description = "Elastic Beanstalk Application for my backend"
}

# Erstellen einer Elastic Beanstalk-Anwendung
resource "aws_elastic_beanstalk_application" "app" {
  name        = "k9hub"
  description = "Elastic Beanstalk Application"
}

# Erstellen einer Elastic Beanstalk-Anwendungsversion
resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "v1"
  application = aws_elastic_beanstalk_application.app.name
  bucket      = aws_s3_bucket.k9hubbackendbucket.bucket
  key         = aws_s3_object.app_version.key

  depends_on = [aws_elastic_beanstalk_application.app]
}

# Erstellen einer Elastic Beanstalk-Umgebung
resource "aws_elastic_beanstalk_environment" "k9hub_backend" {
  name                = "k9hubbackend"
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.1.1 running Go 1"  # Verwenden Sie eine gültige Lösungspaket-Version
  version_label       = aws_elastic_beanstalk_application_version.app_version.name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_instance_profile.name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  # Weitere Einstellungen je nach Bedarf hinzufügen
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "NODE_ENV"
    value     = "production"
  }

}
