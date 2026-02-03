import {client} from "@repo/db/client"
export default async function Home(){
const user = await client.user.findFirst();
return(
  <div>
  {user?user.username : "hi"},
  {user?user.password : "hi"}
  </div>
)
}


// export const revalidate = 60 // revalidate every 60 seconds
// or
// export const dynamic = 'force-dynamic'