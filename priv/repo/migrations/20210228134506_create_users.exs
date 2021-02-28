defmodule Elxpay.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string, null: false
      add :birth_date, :date, null: false
      add :gender, :string

      add :email, :string, null: false
      add :username, :string, null: false, size: 15
      add :ecrypted_password, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:username])
  end
end
