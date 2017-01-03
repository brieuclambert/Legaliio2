class CreateBiens < ActiveRecord::Migration[5.0]
  def change
    create_table :biens do |t|
      t.string :name
      t.integer :valeur_empr
      t.integer :prix_acq
      t.integer :valeur_act
      t.integer :profit_sub
      t.references :dossier, foreign_key: true

      t.timestamps
    end
  end
end
