# Warm Up
## Printing Comments


You are working with an API for a popular site where people submit a link, title it, and then other people can comment on it. You make a request for a particular post and you get a result that looks like the following:


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
	
	

Your job is to print the post and title with all its comments to the console, and keep in mind that any comment can have comments.


```
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
end

def print_post(post_results)
	# print your post
end
