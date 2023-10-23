import React from "react";
import { useState } from "react";
import style from "./../../UserLogin/components/UserLogin.module.css"

const CreateProfileForm = (props) => {
  const handleSubmit = (e) => {
    e.preventDefault()
  }

  const [userInputs, setUserInputs] = useState({
    username: '',
    password: '',
  })

  return(
    <React.Fragment>
      <form onSubmit={event => handleSubmit(event)}>
        <div className={style.item}>
          <label className={style.attri} htmlFor="username">Username</label>
          <input id="username" type="text" onChange={e => setUserInputs({...userInputs, username: e.target.value})}/>
        </div>

        <div className={style.item}>
          <label className={style.attri} htmlFor='difficulty'>difficulty</label>
          <select onChange={e => setUserInputs({...userInputs, difficulty: e.target.value})}>
            { props.main_page_props.difficulties.map((difficulty) => {
              return(
                <option key={difficulty} value={difficulty}>{difficulty}</option>
              )
            })}
          </select>
        </div>

        {/* <div className={style.error_container}>
          { errorMessages.length > 0 && errorMessages.map((error_message) => {
            return(
              <p key={error_message}>
                {error_message }
              </p>
            )
          })}
        </div> */}
        <button className={style.submit}>Submit</button>
      </form>
    </React.Fragment>
  )
}

export default CreateProfileForm
