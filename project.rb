class User
  attr_accessor :id
  attr_accessor :user_name
  attr_accessor :created_at

end

class UserService
  @@current_user = nil
  @@users = []
  def self.create(user_name)
    user = User.new()
    if @@users.empty?
      user.id = 1
      user.user_name = user_name
      user.created_at = Time.now()
    else
      user.id = @@users[@@users.length - 1].id + 1
      user.user_name = user_name
      user.created_at = Time.now()
    end
    @@users.push(user)
    true
  end

  def self.find(user_name):
    arr = @@users.filter(|u| u.user_name == user_name)
    if arr.empty?
      retuen nil
    end
    
    return arr[0]
  end

  def self.login(user_name)
    user = UserService.find(user_name)
    if user.present?
      @@current_user = user
      true
    else
      false
    end
  end

  def self.get_current_user
    @@current_user
  end
end

class Post
  attr_accessor :id
  attr_accessor :user_id
  attr_accessor :title
  attr_accessor :upvote
  attr_accessor :downvote
  attr_accessor :created_at
  

end

class PostService
 
  def create(user_id, title)
    post = Post.new()
    if @posts.empty?
      post.id = 1
      post.user_id = user_id
      post.title = title
      post.created_at = Time.now()
    else
      post.id = @posts[@posts.length - 1].id + 1
      post.user_id = user_id
      post.title = title
      post.created_at = Time.now()
    end
    @posts.push(post)
  end

end

class Comment
  attr_accessor :id
  attr_accessor :post_id
  attr_accessor :content
  attr_accessor :downvote
  attr_accessor :upvote
  attr_accessor :created_at
end


class PostService
  attr_accessor :current_user
  def initialize
    @comments = []
  end
  def create(post_id, content)
    comment = Comment.new()
    if @comments.empty?
      comment.id = 1
      comment.post = user_id
      comment.content = content
      comment.created_at = Time.now()
    else
      comment.id = @comments[@comments.length - 1].id + 1
      coment.post_id = post_id
      comment.content = content
      comment.created_at = Time.now()
    end
    @comments.push(comment)
  end


end

class Command

  def initialize(coomand)
    args = command.split("~")
    case args[0]
    when "signup"
      if UserService.find(args[0]).present?
        print "cannot signup"
      else
        UserService.create(args[0])
    when "login"
      if !UserService.login(user_name)

        print(" not sign up")
      end

    when "post"

    when "follow"

    when "reply"

    
    when "upvote"

    when "downvote"

    when "shownewsfeed"
    
    else

    end

  end
end

  