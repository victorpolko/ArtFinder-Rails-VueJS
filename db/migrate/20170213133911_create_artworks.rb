class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string   :title,     default: '',    null: false
      t.string   :artist,    default: '',    null: false
      t.integer  :year,      default: 1900,  null: false
      t.string   :mediums,   default: '',    null: false
      t.boolean  :published, default: false, null: false

      t.timestamps                           null: false
    end
  end
end
