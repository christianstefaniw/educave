import { IsNotEmpty, Matches } from "class-validator";
import { BaseEntity, Column, Entity, PrimaryColumn } from "typeorm";

@Entity()
class User extends BaseEntity {
    @PrimaryColumn('uuid')
    id!: string;

    @Column()
    @IsNotEmpty()
    firstName!: string;

    @Column()
    @IsNotEmpty()
    lastName!: string;

    @Column()
    @Matches("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$", undefined, { message: 'Invalid password' })
    password!: string;
}

export default User;