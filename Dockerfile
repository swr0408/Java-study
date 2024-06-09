# GradleとEclipse Temurin 17 JDKを使用してビルドステージを設定
FROM gradle:7.6.0-jdk17 AS build

# 環境変数JAVA_HOMEを設定
ENV JAVA_HOME=/opt/java/openjdk

# 現在のディレクトリの全てのファイルをビルドステージにコピー
COPY . /home/gradle/project

# ビルドディレクトリに移動
WORKDIR /home/gradle/project

# Gradleを使ってクリーンビルドを実行
RUN gradle clean build -Dorg.gradle.java.home=$JAVA_HOME

# 新しいステージでEclipse Temurin 17 JDKを使用
FROM eclipse-temurin:17-alpine

# 前のステージからビルドされたJARファイルをコピー
COPY --from=build /home/gradle/project/build/libs/*.jar /usr/app/sample1app.jar

# ポート8080を公開
EXPOSE 8080

# アプリケーションを実行するためのコマンドを指定
ENTRYPOINT ["java", "-jar", "/usr/app/sample1app.jar"]
