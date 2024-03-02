terraform {
  required_providers {
    todo = {
      source  = "spkane/todo"
      version = "2.0.5"
    }
  }
}

provider "todo" {
  host = "127.0.0.1"
  port = "8080"
  apipath = "/"
  schema = "http"
}

data "todo_todo" "foreign" {
  id = 1
}

resource "todo_todo" "test1" {
  count = 4
  description = "${count.index}-1 ${var.purpose} todo (updated)"
  completed = false
}

resource "todo_todo" "test2" {
  count = 4
  description = "${count.index}-2 ${var.purpose} todo (linked to ${data.todo_todo.foreign.description})"
  completed = false
}

resource "todo_todo" "primary" {
  description = "Existing Todo"
  completed = true
}

resource "todo_todo" "primary1" {
  description = "Existing Todo1"
  completed = true
}


