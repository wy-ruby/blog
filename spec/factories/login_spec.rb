require 'rails_helper'

describe '登录功能', type: :feature do
  let(:user) { create(:user) }

  before { visit new_user_session_path }

  it { expect(page).to have_selector('h1', text: '登录') }

  it '没有填任何信息就点登录' do
    click_button '登录'
    expect(page).to have_content('登录账号或密码错误')
  end

  it '输入邮箱成功登录' do
    within('#new_user') do
      fill_in 'user_login', with: user.email
      fill_in 'user_password', with: user.password
    end
    click_button '登录'
    expect(page).to have_content '登录成功'
    expect(page).to have_current_path(root_path)
  end

  it '输入用户名成功登录' do
    within('#new_user') do
      fill_in 'user_login', with: user.username
      fill_in 'user_password', with: user.password
    end
    click_button '登录'
    expect(page).to have_content '登录成功'
    expect(page).to have_link('注销')
    expect(page).to have_current_path(root_path)
  end

  it '密码错误的失败登录' do
    within('#new_user') do
      fill_in 'user_login', with: user.email
      fill_in 'user_password', with: 'wrong_password'
    end
    click_button '登录'
    expect(page).to have_content '登录账号或密码错误'
    expect(page).to have_current_path(user_session_path)
  end

end
