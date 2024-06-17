package com.example.sample1app;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.persistence.NamedQuery;
import java.util.List;
import jakarta.persistence.CascadeType;
import jakarta.persistence.OneToMany;
import javax.validation.constraints.*;

@NamedQueries(
    @NamedQuery(name="findWithName", query = "from Person where name like :fname")
    )
@Entity
@Table(name="Person")
public class Person {

    @OneToMany(mappedBy = "Person")
    @Column(nullable = true)
    private List<Message> messages;

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column
    @NotNull
    private long id;

    @NotNull(message="名前は必須項目です")
    @Size(min=1, message="名前は必須項目です")
    private String name;

    @NotBlank(message="メールは必須項目です")
    @Email(message = "メールアドレスの形式が正しくありません")
    private String mail;

    @NotNull(message="年齢を入力してください")
    @Min(value = 0, message = "年齢は0以上でなければなりません")
    private Integer age;

    private String memo;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }

    public Integer getAge() {
        return age;
    }
    public void setAge(Integer age) {
        this.age = age;
    }

    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
}
