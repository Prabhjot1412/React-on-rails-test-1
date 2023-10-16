import React from "react";
import style from "./Navbar.module.css"

const Navbar = (props) => {
  return(
    <div className={style.navbar}>
      <div className={style.holder}>
        <span className={style.item}>
          <i class="fa-solid fa-dice-d20" />
        </span>
      </div>

      <div className={style.holder}>
        <span className={`${style.item} ${style.first}`}>
          <i class="fa-solid fa-gear" />
        </span >
      </div>
    </div>
  )
}

export default Navbar
