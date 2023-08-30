DROP TABLE IF EXISTS link_gdr3 CASCADE;
CREATE TABLE link_gdr3 (
  link_id          BIGSERIAL PRIMARY KEY,
  merged_source_id BIGINT NOT NULL,
  gdr3_source_id   BIGINT NOT NULL,
  distance         FLOAT(10) NOT NULL
);

ALTER TABLE link_gdr3 ADD CONSTRAINT
  FK_link_gdr3_0 FOREIGN KEY (merged_source_id)
  REFERENCES merged_sources (source_id) ON DELETE CASCADE;
ALTER TABLE link_gdr3 ADD CONSTRAINT
  FK_link_gdr3_1 FOREIGN KEY (gdr3_source_id)
  REFERENCES gdr3_sources (source_id) ON DELETE CASCADE;


INSERT INTO link_gdr3
  (merged_source_id,gdr3_source_id,distance)
SELECT
  aux.merged_source_id,
  g.source_id AS gdr3_source_id,
  distance
FROM
  (SELECT ra,dec,source_id FROM gdr3_sources WHERE tmass_designation IS NULL) AS g
LEFT JOIN LATERAL(
  SELECT m.source_id as merged_source_id,q3c_dist(m.ra,m.dec,g.ra,g.dec) as distance,m.tmass_source_id FROM merged_sources AS m
  WHERE q3c_join(g.glon,g.glat,m.glon,m.glat,1.0/3600.0)
  ORDER BY distance ASC LIMIT 1
) as aux
UNION
SELECT
  m.source_id AS merged_source_id,
  g.source_id AS gdr3_source_id,
  3600.0*q3c_dist(m.ra,m.dec,g.ra,g.dec) AS distance
FROM 
  (SELECT ra,dec,source_id,tmass_designation FROM gdr3_sources WHERE tmass_designation IS NOT NULL) AS g
JOIN
  tmass_sources_clean AS t
ON
  g.tmass_designation = t.designation
JOIN
  (SELECT ra,dec,source_id,tmass_source_id FROM merged_sources WHERE tmass_source_id IS NOT NULL) as m
ON
  m.tmass_source_id = t.source_id;

CREATE INDEX IF NOT EXISTS link_gdr3_merged_source_id
  ON link_gdr3 (merged_source_id);
CREATE INDEX IF NOT EXISTS link_gdr3_gdr3_source_id
  ON link_gdr3 (gdr3_source_id);
CLUSTER link_gdr3_merged_source_id ON link_gdr3;
ANALYZE link_gdr3;