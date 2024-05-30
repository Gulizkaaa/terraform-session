resource "aws_sqs_queue" "for_each_queue" {
      for_each = var.for_each_names
    # for_each = {
    #     first = "first-for_each"
    #     second = "second-for-each"
    #     third = "third-for-each"
    # }



    name = each.value
}

variable "for_each_names" {
    type = map 
    description = "a map of names"
    default = { 
        first = "first-for_each"
        second = "second-for-each"
        third = "third-for-each"
        
    }
  
}