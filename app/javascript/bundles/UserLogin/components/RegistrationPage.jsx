import React from "react";
import { useState } from "react";
import style from "./UserLogin.module.css"

const RegistrationPage = (props) => {
  const [username, setUsername] = useState('')
  const [password, setPassword] = useState('')

  const handleSubmit = (e) => {
    e.preventDefault()
    fetch(props.create_path, {
      method: "POST",
      body: JSON.stringify({
        username: username,
        password: password
      }),
      headers: {
        "Content-type": "application/json; charset=UTF-8",
        'X-CSRF-TOKEN': props.csrf_token
      }
    }).then((_) => {
      location.href = props.redirect_path;
    });
  }

  return (
    <div>
      <div className={style.container}>
        <h1>Registration</h1>
        <form onSubmit={event => handleSubmit(event)}>
          <div className={style.item}>
            <label className={style.attri} htmlFor="username">Username</label>
            <input id="username" type="text" onChange={event => setUsername(event.target.value)}/>
          </div>

          <div className={style.item}>
            <label className={style.attri} htmlFor='password'>Password</label>
            <input id="password" type='password' onChange={event => setPassword(event.target.value)}/>
          </div>
          <button className={style.submit}>Submit</button>
        </form>
      </div>
    </div>
  );
}

export default RegistrationPage;
