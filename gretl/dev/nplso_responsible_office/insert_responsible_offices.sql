INSERT INTO arp_npl_oereb_zustaendige_stelle.t_ili2db_dataset (
  t_id, 
  datasetname
)
VALUES (
  10000, 
  'ch.so.arp.nutzungsplanung' -- could be anything
);

INSERT INTO arp_npl_oereb_zustaendige_stelle.t_ili2db_basket (
  t_id,
  dataset, 
  topic, 
  attachmentkey
)
VALUES (
  10001, 
  10000, 
  'OeREBKRMtrsfr_V1_1.Transferstruktur', 
  'fubar'
);

INSERT INTO arp_npl_oereb_zustaendige_stelle.vorschriften_amt (
  t_basket,
  t_datasetname,
  t_ili_tid,
  aname_de,
  amtimweb
)
VALUES (
  10001,
  'ch.so.arp.nutzungsplanung',
  'ch.so.arp.npl',
  'Amt für Raumplanung',
  'http://arp.so.ch/'
)
;

WITH gemeinden AS (
  SELECT
    unnest(string_to_array('2401,2402,2403,2404,2405,2406,2407,2408,2421,2422,2423,2424,2425,2426,2427,2428,2429,2445,2455,2456,2457,2461,2463,2464,2465,2471,2472,2473,2474,2475,2476,2477,2478,2479,2480,2481,2491,2492,2493,2495,2497,2498,2499,2500,2501,2502,2503,2511,2513,2514,2516,2517,2518,2519,2520,2523,2524,2525,2526,2527,2528,2529,2530,2532,2534,2535,2541,2542,2543,2544,2545,2546,2547,2548,2549,2550,2551,2553,2554,2555,2556,2571,2572,2573,2574,2575,2576,2578,2579,2580,2581,2582,2583,2584,2585,2586,2601,2611,2612,2613,2614,2615,2616,2617,2618,2619,2620,2621,2622',',')) AS bfsnr
) 
INSERT INTO arp_npl_oereb_zustaendige_stelle.vorschriften_amt (
  t_basket,
  t_datasetname,
  t_ili_tid,
  aname_de,
  amtimweb
)
SELECT
  10001 AS t_basket,
  'ch.so.arp.nutzungsplanung' AS t_datasetname,
  'ch.so.arp.npl.'||bfsnr AS t_ili_tid,
  'Gemeinde '||bfsnr AS aname_de,
  'http://www.fubar.ch/'||bfsnr AS amtimweb
FROM
  gemeinden
;

INSERT INTO arp_npl_oereb_zustaendige_stelle.vorschriften_amt (
  t_basket,
  t_datasetname,
  t_ili_tid,
  aname_de,
  amtimweb
)
VALUES (
  10001,
  'ch.so.arp.nutzungsplanung',
  'ch.so.sk',
  'Staatskanzlei',
  'http://www.so.ch/staatskanzlei/'
)
;
