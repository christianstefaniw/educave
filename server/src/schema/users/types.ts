import { GraphQLObjectType, GraphQLString } from "graphql";

export const UserType = new GraphQLObjectType({
    name: 'User',
    fields: () => ({
        firstName: { type: GraphQLString },
        lastName: { type: GraphQLString },
        password: { type: GraphQLString },
    }),
})