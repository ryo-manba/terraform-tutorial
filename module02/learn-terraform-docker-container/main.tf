terraform {
  # プロバイダのバージョンとソースを設定する
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Dockerプロバイダの設定をする（今回は何もしていない）
provider "docker" {}

# Dockerイメージの設定
# keep_locallyをfalseとすることでイメージがローカルで保持されない
resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

# Dockerコンテナの設定
# 事前に定義したDockerイメージを使用する
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  # コンテナの80番ポートをホストの8000番ポートにマップする
  ports {
    internal = 80
    external = 8000
  }
}
