CREATE TABLE IF NOT EXISTS sirius_sources (
  source_id          BIGSERIAL PRIMARY KEY,
  glon               FLOAT NOT NULL,
  glat               FLOAT NOT NULL,
  ra                 FLOAT NOT NULL,
  dec                FLOAT NOT NULL,
  position_j_x       FLOAT,
  position_j_y       FLOAT,
  phot_j_mag         FLOAT,
  phot_j_mag_error   FLOAT,
  position_h_x       FLOAT,
  position_h_y       FLOAT,
  phot_h_mag         FLOAT,
  phot_h_mag_error   FLOAT,
  position_ks_x      FLOAT,
  position_ks_y      FLOAT,
  phot_ks_mag        FLOAT,
  phot_ks_mag_error  FLOAT,
  plate_name         VARCHAR(16) NOT NULL
);


CREATE TABLE IF NOT EXISTS tmass_sources (
  source_id          BIGSERIAL PRIMARY KEY,
  ra                 FLOAT NOT NULL,
  dec                FLOAT NOT NULL,
  designation        VARCHAR(32) NOT NULL,
  phot_j_mag         FLOAT,
  phot_j_cmsig       FLOAT,
  phot_j_mag_error   FLOAT,
  phot_j_snr         FLOAT,
  phot_h_mag         FLOAT,
  phot_h_cmsig       FLOAT,
  phot_h_mag_error   FLOAT,
  phot_h_snr         FLOAT,
  phot_ks_mag        FLOAT,
  phot_ks_cmsig      FLOAT,
  phot_ks_mag_error  FLOAT,
  phot_ks_snr        FLOAT,
  quality_flag       VARCHAR(3) NOT NULL,
  contaminated       INTEGER NOT NULL,
  glon               FLOAT NOT NULL,
  glat               FLOAT NOT NULL,
  rd_flg             VARCHAR(3) NOT NULL,
  color_j_h          FLOAT,
  color_h_ks         FLOAT,
  color_j_ks         FLOAT
);


CREATE TABLE IF NOT EXISTS vvv_sources (
  source_id         BIGINT PRIMARY KEY,
  glon              FLOAT NOT NULL,
  glat              FLOAT NOT NULL,
  ra                FLOAT NOT NULL,
  dec               FLOAT NOT NULL,
  phot_z_flag       INTEGER,
  phot_z_mag        FLOAT,
  phot_z_mag_error  FLOAT,
  phot_y_flag       INTEGER,
  phot_y_mag        FLOAT,
  phot_y_mag_error  FLOAT,
  phot_j_flag       INTEGER,
  phot_j_mag        FLOAT,
  phot_j_mag_error  FLOAT,
  phot_h_flag       INTEGER,
  phot_h_mag        FLOAT,
  phot_h_mag_error  FLOAT,
  phot_ks_flag      INTEGER,
  phot_ks_mag       FLOAT,
  phot_ks_mag_error FLOAT
);

CREATE TABLE IF NOT EXISTS vvv4_sources (
  source_id         BIGINT PRIMARY KEY,
  glon              FLOAT NOT NULL,
  glat              FLOAT NOT NULL,
  ra                FLOAT NOT NULL,
  dec               FLOAT NOT NULL,
  Var               INTEGER,
  phot_z_flag       FLOAT,
  phot_z_mag        FLOAT,
  phot_z_mag_error  FLOAT,
  phot_y_flag       FLOAT,
  phot_y_mag        FLOAT,
  phot_y_mag_error  FLOAT,
  phot_j_flag       FLOAT,
  phot_j_mag        FLOAT,
  phot_j_mag_error  FLOAT,
  phot_h_flag       FLOAT,
  phot_h_mag        FLOAT,
  phot_h_mag_error  FLOAT,
  phot_ks_flag      FLOAT,
  phot_ks_mag       FLOAT,
  phot_ks_mag_error FLOAT
);


CREATE TABLE IF NOT EXISTS gdr3_sources (
  source_id          BIGINT PRIMARY KEY,
  ra                 FLOAT NOT NULL,
  dec                FLOAT NOT NULL,
  ra_error           FLOAT,
  dec_error          FLOAT,
  ra_dec_corr        FLOAT,
  glon               FLOAT NOT NULL,
  glat               FLOAT NOT NULL,
  ecl_lon            FLOAT NOT NULL,
  ecl_lat            FLOAT NOT NULL,
  ref_epoch          FLOAT NOT NULL,
  ra_sirius          FLOAT NOT NULL,
  dec_sirius         FLOAT NOT NULL,
  ra_vvv             FLOAT NOT NULL,
  dec_vvv            FLOAT NOT NULL,
  parallax           FLOAT,
  parallax_error     FLOAT,
  ruwe               FLOAT,
  astrometric_excess_noise FLOAT,
  pm                 FLOAT,
  pmra               FLOAT,
  pmra_error         FLOAT,
  pmdec              FLOAT,
  pmdec_error        FLOAT,
  pmra_pmdec_corr    FLOAT,
  radial_velocity    FLOAT,
  radial_velocity_error FLOAT,
  phot_g_mag         FLOAT,
  phot_g_mag_error   FLOAT,
  phot_bp_mag        FLOAT,
  phot_bp_mag_error  FLOAT,
  phot_rp_mag        FLOAT,
  phot_rp_mag_error  FLOAT,
  phot_variable_flag VARCHAR(32),
  non_single_star    INTEGER,
  astrometric_params_solved INTEGER NOT NULL,
  distance_gspphot           FLOAT,
  distance_gspphot_lower     FLOAT,
  distance_gspphot_upper     FLOAT,
  ag_gspphot                 FLOAT,
  ag_gspphot_lower           FLOAT,
  ag_gspphot_upper           FLOAT,
  azero_gspphot              FLOAT,
  azero_gspphot_lower        FLOAT,
  azero_gspphot_upper        FLOAT,
  tmass_designation  VARCHAR(32),
  r_med_photogeo     FLOAT,
  r_lo_photogeo      FLOAT,
  r_hi_photogeo      FLOAT,
  r_med_geo          FLOAT,
  r_lo_geo           FLOAT,
  r_hi_geo           FLOAT,
  norm_dg            FLOAT,
  fidelity_v2        FLOAT,
  phot_j_mag_pred    FLOAT,
  phot_h_mag_pred    FLOAT,
  phot_ks_mag_pred   FLOAT
);

