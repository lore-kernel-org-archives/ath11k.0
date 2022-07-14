Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB7BDC433EF
	for <ath11k@archiver.kernel.org>; Thu, 14 Jul 2022 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=6B6zEyeRjy69iNRb6xP2FVIu09khJZwaYtw48cY2u5Q=; b=mFzjdGhYez4Ptb
	hME+QAcnwFHjkutUK0obby8wnFSMxJ8ya31iEtZU7/T98jLsMPVZExs6RzS0ASI3xewufeW2sunh9
	egxmlU33XNoBA0XqEFjrMBwT9DX4uRRq4DwWa94qa8yyKszgfDw0F2YWhALbBkZEigzcga/Gva/jX
	YsVFhk0UZQBP/FxZxuF1Y8KdQ9SuPjWXaBiYJEX/0VppbXA71Z6EVK86RfX4SnetXyLokP421iT4A
	A2dCJWADbBiwQg107BTPvbRsQmqiN+zeXM/8/ahjKEs5qQF2mrmuzV5Kbv7etJIpc2hUIygVjRTX6
	6lKB1p7OimuTQcj5/vmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC1wI-00GNOh-HK; Thu, 14 Jul 2022 16:43:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC1w6-00GNDn-2k; Thu, 14 Jul 2022 16:43:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 823BDB82742;
	Thu, 14 Jul 2022 16:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFB8C341E0;
	Thu, 14 Jul 2022 16:43:30 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.95)
	(envelope-from <rostedt@goodmis.org>)
	id 1oC1w1-004lPA-Hp;
	Thu, 14 Jul 2022 12:43:29 -0400
Message-ID: <20220714164329.384685373@goodmis.org>
User-Agent: quilt/0.66
Date: Thu, 14 Jul 2022 12:43:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: [for-next][PATCH 08/23] tracing/ath: Use the new __vstring() helper
References: <20220714164256.403842845@goodmis.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_094334_438466_F987B950 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Instead of open coding a __dynamic_array() with a fixed length (which
defeats the purpose of the dynamic array in the first place). Use the new
__vstring() helper that will use a va_list and only write enough of the
string into the ring buffer that is needed.

Link: https://lkml.kernel.org/r/20220705224749.430339634@goodmis.org

Cc: Kalle Valo <kvalo@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: ath11k@lists.infradead.org
Acked-by: Kalle Valo <kvalo@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/net/wireless/ath/ath10k/trace.h  | 14 ++++----------
 drivers/net/wireless/ath/ath11k/trace.h  |  7 ++-----
 drivers/net/wireless/ath/ath6kl/trace.h  | 14 ++++----------
 drivers/net/wireless/ath/trace.h         |  7 ++-----
 drivers/net/wireless/ath/wil6210/trace.h |  7 ++-----
 5 files changed, 14 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
index 4714c86bb501..64e7a767d963 100644
--- a/drivers/net/wireless/ath/ath10k/trace.h
+++ b/drivers/net/wireless/ath/ath10k/trace.h
@@ -52,15 +52,12 @@ DECLARE_EVENT_CLASS(ath10k_log_event,
 	TP_STRUCT__entry(
 		__string(device, dev_name(ar->dev))
 		__string(driver, dev_driver_string(ar->dev))
-		__dynamic_array(char, msg, ATH10K_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
 		__assign_str(device, dev_name(ar->dev));
 		__assign_str(driver, dev_driver_string(ar->dev));
-		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-				       ATH10K_MSG_MAX,
-				       vaf->fmt,
-				       *vaf->va) >= ATH10K_MSG_MAX);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk(
 		"%s %s %s",
@@ -92,16 +89,13 @@ TRACE_EVENT(ath10k_log_dbg,
 		__string(device, dev_name(ar->dev))
 		__string(driver, dev_driver_string(ar->dev))
 		__field(unsigned int, level)
-		__dynamic_array(char, msg, ATH10K_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
 		__assign_str(device, dev_name(ar->dev));
 		__assign_str(driver, dev_driver_string(ar->dev));
 		__entry->level = level;
-		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-				       ATH10K_MSG_MAX,
-				       vaf->fmt,
-				       *vaf->va) >= ATH10K_MSG_MAX);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk(
 		"%s %s %s",
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index a02e54735e88..76560587bea0 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -126,15 +126,12 @@ DECLARE_EVENT_CLASS(ath11k_log_event,
 	TP_STRUCT__entry(
 		__string(device, dev_name(ab->dev))
 		__string(driver, dev_driver_string(ab->dev))
-		__dynamic_array(char, msg, ATH11K_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
 		__assign_str(device, dev_name(ab->dev));
 		__assign_str(driver, dev_driver_string(ab->dev));
-		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-				       ATH11K_MSG_MAX,
-				       vaf->fmt,
-				       *vaf->va) >= ATH11K_MSG_MAX);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk(
 		"%s %s %s",
diff --git a/drivers/net/wireless/ath/ath6kl/trace.h b/drivers/net/wireless/ath/ath6kl/trace.h
index a3d3740419eb..231a94769ddb 100644
--- a/drivers/net/wireless/ath/ath6kl/trace.h
+++ b/drivers/net/wireless/ath/ath6kl/trace.h
@@ -253,13 +253,10 @@ DECLARE_EVENT_CLASS(ath6kl_log_event,
 	TP_PROTO(struct va_format *vaf),
 	TP_ARGS(vaf),
 	TP_STRUCT__entry(
-		__dynamic_array(char, msg, ATH6KL_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
-		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-				       ATH6KL_MSG_MAX,
-				       vaf->fmt,
-				       *vaf->va) >= ATH6KL_MSG_MAX);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk("%s", __get_str(msg))
 );
@@ -284,14 +281,11 @@ TRACE_EVENT(ath6kl_log_dbg,
 	TP_ARGS(level, vaf),
 	TP_STRUCT__entry(
 		__field(unsigned int, level)
-		__dynamic_array(char, msg, ATH6KL_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
 		__entry->level = level;
-		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-				       ATH6KL_MSG_MAX,
-				       vaf->fmt,
-				       *vaf->va) >= ATH6KL_MSG_MAX);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk("%s", __get_str(msg))
 );
diff --git a/drivers/net/wireless/ath/trace.h b/drivers/net/wireless/ath/trace.h
index ba711644d27e..9935cf475b6d 100644
--- a/drivers/net/wireless/ath/trace.h
+++ b/drivers/net/wireless/ath/trace.h
@@ -40,16 +40,13 @@ TRACE_EVENT(ath_log,
 	    TP_STRUCT__entry(
 		    __string(device, wiphy_name(wiphy))
 		    __string(driver, KBUILD_MODNAME)
-		    __dynamic_array(char, msg, ATH_DBG_MAX_LEN)
+		    __vstring(msg, vaf->fmt, vaf->va)
 	    ),
 
 	    TP_fast_assign(
 		    __assign_str(device, wiphy_name(wiphy));
 		    __assign_str(driver, KBUILD_MODNAME);
-		    WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-					   ATH_DBG_MAX_LEN,
-					   vaf->fmt,
-					   *vaf->va) >= ATH_DBG_MAX_LEN);
+		    __assign_vstr(msg, vaf->fmt, vaf->va);
 	    ),
 
 	    TP_printk(
diff --git a/drivers/net/wireless/ath/wil6210/trace.h b/drivers/net/wireless/ath/wil6210/trace.h
index 11c989e95880..201f44612c31 100644
--- a/drivers/net/wireless/ath/wil6210/trace.h
+++ b/drivers/net/wireless/ath/wil6210/trace.h
@@ -70,13 +70,10 @@ DECLARE_EVENT_CLASS(wil6210_log_event,
 	TP_PROTO(struct va_format *vaf),
 	TP_ARGS(vaf),
 	TP_STRUCT__entry(
-		__dynamic_array(char, msg, WIL6210_MSG_MAX)
+		__vstring(msg, vaf->fmt, vaf->va)
 	),
 	TP_fast_assign(
-		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
-				       WIL6210_MSG_MAX,
-				       vaf->fmt,
-				       *vaf->va) >= WIL6210_MSG_MAX);
+		__assign_vstr(msg, vaf->fmt, vaf->va);
 	),
 	TP_printk("%s", __get_str(msg))
 );
-- 
2.35.1

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
