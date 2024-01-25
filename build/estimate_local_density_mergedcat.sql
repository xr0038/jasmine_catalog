\set radius_threshold 60.
\set hwmagdiff_threshold 1.

DROP TABLE IF EXISTS merged_sources_local_density_jasmine_2magfainter CASCADE; -- This table is the first step in the merging. It estimates de local density around each source.
CREATE TABLE merged_sources_local_density_jasmine_2magfainter AS
SELECT m.source_id,MIN(m.glon) glon,MIN(m.glat) glat, COUNT(radius) N, MIN(radius) Rmin, MAX(radius) R, COUNT(radius)/(4*PI()*POWER(sin(MAX(radius)/3600*PI()/180/2),2))/(4.25*POWER(10,10)) AS density
FROM (SELECT * FROM merged_sources WHERE phot_hw_mag<15 LIMIT 500) as m,
  LATERAL (
    SELECT q3c_dist(m.ra,m.dec,m2.ra,m2.dec)*3600. as radius FROM (SELECT ra,dec FROM merged_sources as m1 WHERE m1.source_id!=m.source_id and m1.phot_hw_mag<=m.phot_hw_mag+:hwmagdiff_threshold) as m2 WHERE q3c_join(m.ra,m.dec,m2.ra,m2.dec,:radius_threshold/3600.)
    ORDER BY radius ASC
    LIMIT 100
  ) neighbours
GROUP BY m.source_id;
