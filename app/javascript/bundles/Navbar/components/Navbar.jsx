import React from "react";
import style from "./Navbar.module.css"

const Navbar = (props) => {
  return(
    <div className={style.navbar}>
      <div className={style.holder}>
        <span className={style.item}>
          <a href="/"><i class="fa-solid fa-dice-d20" /></a>
        </span>
      </div>

      <div className={style.holder}>
        <span className={`${style.item} ${style.first}`}>
         Log In <i className="fa-solid fa-arrow-right-to-bracket" />
        </span >

        <span className={`${style.item}`}>
         <a href="/registration/new">Sign Up <i className="fa-solid fa-user-plus" /></a>
        </span >

        <span className={`${style.item}`}>
          <i className="fa-solid fa-gear" />
        </span >
      </div>
    </div>
  )
}

export default Navbar
