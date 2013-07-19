;; aster-mode.el --- Aster Mode (Modified from Cython mode)
;;

;; Maintainer: Stefan Reiterer <maldun.finsterschreck@gmail.com> or <stefan.reiterer@magnasteyr.com>
;; Keywords: languages, processes, python, oop, Code_Aster

;; Copyright (C) 2013  Stefan Reiterer

;; Author: 2013 Stefan Reiterer
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

;; Aster Keyword Collection
(setq aster-keywords '("DEBUT" "FIN" "POURSUITE" "DEFI_FICHIER" 
"INCLUDE" "INFO_EXEC_ASTER" "DETRUIRE" "MAJ_CATA" "DEBUG" 
"LIRE_MAILLAGE" "DEFI_GROUP" "DEFI_MAILLAGE" "CREA_MAILLAGE" "ASSE_MAILLAGE" 
"MODI_MAILLAGE" "DEFI_PART_FETI" "DEFI_SQUELETTE" "DEFI_GRILLE" "DEFI_FLUI_STRU" 
"DEFI_GEOM_FIBRE" "DEFI_CONSTANTE" "DEFI_FONCTION" "DEFI_NAPPE" "FORMULE" 
"DEFI_PARA_SENSI" "CALC_FONC_INTERP" "LIRE_FONCTION" "RECU_FONCTION" "CALC_FONCTION" 
"INFO_FONCTION" "MACR_SPECTRE" "CALC_SPEC" "IMPR_FONCTION" "CREA_TABLE" 
"CALC_TABLE" "DEFI_LIST_REEL" "DEFI_LIST_ENTI" "DEFI_LIST_INST" "DEFI_FONC_FLUI" 
"FONC_FLUI_STRU" "LIRE_INTE_SPEC" "DEFI_INTE_SPEC" "CALC_INTE_SPEC" "GENE_FONC_ALEA" 
"GENE_MATR_ALEA" "GENE_VARI_ALEA" "AFFE_MODELE" "MODI_MODELE" "MODI_MODELE_XFEM" 
"AFFE_CARA_ELEM" "MACR_CARA_POUTRE" "DEFI_COQU_MULT" "DEFI_CABLE_BP" "CALC_PRECONT" 
"DEFI_GLRC" "DEFI_MATERIAU" "INCLUDE_MATERIAU" "AFFE_MATERIAU" "DEFI_TRC" 
"DEFI_COMPOR" "AFFE_CHAR_MECA" "AFFE_CHAR_THER" "AFFE_CHAR_CINE" "AFFE_CHAR_ACOU" 
"AFFE_CHAR_MECA_C" "DEFI_CONTACT" "CREA_RESU" "MACR_ECLA_PG" "DEFI_OBSTACLE" 
"MODI_OBSTACLE" "DEFI_SPEC_TURB" "SOLVEUR" "SENSIBILITE" "MECA_STATIQUE" 
"MACRO_ELAS_MULT" "STAT_NON_LINE" "CALCUL" "SIMU_POINT_MAT" 
"IMPR_STURM" "MACRO_MODE_MECA" "MODE_ITER_SIMULT" "MODE_ITER_INV" "MODE_ITER_CYCL" 
"CALC_MODAL" "NORM_MODE" "EXTR_MODE" "CALC_AMOR_MODAL" "MODE_STATIQUE" 
"MAC_MODES" "CALC_MODE_ROTATION" "IMPR_DIAG_CAMPBELL" "DYNA_NON_LINE" "DYNA_LINE_TRAN" 
"DYNA_LINE_HARM" "DYNA_TRAN_MODAL" "DYNA_ALEA_MODAL" "DYNA_SPEC_MODAL" "DYNA_ISS_VARI" 
"THER_LINEAIRE" "THER_NON_LINE" "THER_NON_LINE_MO" "FACTORISER" "RESOUDRE" 
"CALC_MATR_ELEM" "CALC_VECT_ELEM" "CALC_CHAR_CINE" "NUME_DDL" "MACRO_MATR_ASSE" 
"ASSE_MATRICE" "ASSE_VECTEUR" "MACR_ELEM_STAT" "DEPL_INTERNE" "CALC_CHAR_SEISME" 
"MACRO_PROJ_BASE" "PROJ_MATR_BASE" "PROJ_VECT_BASE" "PROJ_SPEC_BASE" "REST_SPEC_PHYS" 
"REST_GENE_PHYS" "REST_SOUS_STRUC" "REST_COND_TRAN" "REST_SPEC_TEMP" "DEFI_INTERF_DYNA" 
"DEFI_BASE_MODALE" "MACR_ELEM_DYNA" "DEFI_MODELE_GENE" "NUME_DDL_GENE" "ASSE_MATR_GENE" 
"ASSE_VECT_GENE" "CREA_ELEM_SSD" "ASSE_ELEM_SSD" "CALC_MATR_AJOU" "CALC_FLUI_STRU" 
"CALC_FORC_AJOU" "MACRO_MATR_AJOU" "MODI_BASE_MODALE" "RESULTAT" "RECU_TABLE" 
"RECU_GENE" "EXTR_RESU" "EXTR_TABLE" "COMB_MATR_ASSE" "CREA_CHAMP" 
"PROJ_CHAMP" "PROD_MATR_CHAM" "PROJ_MESU_MODAL" "MACR_RECAL" "MODI_REPERE" 
"CALC_ELEM" "CALC_NO" "CALC_CHAM_ELEM" "INTE_MAIL_" "INTE_MAIL_" 
"MACR_LIGN_COUPE" "POST_RELEVE_T" "POST_ELEM" "POST_COQUE" "STANLEY" 
"POST_BORDET" "CALC_FERRAILLAGE" "CALC_SENSI" "DEFI_FOND_FISS" "CALC_THETA" 
"CALC_G" "POST_K" "RECA_WEIBULL" "POST_K_BETA" "DEFI_FISS_XFEM" 
"PROPA_FISS" "POST_MAIL_XFEM" "POST_CHAM_XFEM" "POST_K_TRANS" "POST_GP" 
"POST_FATIGUE" "CALC_FATIGUE" "POST_RCCM" "COMB_FOURIER" "COMB_SISM_MODAL" 
"POST_DYNA_MODA_T" "POST_FATI_ALEA" "POST_DYNA_ALEA" "POST_USURE" "POST_DECOLLEMENT" 
"CALC_FORC_NONL" "CALC_META" "POST_ENDO_FISS" "CALC_ESSAI" "MACRO_EXPANS" 
"OBSERVATION" "IMPR_RESU" "IMPR_GENE" "IMPR_TABLE" "IMPR_CO" 
"INFO_RESU" "IMPR_JEVEUX" "TEST_RESU" "TEST_FONCTION" "TEST_TABLE" 
"TEST_FICHIER" "TEST_TEMPS" "TEST_COMPOR" "ENGENDRE_TEST" "CF" 
"CF" "MK" "PC" "PC" "CALC_CHAMP" "PRE_IDEAS" ) )

(setq aster-functions '("_F") )

(defvar aster-font-lock-keywords
  `(;; new keywords in CODE_ASTER
    (,(regexp-opt aster-keywords 'words)
     1 font-lock-keyword-face)
    ;; CODE_ASTER types (highlight as builtins)
    (,(regexp-opt aster-functions 'words)
     1 font-lock-builtin-face)
    ;;(,(regexp-opt '("DX" "DY" "DZ" "DRX" "DRY" "DRZ" "JUSQU_A" "PAS" "RESULTAT") 'words)
    ;; 1 font-lock-constant-face)
    ;; cdef is used for more than functions, so simply highlighting the next
    ;; word is problematic. struct, enum and property work though.
    ;;("\\<\\(?:struct\\|enum\\)[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"
    ;; 1 py-class-name-face)
    ;;("\\<property[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)"
    ;; 1 font-lock-function-name-face))
    )
  "Additional font lock keywords for Aster mode.")

(define-derived-mode aster-mode python-mode "CODE_ASTER"
  "Major mode for CODE_ASTER development, derived from Python mode.

\\{aster-mode-map}"
  (setcar font-lock-defaults
          (append python-font-lock-keywords aster-font-lock-keywords))
  ;;(set (make-local-variable 'compile-command)
  ;;     (concat "aster -a " buffer-file-name))
  ;;(add-to-list (make-local-variable 'compilation-finish-functions)
  ;;             'cython-compilation-finish)
)

(provide 'aster-mode)
