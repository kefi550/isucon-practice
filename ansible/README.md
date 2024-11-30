## usage
`./hosts` に対象のサーバを書く
```hosts
[defaults]
your-server-hostname
```

`secret-example` を参考に `secret`ファイルを準備する
```
cp secret-example secret
```

初回のみローカルのsshconfigをいいかんじにしとく必要ある

```
Host isu1
    HostName <isu1-publicip>

Host isu2
    HostName <isu2-publicip>

Host isu3
    HostName <isu3-publicip>
```

```
ansible-playbook -e @secret site.yml
```
