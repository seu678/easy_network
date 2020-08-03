#chaincode insall
docker exec cli peer chaincode install -n mysacc -v 1.0 -p github.com/mysacc
#chaincode instatiate
docker exec cli peer chaincode instantiate -n mysacc -v 1.0 -C mychannel -c '{"Args":[]}' -P 'OR ("Org1MSP.member", "Org2MSP.member","Org3MSP.member")'
sleep 5
docker exec cli peer chaincode invoke -n mysacc -C mychannel -c '{"Args":["set","b","200"]}'
sleep 5
#chaincode query a
docker exec cli peer chaincode query -n mysacc -C mychannel -c '{"Args":["get","b"]}'
#chaincode query b
docker exec cli peer chaincode query -n mysacc -C mychannel -c '{"Args" : ["getAllKeys"]}'

echo '-------------------------------------END-------------------------------------'