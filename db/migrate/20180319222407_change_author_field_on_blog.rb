class ChangeAuthorFieldOnBlog < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :author, :string
    add_reference :blogs, :author, index: true
  end
end
