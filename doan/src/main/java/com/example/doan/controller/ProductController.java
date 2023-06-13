package com.example.doan.controller;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.example.doan.model.Product;
import com.example.doan.services.ProductService;
import com.example.doan.services.CategoryService;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String listBook(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        model.addAttribute("name", "Product List");
        return "product/list";
    }
        @GetMapping("/add")
        public String addProductForm(Model model){
        model.addAttribute("product", new Product());
        model.addAttribute("categories",categoryService.getAllCategories());
        return "product/add";
        }
      @PostMapping("/add")
      public String addProduct(@Valid  @ModelAttribute("product") Product product,
                               @RequestParam MultipartFile ImageProduct,
                               BindingResult result ,
                               Model model){
        if(result.hasErrors()){
            model.addAttribute("categories",categoryService.getAllCategories());
            return "product/add";
        }
        if(ImageProduct != null && ImageProduct.isEmpty())
        {
            try
            {
                File savaFile = new ClassPathResource("static/img").getFile();
                String newImageFile = UUID.randomUUID() + ".png";
                Path path = Paths.get(savaFile.getAbsolutePath()+File.separator + newImageFile);
                Files.copy(ImageProduct.getInputStream(),path, StandardCopyOption.REPLACE_EXISTING);
                product.setImage(newImageFile);
            }
            catch (Exception ex)
            {
                ex.printStackTrace();
            }
        }
        productService.addProduct(product);
        return "redirect:/products";
        }


    @GetMapping("/edit/{id}")
    public String editProductForm(@PathVariable("id") long id, Model model){
        Product editProduct = productService.getProductById(id);
        if(editProduct != null){
            model.addAttribute("product", editProduct);
            model.addAttribute("categories", categoryService.getAllCategories());
            return "product/edit";
        }else {
            return "not-found";
        }
    }
        @PostMapping("/edit")
        public String editProduct( @Valid @ModelAttribute("product") Product updateProduct,BindingResult result, Model model){
            if(result.hasErrors()){
                model.addAttribute("categories",categoryService.getAllCategories());
                return "product/edit";
            }
        productService.getAllProducts().stream()
                .filter(product -> product.getId() == updateProduct.getId())
                .findFirst()
                .ifPresent(book -> {productService.updateProduct(updateProduct);});
            return "redirect:/books";
        }

        @PostMapping("/delete/{id}")
        public String deleteProduct(@PathVariable("id") Long id){
            productService.deleteProduct(id);
            return "redirect:/products";
        }

}
