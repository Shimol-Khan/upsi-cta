import React from 'react';
import styles from './Footer.module.css';

const Footer = () => {
	return(
		<div className={styles.container}>
			<p>A Project of MES3073 in Favour of Dr. Aslina Binti Saad</p>
			<p>Universiti Pendidikan Sultan Idris (UPSI), Tanjung Malim, 35900, Perak, Malaysia</p>
			<p>Contribute Here 
				<a href="https://github.com/Shimol-Khan/upsi-cta" className={styles.icon} target="_blank"><span><i className="fab fa-github"></i></span></a>
			</p>
		</div>
	)
}
export default Footer;