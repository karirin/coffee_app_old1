# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = post(:post_1)
  end

  test 'should get new' do
    get new_post_path
    assert_template 'posts/new'
  end

  test 'should get index' do
    get post_path
    assert_template 'posts/index'
  end

  test 'should get confirm' do
    post posts_path
    assert_template 'posts/confirm'
  end
end
