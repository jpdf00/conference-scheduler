require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/lectures", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Lecture. As you add validations to Lecture, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Lecture.create! valid_attributes
      get lectures_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      lecture = Lecture.create! valid_attributes
      get lecture_url(lecture)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_lecture_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      lecture = Lecture.create! valid_attributes
      get edit_lecture_url(lecture)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Lecture" do
        expect {
          post lectures_url, params: { lecture: valid_attributes }
        }.to change(Lecture, :count).by(1)
      end

      it "redirects to the created lecture" do
        post lectures_url, params: { lecture: valid_attributes }
        expect(response).to redirect_to(lecture_url(Lecture.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Lecture" do
        expect {
          post lectures_url, params: { lecture: invalid_attributes }
        }.to change(Lecture, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post lectures_url, params: { lecture: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested lecture" do
        lecture = Lecture.create! valid_attributes
        patch lecture_url(lecture), params: { lecture: new_attributes }
        lecture.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the lecture" do
        lecture = Lecture.create! valid_attributes
        patch lecture_url(lecture), params: { lecture: new_attributes }
        lecture.reload
        expect(response).to redirect_to(lecture_url(lecture))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        lecture = Lecture.create! valid_attributes
        patch lecture_url(lecture), params: { lecture: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested lecture" do
      lecture = Lecture.create! valid_attributes
      expect {
        delete lecture_url(lecture)
      }.to change(Lecture, :count).by(-1)
    end

    it "redirects to the lectures list" do
      lecture = Lecture.create! valid_attributes
      delete lecture_url(lecture)
      expect(response).to redirect_to(lectures_url)
    end
  end
end
