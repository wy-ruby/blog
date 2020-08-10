# == Schema Information
#
# Table name: users
#
#  id                                            :bigint           not null, primary key
#  address(用户所在地)                           :string(100)      default(""), not null
#  birthday(用户的生日)                          :integer
#  confirmation_sent_at(确认信息发送时间)        :datetime
#  confirmation_token(确认时的token信息)         :string
#  confirmed_at(确认时间)                        :datetime
#  current_sign_in_at(本次登陆时间)              :datetime
#  current_sign_in_ip(本次登陆ip地址)            :string
#  description(用户的自我描述)                   :string           default(""), not null
#  email(邮箱)                                   :string           default(""), not null
#  encrypted_password(加密密码)                  :string           default(""), not null
#  failed_attempts(失败次数)                     :integer          default(0), not null
#  head_image_url(用户的头像路径)                :string           default(""), not null
#  image(授权用户的头像地址)                     :string
#  last_sign_in_at(上次登陆时间)                 :datetime
#  last_sign_in_ip(上次登陆ip地址)               :string(25)
#  last_update_time(用户上次更新博客时间)        :datetime
#  local(用户的语言偏好设置)                     :string(10)       default("zh-CN"), not null
#  locked_at(锁定时间)                           :datetime
#  name(用户名)                                  :string
#  phone(用户手机号)                             :string(11)
#  provider(三方登录提供商)                      :string
#  remember_created_at(用户创建时间)             :datetime
#  reset_password_sent_at(重置密码发送时间)      :datetime
#  reset_password_token(重置密码token)           :string
#  school(用户的学校)                            :string(100)      default(""), not null
#  sex(用户性别: 1(男)，2(女))                   :integer
#  sign_in_count(登陆次数)                       :integer          default(0), not null
#  status(用户账户状态: false(冻结), true(正常)) :boolean          default(TRUE), not null
#  uid(授权用户的uid)                            :string
#  unconfirmed_email(未点击确定的邮箱)           :string
#  unlock_token(解锁token)                       :string
#  wechat_image_url(用户的微信二维码)            :string           default(""), not null
#  weibo(用户的微博)                             :string(50)       default(""), not null
#  created_at                                    :datetime         not null
#  updated_at                                    :datetime         not null
#  roles_id(用户角色)                            :bigint
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_roles_id              (roles_id)
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#

class User < ApplicationRecord
  # 这个是 rolify 中的一些方法的导入
  rolify

  # 在rails 3.0以上版本中，ActiveModel::SecurePassword就使用bcrypt密码验证。不过也需要在gemfile中引入 gem 'bcrypt'
  # 需要在users表中添加 password_digest 字段，如果是password字段也是会报错的，只能是password_digest字段。
  # 当 has_secure_password 使用的时候就会载入bcrypt gem，并且该方法会给user添加两个虚拟属性password和password_confirmation,
  # 创建user的时候会执行存在性验证和匹配验证，同时会获得authenticate方法(根据密码验证)，如果密码正确，返回对应的用户对象，否则返回false
  # 例如：
  # user = User.new(name: 'david', password: 'mUc3m00RsqyRe', password_confirmation: 'mUc3m00RsqyRe')
  # user.save  # 实际是对虚拟属性password进行加密，把加密后的内容保存到password_digest字段中。
  # user.authenticate('notright')      # => false
  # user.authenticate('mUc3m00RsqyRe') # => user
  # user.password  # => "mUc3m00RsqyRe" 对password_digest解密后的密码
  # user.password_digest # => "$2a$10$4LEA7r4YmNHtvlAvHhsYAeZmk/xeUVtMTYqwIvYY76EW5GUqDiP4." 对password加密后的密码
  #
  # has_secure_password

  # Include default devise modules. Others available are:
  # Database Authenticatable: 登录时加密密码并在数据库中验证用户真实性。
  # Omniauthable: 添加 Omniauth (github.com/intridea/omniauth) 支持。
  # Confirmable： 发送验证邮件，在登录时检查账户是否已经验证。
  # Recoverable： 重置用户密码并发送重制指令。
  # Rememberable：管理产生和清除表示来自用户保存的 cookie 的 token。
  # Trackable： 追踪登录的次数、时间戳和 IP 地址。
  # Timeoutable： 超时重新登录。
  # Validatable： 提供的电子邮件及密码鉴定。该功能可定制。
  # Encryptable: 除了内置的 Bcrypt (默认)，增加支持认证机制。
  # Lockable: 锁定一定数量的失败尝试登录。通过电子邮件验证后解锁。
  # Registerable： 处理用户注册过程,也可以让他们编辑和注销他们的帐户。
  # Token Authenticatable: 基于 token 的用户登录(也被称为 "single access token")。token 可以通过查询字符串或 HTTP 基本身份认证。
  #
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable, :confirmable, :lockable, :trackable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %w[github wechat]

  # User 的关联关系
  has_many :articles
  has_many :secret_messages
  has_many :comments
  has_many :categories
  has_many :system_messages
  has_many :user_relations
  has_many :visitors
  has_one :blog_info
  has_many :operation_logs, as: :operation

  # 处理omniauth的登录时初始化数据
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # Devise的RegistrationsController会在构建资源之前调用User.new_with_session
  # 这意味着，如果在注册之前初始化用户时需要从会话中复制数据，则只需在模型中实现new_with_session即可。
  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"])
        user.email = data["email"] if user.email.blank?
      end
    end
  end


end
