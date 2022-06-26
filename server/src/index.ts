import express from "express";
import { graphqlHTTP } from "express-graphql";

import { sqlDataSource } from "./data_source";
import schema from "./schema";

const main = async () => {
    sqlDataSource.initialize().then(() => {
        const app = express();

        app.use("/gql",
            graphqlHTTP({
                schema: schema,
                graphiql: {
                    headerEditorEnabled: true
                },
            }));

        app.listen(3001, () => {
            console.log("SERVER RUNNING ON PORT 3001");
        });
    });
};


main().catch((err) => {
    console.log(err);
})