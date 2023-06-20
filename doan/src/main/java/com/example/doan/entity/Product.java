package com.example.doan.entity;

import com.example.doan.Validator.annotation.ValidCategoryId;
import com.example.doan.Validator.annotation.ValidUserId;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name ="product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Column(name =  "name")
    private String name;

    @Column(name = "image")
//    @NotEmpty(message = "image must not be empty")
    private String image;

    @Column (name = "price")
    @NotNull(message = "Price is required")
    private  Double price;



    @ManyToOne
    @JoinColumn(name = "category_id")
    @ValidCategoryId
    private Category category;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ValidUserId
    private User user;
}
