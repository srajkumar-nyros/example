class CreateHtmlpages < ActiveRecord::Migration
  def change
    create_table :htmlpages do |t|
      t.string :library
      t.text :css
      t.text :js
      t.text :html

      t.timestamps
    end
  end
end
