
import { WebSocketServer } from "ws";
import {client} from "@repo/db/client"
const wss= new WebSocketServer({port:8081});
wss.on("connection",async function(socket){
     socket.send("hi")
     await client.user.create({
        data:{
         username: `${Math.random}+as`,
         password:"1234"
        }
     })
})