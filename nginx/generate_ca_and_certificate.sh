link2="/C=FR/ST=Val-de-Marne/L=Kremlin-Bicetre/O=EPITA/OU=NET2/CN=net2.example.org"
link="/C=FR/ST=Val-de-Marne/L=Kremlin-Bicetre/O=EPITA/OU=NET2/CN=NET2"
part1()
{
    openssl req -nodes -x509 -newkey rsa:2048 -keyout ca.key -out ca.crt -subj $link
    part2 net2.example.org.csr net2.example.org.key
}
part2()
{
    openssl req -nodes -newkey rsa:2048 -keyout $2 -out $1 -subj $link2
    part3 net2.example.org.csr  net2.example.org.crt
}

part3()
{
    openssl x509 -req -in $1  -CA ca.crt -CAkey ca.key -CAcreateserial -out $2
    clean
}
clean()
{
    echo -n
}
part1

