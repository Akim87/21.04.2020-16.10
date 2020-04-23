#!/usr/bin/env sh

# ���������� ���������� ��� �������
set -e

# ������
npm run build

# ������� � ������� ������
cd dist

# ���� �� ���������� �� ���������������� �����
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# ���� �� ���������� �� ������ https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:Akim87/21.04.2020-16.10.git master:gh-pages

cd -