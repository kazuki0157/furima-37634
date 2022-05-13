FactoryBot.define do
  factory :user do
    nickname              {'ユーザー１'}
    email                 {'test@example'}
    password              {'1q1q1q'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'1935-07-07'}
  end
end