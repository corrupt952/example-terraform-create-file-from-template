variable "name" {
  default = "alice"
}

data "template_file" "profile" {
  template = "${file("${path.module}/src/profile.txt")}"

  vars {
    name = "${var.name}"
  }
}

resource "local_file" "profile" {
  content  = "${data.template_file.profile.rendered}"
  filename = "${path.module}/dist/profile.txt"
}
