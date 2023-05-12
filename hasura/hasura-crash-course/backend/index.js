const express = require('express');
const app = express();
const sequelize = require('sequelize');

app.use(express.json());

const POSTGRES_CONNECTION_STRING = "postgres://postgres:postgrespassword@192.168.99.100:5432/postgres"

console.log("Hello");

app.post("/blog_post_event", async(req,res) => {
   let type;
   if(req.body.event.op === "INSERT"){
    console.log("insertttt")
    type = "created";
   }
   else if(req.body.event.op === "UPDATE"){
    if(req.body.event.data.old.is_published === true && req.body.event.data.new.is_published === false){
        type = "unpublished";
    }
    else if(req.body.event.data.old.is_published === false && req.body.event.data.new.is_published === true){
        type = "published";
    }
   }

   if(type) {
    const sequ = new sequelize(POSTGRES_CONNECTION_STRING, {})
    const blogPostId = req.body.event.data.new.id;
    await sequ.query("INSERT INTO blog_post_activity(blog_post_id,type) values (:blogPostId, :type);",{
         replacements: {
             blogPostId,
             type
         }
     })
    return res.status(200).json({
        message: "data"
    })
   }
})

app.post("/archive_posts", async (req, res) => {
    const sequ = new sequelize(POSTGRES_CONNECTION_STRING, {})
    const { age_in_second } = req.body.input;
    console.log(age_in_second)

    const metadata = await sequ.query(
        "UPDATE blog_post SET is_published = false WHERE date < now() - :age_in_second::INTERVAL;", {
            replacements:{
                age_in_second : age_in_second + " seconds"
            }
        }
    )
    // let { Result } = metadata[1]
    // console.log(metadata[1].rowCount);
    res.status(200).json({
        count: metadata[1].rowCount
    })
})

const server = app.listen(8000, () => {
    console.log("server listening on port 8000");
});
