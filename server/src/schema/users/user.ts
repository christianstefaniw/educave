import { IsEmail, IsNotEmpty, Matches, validateOrReject } from "class-validator";
import { AfterLoad, BaseEntity, BeforeInsert, BeforeUpdate, Column, Entity, PrimaryColumn } from "typeorm";
import formatValidationErrors from "../../helpers/format_validation_errors";
import hashPassword from "../../helpers/hash_password";

@Entity()
class User extends BaseEntity {
    // temp password for detecting password change when updating
    private tempPassword!: string;

    @PrimaryColumn('uuid')
    id!: string;

    @Column()
    @IsNotEmpty()
    firstName!: string;

    @Column()
    @IsNotEmpty()
    lastName!: string;

    @Column()
    @IsEmail()
    email!: string;

    @Column()
    @Matches("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$", undefined, { message: 'Invalid password' })
    password!: string;

    @AfterLoad()
    private loadTempPassword(): void {
        this.tempPassword = this.password;
    }

    @BeforeInsert()
    @BeforeUpdate()
    private async hashPassword() {
        if (this.tempPassword != this.password)
            this.password = await hashPassword(this.password);
    }

    @BeforeInsert()
    @BeforeUpdate()
    async validate() {
        try {
            await validateOrReject(this);
        } catch (errors: any) {
            throw formatValidationErrors(errors);
        }
    }
}

export default User;