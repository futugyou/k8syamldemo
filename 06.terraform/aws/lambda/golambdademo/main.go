package main

import (
	"context"
	"fmt"
	"log"

	"database/sql"

	"github.com/aws/aws-lambda-go/lambda"

	_ "github.com/denisenkom/go-mssqldb"
)

type SqlEvent struct {
	Server   string `json:"server"`
	User     string `json:"user"`
	Password string `json:"password"`
	Port     int    `json:"port"`
}

func HandleRequest(ctx context.Context, ev SqlEvent) (string, error) {
	connString := fmt.Sprintf("server=%s;user id=%s;password=%s;port=%d",
		ev.Server,
		ev.User,
		ev.Password,
		ev.Port)

	conn, err := sql.Open("mssql", connString)

	if err != nil {
		log.Fatal("open connection failed:", err.Error())
		return "Open connection failed", err
	}

	defer conn.Close()

	_, err = conn.Exec("USE master \n" +
		"IF NOT EXISTS (SELECT [name] FROM sys.databases WHERE [name] = N'EventBus1') \n" +
		"CREATE DATABASE EventBus1 \n")

	if err != nil {
		log.Fatal("exec failed:", err.Error())
		return "exec failed", err
	}

	return "ok", nil
}

func main() {
	lambda.Start(HandleRequest)
}
