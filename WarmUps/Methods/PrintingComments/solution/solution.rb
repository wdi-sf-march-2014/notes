    post_results = {post: "www.reddit.com",
                    title: "sharing links",
                    comments: [
                        {name: "Jane doe",
                        comment: "just like this site"}, 
                        {name: "John doe",
                        comment: "Yeah, soo fun",
                        comments: [
                            {name: "Bob doe",
                            comment: "agreed! cannot stop clicking!"},
                            {name: "Kelly doe",
                            comment: "carpel tunnel cannot from clicking!"},
                            {name: "Chris doe",
                            comment: "Is it better though?",
                            comments: [
                                {name: "Jane doe",
                                comment: "yes, it is."} 
                            ]
                            }
                        ]
                        },
                        {name: "Peter doe",
                        comment: "lame!",
                        comments: [
                            {name: "Sam doe",
                            comment: "hater's gonna hate"}
                        ]
                        }

                    ]}


def print_comment(comments)
    # print your comments
    comments.each do |comment|
        puts "*"*50
        puts comment[:name]
        puts comment[:comment]
        if comment[:comments]
            puts "*"*25 + "SubComments" + "*"*25
            print_comment comment[:comments]
        end
    end
end

def print_post(post_results)
    puts post_results[:post]
    print_comment(post_results[:comments])
end

print_post post_results