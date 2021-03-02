defmodule Elxpay.User do
  use Ecto.Schema
  use EnumType

  import Ecto.Changeset

  alias Ecto.Changeset

  @year_in_days 365
  @adult_age 18

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields [:name, :birth_date, :email, :username, :password]

  @optional_fields [:gender]

  defenum Gender do
    value Female, "female"
    value Male, "male"
    value Other, "other"
    value PreferNotToSay, "prefer not to say"
  end

  schema "users" do
    field :name, :string
    field :birth_date, :date
    field :gender, Gender

    field :email, :string
    field :username, :string

    field :password, :string, virtual: true
    field :ecrypted_password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:username, max: 15)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> Gender.validate(:gender)
    |> must_be_at_least_eighteen_years_old()
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_ecrypted_password()
  end

  defp must_be_at_least_eighteen_years_old(changeset) do
    validate_change(changeset, :birth_date, fn :birth_date, birth_date ->
      age = Date.utc_today() |> Date.diff(birth_date) |> div(@year_in_days)

      if age < @adult_age, do: [birth_date: "must be at least 18 years old"], else: []
    end)
  end

  defp put_ecrypted_password(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    %{password_hash: ecrypted_password} = Bcrypt.add_hash(password)

    change(changeset, ecrypted_password: ecrypted_password)
  end

  defp put_ecrypted_password(changeset), do: changeset
end
