Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5115EC4829A
	for <ath11k@archiver.kernel.org>; Sun, 11 Feb 2024 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cDV/EzkBJSPm/U6XnvIw/DqpzOJLJMD4+Ms07MVvFc0=; b=yrHHgR18bo2Ur7GvJLQvtj0AAs
	ZjBV0bfuWWMH4fB6BbryC83RnetdtW7qg8RXWZJPpsa6k7NNHwrhUD5iXMNJomwGGzPa2/03vqIaO
	iRxwFBm2W+LhWdTgc3/+aXz3bO+AFttA65cNdda5WbDve/nFZ4iLRSfqMy4FpueWCugXoMKWHO88D
	GGhJzaQWkfwjZ2yIsDr0YCNQYLJlA5ukSnuagSa3qlB64VVw9ljkWnubph7S3g1d3MKC1bHSrB+Yg
	Orj1cNUKBVl94HPhhJQ+r8MI2kURwENi+YfBO98wDkywtzsJWuGVZAJKYPAtJqd0TBDw+3+ArNMXj
	oPmQiZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBTf-00000002trT-3ixD;
	Sun, 11 Feb 2024 15:10:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZBTc-00000002tq6-0Bqe
	for ath11k@lists.infradead.org;
	Sun, 11 Feb 2024 15:10:41 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3394ca0c874so1632659f8f.2
        for <ath11k@lists.infradead.org>; Sun, 11 Feb 2024 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707664238; x=1708269038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDV/EzkBJSPm/U6XnvIw/DqpzOJLJMD4+Ms07MVvFc0=;
        b=SICqsvdFQZt+A7soF18NOwlWMkeAwQoYVdVKfa7bQKiBh8VW2a2DYlFcqzv68svOGZ
         rFYGcKchSxCKERcwmH20aED+IegC9O8rES/9U7tCuxYM8PhDqq5ondwRQVnjH+KoBRWK
         vHjB4yAR8SnFSqjTa4UQK3eYha9sVVHhMtiWF2WlkCChAWVznzUieyG48TXD+p76UKj+
         Io5ylf7Gpq20PvLrE6jLbEuwDj5aoDdlRdLHzDXmmZemh2vYAMLs1nCfP4pveOPN45Bp
         XPxhbuxGVGV0PEg2x0AU1vKMTs5JvOrtidhzf07XR+YfCQVg3eYgcLTTqyiyNjTF9uOy
         vkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707664238; x=1708269038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDV/EzkBJSPm/U6XnvIw/DqpzOJLJMD4+Ms07MVvFc0=;
        b=N6IhWkSbbLjyZwKWWJa5wkRZJtpyI0pcYcjzQpt0oT8DD8h/Kqf0LM741wI6kbywW4
         vVeAfZ45dsviEP5Z3yDSny23oRLbHR842PUakXf/AG8WwLRJH+IbWu0ds4yjuZX9Ew9a
         RSy1NQWB5XF59qf2AHqVxjqGQIOXPefG036FpO8d1K4vp8q9M5yXc7uoagPEV87bXaaT
         3T6CEblMQPcmSGoA6uOJi4p2mTl3t4/Fs/SJ+kRIp9FtVYn3F92YEslrp8RwTwRDBpPH
         vqhzm1kpStwVd+WV0I+mnkod/NYDJM7J8OkBwmjZod018s9C587mLaviRReemuP+TYf4
         q+fg==
X-Gm-Message-State: AOJu0YzIa1WmgqVKTl0uqIGZO6l4cmRgrAO7PDQbJFyuNCd5CRnTl9eY
	j/xSNlM7gZGjTlX/b3f14kwktUr93k+iu9IqoEKZkS5BUo28uj9hS8VthMbm
X-Google-Smtp-Source: AGHT+IEoSJs0vfzu812As0wknmHbRYkyxXmpDCghVkoLxP+CEvWJvRqlqa2tAPsOz6Kwbhs8lxyZGA==
X-Received: by 2002:a5d:4643:0:b0:33b:232f:63f7 with SMTP id j3-20020a5d4643000000b0033b232f63f7mr3404599wrs.31.1707664238148;
        Sun, 11 Feb 2024 07:10:38 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ck18-20020a5d5e92000000b0033b7a2136a4sm2057585wrb.97.2024.02.11.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 07:10:37 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath11k: remove unused scan_events from struct scan_req_params
Date: Sun, 11 Feb 2024 16:10:36 +0100
Message-ID: <20240211151036.1950292-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_071040_112122_081A7D5E 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

As discussed in [1] lets remove the unused scan_events field from struct
scan_req_params. Also, as it is not needed anymore, remove the underlying union
wrapping too. No functionnal changes.

[1] https://lore.kernel.org/all/4be7d62e-cb59-462d-aac2-94e27efc22ff@quicinc.com/

Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 31 +++++++++++----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index bc7adf7f13fb..bb419e3abb00 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -3363,24 +3363,19 @@ struct scan_req_params {
 	u32 vdev_id;
 	u32 pdev_id;
 	enum wmi_scan_priority scan_priority;
-	union {
-		struct {
-			u32 scan_ev_started:1,
-			    scan_ev_completed:1,
-			    scan_ev_bss_chan:1,
-			    scan_ev_foreign_chan:1,
-			    scan_ev_dequeued:1,
-			    scan_ev_preempted:1,
-			    scan_ev_start_failed:1,
-			    scan_ev_restarted:1,
-			    scan_ev_foreign_chn_exit:1,
-			    scan_ev_invalid:1,
-			    scan_ev_gpio_timeout:1,
-			    scan_ev_suspended:1,
-			    scan_ev_resumed:1;
-		};
-		u32 scan_events;
-	};
+	u32 scan_ev_started:1,
+	    scan_ev_completed:1,
+	    scan_ev_bss_chan:1,
+	    scan_ev_foreign_chan:1,
+	    scan_ev_dequeued:1,
+	    scan_ev_preempted:1,
+	    scan_ev_start_failed:1,
+	    scan_ev_restarted:1,
+	    scan_ev_foreign_chn_exit:1,
+	    scan_ev_invalid:1,
+	    scan_ev_gpio_timeout:1,
+	    scan_ev_suspended:1,
+	    scan_ev_resumed:1;
 	u32 scan_ctrl_flags_ext;
 	u32 dwell_time_active;
 	u32 dwell_time_active_2g;
-- 
2.43.0


