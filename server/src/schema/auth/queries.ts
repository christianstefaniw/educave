import { GraphQLString } from "graphql";
import { AuthUserType } from "./types";

const LOGIN = {
    type: AuthUserType,
    args: {
        email: { type: GraphQLString },
        password: { type: GraphQLString },
    },
    async resolve() {

    }
}


const queries = {
    login: LOGIN
};

export default queries;