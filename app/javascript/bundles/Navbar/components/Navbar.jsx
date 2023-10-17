import React from "react";
import style from "./Navbar.module.css"

const Navbar = (props) => {
  return(
    <div className={style.navbar}>
      <div className={style.holder}>
        <span className={style.item}>
          <a href="/"><i class="fa-solid fa-dice-d20" /></a> {props.logged_in && props.username}
        </span>
      </div>

      <div className={style.holder}>
        {props.logged_in &&
          <React.Fragment>
             <span className={`${style.item} ${style.first}`}>
              <a href="/logout"> Log Out <i className="fa-solid fa-arrow-right-from-bracket" /></a>
            </span >
          </React.Fragment>
        }

        { !props.logged_in &&
          <React.Fragment>
            <span className={`${style.item} ${style.first}`}>
            <a href="/login"> Log In <i className="fa-solid fa-arrow-right-to-bracket" /></a>
            </span >

            <span className={`${style.item}`}>
            <a href="/registration/new"> Sign Up <i className="fa-solid fa-user-plus" /></a>
            </span >
          </React.Fragment>
        }
        <span className={`${style.item}`}>
          <i className="fa-solid fa-gear" />
        </span >
      </div>
    </div>
  )
}

export default Navbar
