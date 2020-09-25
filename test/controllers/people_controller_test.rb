require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url, as: :json
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { Aliases: @person.Aliases, FirstName: @person.FirstName, LastName: @person.LastName, MoviesAsActor_id: @person.MoviesAsActor_id, MoviesAsDirector_id: @person.MoviesAsDirector_id, MoviesAsProduces_id: @person.MoviesAsProduces_id, id: @person.id } }, as: :json
    end

    assert_response 201
  end

  test "should show person" do
    get person_url(@person), as: :json
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { Aliases: @person.Aliases, FirstName: @person.FirstName, LastName: @person.LastName, MoviesAsActor_id: @person.MoviesAsActor_id, MoviesAsDirector_id: @person.MoviesAsDirector_id, MoviesAsProduces_id: @person.MoviesAsProduces_id, id: @person.id } }, as: :json
    assert_response 200
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person), as: :json
    end

    assert_response 204
  end
end
