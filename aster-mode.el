;; aster-mode.el --- Aster Mode (Modified from Cython mode)
;;

;; Maintainer: Stefan Reiterer <stefan.harald.reiterer@gmail.com>
;; Keywords: languages, processes, python, oop, Code_Aster

;; Copyright (C) 2014  Stefan Reiterer

;; Author: 2014 Stefan Reiterer
;;    
;; This program is free software: you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation, either version 3 of the License, or
;;    (at your option) any later version.
;;
;;    This program is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.
;;
;;    You should have received a copy of the GNU General Public License
;;    along with this program.  If not, see <http://www.gnu.org/licenses/>.


;; Load python-mode if available, otherwise use builtin emacs python package
(when (not(require 'python-mode nil t))
  (require 'python))

(add-to-list 'auto-mode-alist '("\\.comm\\'" . aster-mode))
(add-to-list 'auto-mode-alist '("\\.mess\\'" . aster-mode))

;; Aster Keyword Collection
(setq aster-keywords '(
"ASSEMBLAGE"
"CALC_CHAMP" 
"AFFE_CHAR_CINE_F" 
"AFFE_CHAR_MECA_F"
"AFFE_CHAR_THER_F" 
"POST_CHAMP"
"AFFE_CARA_ELEM" 
"AFFE_CHAR_ACOU" 
"AFFE_CHAR_CINE" 
"AFFE_CHAR_MECA" 
"AFFE_CHAR_MECA_C" 
"AFFE_CHAR_THER" 
"AFFE_MATERIAU" 
"AFFE_MODELE" 
"MACRO_MATR_ASSE" 
"ASSE_ELEM_SSD" 
"ASSE_MAILLAGE" 
"ASSE_MATRICE" 
"ASSE_MATR_GENE" 
"ASSE_VECTEUR" 
"ASSE_VECT_GENE" 
"CALCUL" 
"CALC_AMOR_MODAL" 
"CALC_CHAMP" 
"CALC_CHAM_ELEM" 
"CALC_CHAR_CINE" 
"CALC_CHAR_SEISME" 
"CALC_CORR_SSD" 
"CALC_ERREUR" 
"CALC_ESSAI" 
"CALC_ESSAI_GEOMECA" 
"CALC_EUROPLEXUS" 
"CALC_FATIGUE" 
"CALC_FERRAILLAGE" 
"CALC_FLUI_STRU" 
"CALC_FONCTION" 
"CALC_FONC_INTERP" 
"CALC_FORC_AJOU" 
"CALC_FORC_NONL" 
"CALC_G" 
"CALC_GP" 
"CALC_IFS_DNL" 
"CALC_INTE_SPEC" 
"CALC_MAC" 
"CALC_MATR_AJOU" 
"CALC_MATR_ELEM" 
"CALC_META" 
"CALC_MISS" 
"CALC_MODAL" 
"CALC_MODE_ROTATION" 
"CALC_PRECONT" 
"CALC_SPEC" 
"CALC_TABLE" 
"CALC_THETA" 
"CALC_VECT_ELEM" 
"CHAINAGE_THM" 
"COMB_FOURIER" 
"COMB_MATR_ASSE" 
"COMB_SISM_MODAL" 
"COPY" 
"CREA_CHAMP" 
"CREA_ELEM_SSD" 
"CREA_MAILLAGE" 
"CREA_RESU" 
"CREA_TABLE" 
"DEBUG" 
"DEBUT" 
"DEFI_BASE_MODALE" 
"DEFI_CABLE_BP" 
"DEFI_COMPOR" 
"DEFI_COQU_MULT" 
"DEFI_CONSTANTE" 
"DEFI_CONTACT" 
"DEFI_FICHIER" 
"DEFI_FISS_XFEM" 
"DEFI_FLUI_STRU" 
"DEFI_FONCTION" 
"MK" 
"DEFI_FONC_FLUI" 
"DEFI_FOND_FISS" 
"DEFI_GEOM_FIBRE" 
"DEFI_GLRC" 
"DEFI_GRILLE" 
"DEFI_GROUP" 
"DEFI_INTERF_DYNA" 
"DEFI_INTE_SPEC" 
"DEFI_LIST_ENTI" 
"DEFI_LIST_INST" 
"DEFI_LIST_REEL" 
"DEFI_MAILLAGE" 
"DEFI_MATERIAU" 
"DEFI_MATER_GC" 
"DEFI_MODELE_GENE" 
"DEFI_NAPPE" 
"DEFI_OBSTACLE" 
"DEFI_PART_FETI" 
"DEFI_SOL_MISS" 
"DEFI_SPEC_TURB" 
"DEFI_SQUELETTE" 
"DEFI_TRC" 
"DEPL_INTERNE" 
"DETRUIRE" 
"DYNA_ALEA_MODAL" 
"DYNA_ISS_VARI" 
"DYNA_LINE_HARM" 
"DYNA_LINE_TRAN" 
"DYNA_NON_LINE" 
"DYNA_SPEC_MODAL" 
"DYNA_TRAN_MODAL" 
"DYNA_VIBRA" 
"ENGENDRE_TEST" 
"ENV_CINE_YACS" 
"EXEC_LOGICIEL" 
"EXTR_MODE" 
"EXTR_RESU" 
"EXTR_TABLE" 
"FACTORISER" 
"FIN" 
"FONC_FLUI_STRU" 
"FORMULE" 
"GENE_ACCE_SEISME" 
"GENE_FONC_ALEA" 
"GENE_MATR_ALEA" 
"GENE_VARI_ALEA" 
"GMSH" 
"IMPR_CO" 
"IMPR_DIAG_CAMPBELL" 
"IMPR_FONCTION" 
"IMPR_GENE" 
"IMPR_JEVEUX" 
"IMPR_MACR_ELEM" 
"IMPR_MAIL_YACS" 
"IMPR_MISS_" 
"IMPR_OAR" 
"IMPR_RESU" 
"IMPR_RESU" 
"IMPR_RESU" 
"IMPR_RESU" 
"IMPR_RESU" 
"IMPR_TABLE" 
"INCLUDE" 
"INCLUDE_MATERIAU" 
"INFO_EXEC_ASTER" 
"INFO_FONCTION" 
"IMPR_STURM" 
"INFO_RESU" 
"INTE_MAIL_" 
"INTE_MAIL_" 
"LIRE_CHAMP" 
"LIRE_FONCTION" 
"LIRE_FORC_MISS" 
"LIRE_IMPE_MISS" 
"LIRE_INTE_SPEC" 
"LIRE_MAILLAGE" 
"LIRE_MAILLAGE" 
"LIRE_MISS_" 
"LIRE_PLEXUS" 
"LIRE_RESU" 
"LIRE_TABLE" 
"MACRO_ELAS_MULT" 
"MACRO_EXPANS" 
"MACRO_MATR_AJOU" 
"MACRO_MISS_" 
"MACRO_MODE_MECA" 
"MACR_ADAP_MAIL" 
"CF" 
"CF" 
"PC" 
"PC" 
"MACR_CARA_POUTRE" 
"MACR_ECLA_PG" 
"MACR_ECREVISSE" 
"MACR_ELEM_DYNA" 
"MACR_ELEM_STAT" 
"MACR_INFO_MAIL" 
"MACR_LIGN_COUPE" 
"MACR_RECAL" 
"MACR_SPECTRE" 
"MAC_MODES" 
"MAJ_CATA" 
"MECA_STATIQUE" 
"MODE_ITER_CYCL" 
"MODE_ITER_INV" 
"MODE_ITER_SIMULT" 
"MODE_STATIQUE" 
"MODI_BASE_MODALE" 
"MODI_CHAR_YACS" 
"MODI_MAILLAGE" 
"MODI_MODELE" 
"MODI_MODELE_XFEM" 
"MODI_OBSTACLE" 
"MODI_REPERE" 
"NORM_MODE" 
"NUME_DDL" 
"NUME_DDL_GENE" 
"OBSERVATION" 
"PERM_MAC" 
"POST_BORDET" 
"POST_CHAMP" 
"POST_CHAM_XFEM" 
"POST_COQUE" 
"POST_DECOLLEMENT" 
"POST_DYNA_ALEA" 
"POST_DYNA_MODA_T" 
"POST_ELEM" 
"POST_ENDO_FISS" 
"POST_FATIGUE" 
"POST_FATI_ALEA" 
"POST_K" 
"POST_K_BETA" 
"POST_K_TRANS" 
"POST_MAC" 
"POST_MAIL_XFEM" 
"POST_RCCM" 
"POST_RELEVE_T" 
"POST_RUPTURE" 
"POST_USURE" 
"POURSUITE" 
"PRE_GIBI" 
"PRE_GMSH" 
"PRE_IDEAS" 
"PROD_MATR_CHAM" 
"MACRO_PROJ_BASE" 
"PROJ_CHAMP" 
"PROJ_MATR_BASE" 
"PROJ_MESU_MODAL" 
"PROJ_SPEC_BASE" 
"PROJ_VECT_BASE" 
"PROPA_FISS" 
"RAFF_XFEM" 
"RECA_WEIBULL" 
"RECU_FONCTION" 
"RECU_GENE" 
"RECU_PARA_YACS" 
"RECU_TABLE" 
"RESOUDRE" 
"REST_COND_TRAN" 
"REST_GENE_PHYS" 
"REST_SOUS_STRUC" 
"REST_SPEC_PHYS" 
"REST_SPEC_TEMP" 
"RESULTAT" 
"SIMU_POINT_MAT" 
"SOLVEUR" 
"STANLEY" 
"STAT_NON_LINE" 
"TEST_COMPOR" 
"TEST_FICHIER" 
"TEST_FONCTION" 
"TEST_RESU" 
"TEST_TABLE" 
"TEST_TEMPS" 
"THER_LINEAIRE" 
"THER_NON_LINE" 
"THER_NON_LINE_MO" 
"DEFI_PARA_SENSI" 
"SENSIBILITE" 
"CALC_ELEM" 
"CALC_NO" 
"CALC_SENSI" 
"POST_GP" 
) )

(setq aster-functions '("_F") )


(defun aster-astk ()
  (interactive)  
  (shell-command (concat "nohup " asterDir "bin/astk &"))
)

(defun aster-eficas ()
  (interactive)
  (shell-command (concat "nohup " asterDir "bin/eficas &"))
)

(defvar aster-font-lock-keywords
  `(;; new keywords in CODE_ASTER
    (,(regexp-opt aster-keywords 'words)
     1 font-lock-keyword-face)
    ;; CODE_ASTER types (highlight as builtins)
    (,(regexp-opt aster-functions 'words)
     1 font-lock-builtin-face)
    ;;(,(regexp-opt '("DX" "DY" "DZ" "DRX" "DRY" "DRZ" "JUSQU_A" "PAS" "RESULTAT") 'words)
    ;; 1 font-lock-constant-face)
    )
  "Additional font lock keywords for Aster mode.")

(define-derived-mode aster-mode python-mode "CODE_ASTER"
  "Major mode for CODE_ASTER development, derived from Python mode.

\\{aster-mode-map}"
  (setcar font-lock-defaults
          (append python-font-lock-keywords aster-font-lock-keywords))
  ;;(set (make-local-variable 'compile-command)
  ;;     (concat "aster -a " buffer-file-name))

 (define-key aster-mode-map (kbd "s-d") 'comment-region) ; comment a region by shortcut Super+d
 (define-key aster-mode-map (kbd "s-D") 'uncomment-region) ; uncomment a region by shortcut Super+Shift+d
 (define-key aster-mode-map (kbd "s-A") 'aster-astk) ; call astk
 (define-key aster-mode-map (kbd "s-E") 'aster-eficas) ; call astk
  ;; (define-key aster-mode-map [remap comment-region] 'comment-region) comment a region by shortcut 
  ;; (define-key aster-mode-map [remap uncomment-region] 'uncomment-region) uncomment a region by shortcut
  ;; define your menu
  (define-key aster-mode-map [menu-bar] (make-sparse-keymap))
  (let ((menuMap (make-sparse-keymap "Code_Aster")))
    (define-key aster-mode-map [menu-bar aster] (cons "Code_Aster" menuMap))
    (define-key menuMap [comment]
      '("Comment Region" . comment-region))
    (define-key menuMap [uncomment]
      '("Uncomment Region" . uncomment-region))
    (define-key menuMap [separator]
      '("--"))
    (define-key menuMap [eficas]
      '("Launch eficas" . aster-eficas))
    (define-key menuMap [astk]
      '("Launch astk" . aster-astk))
    )
)


(provide 'aster-mode)
