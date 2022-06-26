import { GraphQLObjectType, GraphQLString } from "graphql";
import { UserType } from "../users/types";

export const AuthUserType = new GraphQLObjectType({
    name: 'AuthUser',
    fields: {
        user: { type: UserType },
        token: { type: GraphQLString }
    }
});