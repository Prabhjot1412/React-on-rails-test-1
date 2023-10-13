import React from "react";
import style from "./Navbar.module.css"

const Navbar = (props) => {
  return(
    <div className={style.navbar}>
      <span className={style.item}>
      <i class="fa-solid fa-dice-d20" />
      </span>
      <span className={`${style.item} ${style.first}`}>
      <i class="fa-solid fa-gear" />
      </span >
    </div>
  )
}

export default Navbar
