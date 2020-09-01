
CREATE TABLE "canada_df" (
    "video_id" VARCHAR(100)   NOT NULL,
    "title" VARCHAR(250)   NOT NULL,
    "published_at" VARCHAR(50)   NOT NULL,
    "channel_title" VARCHAR(100)   NOT NULL,
    "category_id" INT   NOT NULL,
    "view_count" INT   NOT NULL,
    "likes" INT   NOT NULL,
    "dislikes" INT   NOT NULL,
    "comment_count" INT   NOT NULL,
    "thumbnail_link" VARCHAR   NOT NULL,
    "description" VARCHAR   NOT NULL,
    CONSTRAINT "pk_canada_df" PRIMARY KEY (
        "video_id"
     )
);

CREATE TABLE "category_df" (
    "category_id" INT   NOT NULL,
    "category_title" VARCHAR(250)   NOT NULL,
    CONSTRAINT "pk_category_df" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "video_category" (
    "video_id" VARCHAR(100)   NOT NULL,
    "category_id" INT   NOT NULL
);

CREATE TABLE "category_data" (
    "category_id" INT   NOT NULL,
    "number_of_videos" INT   NOT NULL,
    "total_view_count" INT   NOT NULL,
    "total_likes" INT   NOT NULL,
    "total_dislikes" INT   NOT NULL,
    "total_comment_count" INT   NOT NULL
);

ALTER TABLE "canada_df" ADD CONSTRAINT "fk_canada_df_category_id" FOREIGN KEY("category_id")
REFERENCES "category_df" ("category_id");

ALTER TABLE "video_category" ADD CONSTRAINT "fk_video_category_video_id" FOREIGN KEY("video_id")
REFERENCES "canada_df" ("video_id");

ALTER TABLE "video_category" ADD CONSTRAINT "fk_video_category_category_id" FOREIGN KEY("category_id")
REFERENCES "category_df" ("category_id");

ALTER TABLE "category_data" ADD CONSTRAINT "fk_category_data_category_id" FOREIGN KEY("category_id")
REFERENCES "category_df" ("category_id");

SELECT * FROM canada_df;
SELECT * FROM category_df;
SELECT * FROM video_category;
SELECT * FROM category_data;