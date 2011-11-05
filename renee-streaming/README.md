# Renee Stream

Streaming templates in Renee should be familiar and intuitive using the `stream!` command:

```ruby
run Renee.core {
 path('blog') do
   get {
     stream! {|out|
       out << "Wait a sec"
       EM::timer 1 {
         out << "Ok! All done!"
       }
     }
   }
 end
}
```

Or more concisely...

```ruby
run Renee.core {
 path('blog') do
   get.stream! {|out|
     out << "Wait a sec"
     EM::timer 1 {
       out << "Ok! All done!"
     }
   }
 end
}
```

Lets say we want to close a resource after we're done streaming:

```ruby
run Renee.core {
 path('blog') do
   @db = DB.connect
   get{
     stream {|out|
      db.select("SELECT * FROM posts") do |row|
        out << row.to_json
      end
     }
     close! {
       @db.close
     }
    }
 end
}
```