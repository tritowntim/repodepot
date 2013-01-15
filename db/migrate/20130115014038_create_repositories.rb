class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :full_name
      t.string :owner_login
      t.string :name
      t.datetime :gh_created_at
      t.datetime :gh_updated_at
      t.datetime :pushed_at
      t.integer :watchers_count
      t.integer :forks_count
      t.integer :open_issues_count
      t.integer :network_count
      t.string :language
      t.text :description
      t.string :clone_url
      t.string :html_url

      t.timestamps
    end
  end
end
