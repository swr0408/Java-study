# MavenおよびEclipse Temurin 17 JDKを使用してビルドステージを設定
FROM maven:3-eclipse-temurin-17 AS build

# 現在のディレクトリの全てのファイルをビルドステージにコピー
COPY . .

# Mavenを使ってクリーンパッケージを実行（テストはスキップ）
RUN mvn clean package -Dmaven.test.skip=true

# 新しいステージでEclipse Temurin 17 JDKを使用
FROM eclipse-temurin:17-alpine

# 前のステージからビルドされたJARファイルをコピー
COPY --from=build /target/sample1app-0.0.1-SNAPSHOT.jar sample1app.jar

# ポート8080を公開
EXPOSE 8080

# アプリケーションを実行するためのコマンドを指定
ENTRYPOINT ["java", "-jar", "sample1app.jar"]
