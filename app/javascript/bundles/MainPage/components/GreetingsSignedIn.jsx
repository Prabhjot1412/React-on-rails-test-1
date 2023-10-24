import React, { useState } from "react";
import style from "./MainPage.module.css"
import buttonStyle from "./../../UserLogin/components/UserLogin.module.css"
import CreateProfileForm from "./CreateProfileForm";

const GreetingsSignedIn = (props) => {
  const handleModalDisplay = (e) => {
    let modal = document.getElementById('basemodal')

    if ( validateClose(e.target) ) {
      modal.style.display = 'none'
    } else {
      modal.style.display = 'block'
    }
  }

  const validateClose = (target) => {
    return (target.id == 'basemodal' || target.id == 'close')
  }

  return(
    <div className={style.cont}>
      <div className={`${style.cont_item} ${style.border_right}`}>
        <h1>Profiles</h1>
        { props.profile.length == 0 &&
          <>
            <p>You don't have any profiles yet</p>
            <button
              className={buttonStyle.submit}
              onClick={ (e) => { handleModalDisplay(e) } }
            > Create now </button>
          </>
        }
        <div className={style.modal} onClick={ (e) => handleModalDisplay(e) } id="basemodal">
              <div className={style.modal_content} id="dont_close_when_clicked">
                <div style={ {textAlign: "right"} }>
                  <span onClick={ (e) => handleModalDisplay(e)} id="close" className={style.close}>X</span>
                </div>
                <h1>Create new Profile</h1>
                <CreateProfileForm main_page_props={props}/>
              </div>
            </div>
        { props.profile.length > 0 &&
          <>
            {props.profile.map((profile) => {
              return(
                <div key={profile.username} className={style.profile_container}>
                  <p>Profile name: {profile.username}</p>
                  <p>difficulty: {profile.difficulty}</p>
                </div>
              )
            })}
            <div
              className={style.add_profile}
              onClick={(e) => handleModalDisplay(e)}
            >
              <i class="fa-solid fa-plus"></i>
            </div>
          </>
        }
      </div>
      <div className={style.cont_item}>
        <h1>Character</h1>
      </div>
    </div>
  )
}

export default GreetingsSignedIn
