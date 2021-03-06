variable "server_name" {
	description = "name of instance"
	type = string
}

variable "server_port" {
	description = "The port the server will use for HTTP requests"
	type = number
	default = 8080
}

variable "server_env" {
	description = "environment for project"
	type = string
}
