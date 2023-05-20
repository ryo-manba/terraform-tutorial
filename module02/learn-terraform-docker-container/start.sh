#!/bin/bash

# Terraformの設定ファイルを読み込み、初期化する
terraform init

# 設定に基づいてリソースの作成または更新を自動承認で実行する
terraform apply -auto-approve
