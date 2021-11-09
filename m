Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B397C433F5
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 06:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0882961039
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 06:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0882961039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VxV1lHzq6bQit90qTw3xHrZg35KNqJURYBC7Nd+Nti4=; b=a7P7gTZzuKCp9L
	SDZG1ZkktRDqXd1gPNW8Df7aXfxROtSa98RKMjJuogqwQRu/jnsWXYhxXALVZ16+cS8GVJhL1ECc1
	RriFzuJkG0moSEYU8Wh2K3AT03IfxjLpdTn1IEskKQ9k2UL6mwl+S4nLg4hfC4hEUp838wMYLjlOZ
	vsvx3EJzV2moTUP93JaPs+3CgumWCBvvHTkNtSf4TIlZmHaqZb47+1BprYd+SOWxFXI4AN9zwwk7m
	YvE7ZaGu5JAGPEQgRzPZck8RO6oJ3o39JHlX6MVbHrz7s6koYdiacwax+wqEAHVY1/Po3K0kXnfmx
	nith3sQbyCbqfSg23PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkKju-000o4W-RR; Tue, 09 Nov 2021 06:36:14 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkKjr-000o49-Ku
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 06:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1636439771; x=1667975771;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=XtAN4q9CHQ9ZunJ4yQrJMn2sAvPrMfhhkljFx6PlBE8=;
 b=OrYRzjQF5yukDjOSr9B8w5yfJL8WTz8+vliBF/2B3KzK8VFq0uh/zgeh
 4vNegAC0al+R11vcY7p+xeZBLdWHtExW3A8deW1juWrD9J8+iLym8NcuD
 i40uP/r6JU//h2/sAKfivABsU0PbgefNiuQZ1qqcN0BYN5CXNmHxG4pJj 4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Nov 2021 22:36:11 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 22:36:11 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 8 Nov 2021 22:36:11 -0800
Received: from vnaralas-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 8 Nov 2021 22:36:09 -0800
From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Venkateswara Naralasetty
 <quic_vnaralas@quicinc.com>
Subject: [PATCH] ath11k: add trace log support
Date: Tue, 9 Nov 2021 12:05:55 +0530
Message-ID: <1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_223611_767642_6FE87C8B 
X-CRM114-Status: GOOD (  14.67  )
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

This change is to add trace log support for,
        * WMI events
        * WMI commands
        * ath11k_dbg messages
        * ath11k_dbg_dump messages
        * ath11k_log_info messages
        * ath11k_log_warn messages
        * ath11k_log_err messages

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00652-QCAHKSWPL_SILICONZ-1

Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debug.c |  12 ++-
 drivers/net/wireless/ath/ath11k/debug.h |   3 +-
 drivers/net/wireless/ath/ath11k/trace.c |   1 +
 drivers/net/wireless/ath/ath11k/trace.h | 172 ++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/wmi.c   |   4 +
 5 files changed, 187 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index c86de95..958d874 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -17,7 +17,7 @@ void ath11k_info(struct ath11k_base *ab, const char *fmt, ...)
 	va_start(args, fmt);
 	vaf.va = &args;
 	dev_info(ab->dev, "%pV", &vaf);
-	/* TODO: Trace the log */
+	trace_ath11k_log_info(ab, &vaf);
 	va_end(args);
 }
 EXPORT_SYMBOL(ath11k_info);
@@ -32,7 +32,7 @@ void ath11k_err(struct ath11k_base *ab, const char *fmt, ...)
 	va_start(args, fmt);
 	vaf.va = &args;
 	dev_err(ab->dev, "%pV", &vaf);
-	/* TODO: Trace the log */
+	trace_ath11k_log_err(ab, &vaf);
 	va_end(args);
 }
 EXPORT_SYMBOL(ath11k_err);
@@ -47,7 +47,7 @@ void ath11k_warn(struct ath11k_base *ab, const char *fmt, ...)
 	va_start(args, fmt);
 	vaf.va = &args;
 	dev_warn_ratelimited(ab->dev, "%pV", &vaf);
-	/* TODO: Trace the log */
+	trace_ath11k_log_warn(ab, &vaf);
 	va_end(args);
 }
 EXPORT_SYMBOL(ath11k_warn);
@@ -68,7 +68,7 @@ void __ath11k_dbg(struct ath11k_base *ab, enum ath11k_debug_mask mask,
 	if (ath11k_debug_mask & mask)
 		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
 
-	/* TODO: trace log */
+	trace_ath11k_log_dbg(ab, mask, &vaf);
 
 	va_end(args);
 }
@@ -100,6 +100,10 @@ void ath11k_dbg_dump(struct ath11k_base *ab,
 			dev_printk(KERN_DEBUG, ab->dev, "%s\n", linebuf);
 		}
 	}
+
+	/* tracing code doesn't like null strings */
+	trace_ath11k_log_dbg_dump(ab, msg ? msg : "", prefix ? prefix : "",
+				  buf, len);
 }
 EXPORT_SYMBOL(ath11k_dbg_dump);
 
diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 659a275..fbbd5fe 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -60,7 +60,8 @@ static inline void ath11k_dbg_dump(struct ath11k_base *ab,
 
 #define ath11k_dbg(ar, dbg_mask, fmt, ...)			\
 do {								\
-	if (ath11k_debug_mask & dbg_mask)			\
+	if ((ath11k_debug_mask & dbg_mask) ||			\
+	    trace_ath11k_log_dbg_enabled())			\
 		__ath11k_dbg(ar, dbg_mask, fmt, ##__VA_ARGS__);	\
 } while (0)
 
diff --git a/drivers/net/wireless/ath/ath11k/trace.c b/drivers/net/wireless/ath/ath11k/trace.c
index f0cc49b..6620650 100644
--- a/drivers/net/wireless/ath/ath11k/trace.c
+++ b/drivers/net/wireless/ath/ath11k/trace.c
@@ -7,3 +7,4 @@
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
+EXPORT_SYMBOL(__tracepoint_ath11k_log_dbg);
diff --git a/drivers/net/wireless/ath/ath11k/trace.h b/drivers/net/wireless/ath/ath11k/trace.h
index 25d18e9..02003dc 100644
--- a/drivers/net/wireless/ath/ath11k/trace.h
+++ b/drivers/net/wireless/ath/ath11k/trace.h
@@ -14,12 +14,24 @@
 #if !defined(CONFIG_ATH11K_TRACING)
 #undef TRACE_EVENT
 #define TRACE_EVENT(name, proto, ...) \
+static inline void trace_ ## name(proto) {} \
+static inline bool trace_##name##_enabled(void) \
+{						\
+	return false;				\
+}
+
+#undef DECLARE_EVENT_CLASS
+#define DECLARE_EVENT_CLASS(...)
+#undef DEFINE_EVENT
+#define DEFINE_EVENT(evt_class, name, proto, ...) \
 static inline void trace_ ## name(proto) {}
 #endif /* !CONFIG_ATH11K_TRACING || __CHECKER__ */
 
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM ath11k
 
+#define ATH11K_MSG_MAX 400
+
 TRACE_EVENT(ath11k_htt_pktlog,
 	    TP_PROTO(struct ath11k *ar, const void *buf, u16 buf_len,
 		     u32 pktlog_checksum),
@@ -108,6 +120,166 @@ TRACE_EVENT(ath11k_htt_rxdesc,
 	 )
 );
 
+DECLARE_EVENT_CLASS(ath11k_log_event,
+		    TP_PROTO(struct ath11k_base *ab, struct va_format *vaf),
+	TP_ARGS(ab, vaf),
+	TP_STRUCT__entry(
+		__string(device, dev_name(ab->dev))
+		__string(driver, dev_driver_string(ab->dev))
+		__dynamic_array(char, msg, ATH11K_MSG_MAX)
+	),
+	TP_fast_assign(
+		__assign_str(device, dev_name(ab->dev));
+		__assign_str(driver, dev_driver_string(ab->dev));
+		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
+				       ATH11K_MSG_MAX,
+				       vaf->fmt,
+				       *vaf->va) >= ATH11K_MSG_MAX);
+	),
+	TP_printk(
+		"%s %s %s",
+		__get_str(driver),
+		__get_str(device),
+		__get_str(msg)
+	)
+);
+
+DEFINE_EVENT(ath11k_log_event, ath11k_log_err,
+	     TP_PROTO(struct ath11k_base *ab, struct va_format *vaf),
+	     TP_ARGS(ab, vaf)
+);
+
+DEFINE_EVENT(ath11k_log_event, ath11k_log_warn,
+	     TP_PROTO(struct ath11k_base *ab, struct va_format *vaf),
+	     TP_ARGS(ab, vaf)
+);
+
+DEFINE_EVENT(ath11k_log_event, ath11k_log_info,
+	     TP_PROTO(struct ath11k_base *ab, struct va_format *vaf),
+	     TP_ARGS(ab, vaf)
+);
+
+TRACE_EVENT(ath11k_wmi_cmd,
+	    TP_PROTO(struct ath11k_base *ab, int id, const void *buf, size_t buf_len),
+
+	TP_ARGS(ab, id, buf, buf_len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ab->dev))
+		__string(driver, dev_driver_string(ab->dev))
+		__field(unsigned int, id)
+		__field(size_t, buf_len)
+		__dynamic_array(u8, buf, buf_len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ab->dev));
+		__assign_str(driver, dev_driver_string(ab->dev));
+		__entry->id = id;
+		__entry->buf_len = buf_len;
+		memcpy(__get_dynamic_array(buf), buf, buf_len);
+	),
+
+	TP_printk(
+		"%s %s id %d len %zu",
+		__get_str(driver),
+		__get_str(device),
+		__entry->id,
+		__entry->buf_len
+	 )
+);
+
+TRACE_EVENT(ath11k_wmi_event,
+	    TP_PROTO(struct ath11k_base *ab, int id, const void *buf, size_t buf_len),
+
+	TP_ARGS(ab, id, buf, buf_len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ab->dev))
+		__string(driver, dev_driver_string(ab->dev))
+		__field(unsigned int, id)
+		__field(size_t, buf_len)
+		__dynamic_array(u8, buf, buf_len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ab->dev));
+		__assign_str(driver, dev_driver_string(ab->dev));
+		__entry->id = id;
+		__entry->buf_len = buf_len;
+		memcpy(__get_dynamic_array(buf), buf, buf_len);
+	),
+
+	TP_printk(
+		"%s %s id %d len %zu",
+		__get_str(driver),
+		__get_str(device),
+		__entry->id,
+		__entry->buf_len
+	)
+);
+
+TRACE_EVENT(ath11k_log_dbg,
+	    TP_PROTO(struct ath11k_base *ab, unsigned int level, struct va_format *vaf),
+
+	TP_ARGS(ab, level, vaf),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ab->dev))
+		__string(driver, dev_driver_string(ab->dev))
+		__field(unsigned int, level)
+		__dynamic_array(char, msg, ATH11K_MSG_MAX)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ab->dev));
+		__assign_str(driver, dev_driver_string(ab->dev));
+		__entry->level = level;
+		WARN_ON_ONCE(vsnprintf(__get_dynamic_array(msg),
+				       ATH11K_MSG_MAX, vaf->fmt,
+				       *vaf->va) >= ATH11K_MSG_MAX);
+	),
+
+	TP_printk(
+		"%s %s %s",
+		__get_str(driver),
+		__get_str(device),
+		__get_str(msg)
+	)
+);
+
+TRACE_EVENT(ath11k_log_dbg_dump,
+	    TP_PROTO(struct ath11k_base *ab, const char *msg, const char *prefix,
+		     const void *buf, size_t buf_len),
+
+	TP_ARGS(ab, msg, prefix, buf, buf_len),
+
+	TP_STRUCT__entry(
+		__string(device, dev_name(ab->dev))
+		__string(driver, dev_driver_string(ab->dev))
+		__string(msg, msg)
+		__string(prefix, prefix)
+		__field(size_t, buf_len)
+		__dynamic_array(u8, buf, buf_len)
+	),
+
+	TP_fast_assign(
+		__assign_str(device, dev_name(ab->dev));
+		__assign_str(driver, dev_driver_string(ab->dev));
+		__assign_str(msg, msg);
+		__assign_str(prefix, prefix);
+		__entry->buf_len = buf_len;
+		memcpy(__get_dynamic_array(buf), buf, buf_len);
+	),
+
+	TP_printk(
+		"%s %s %s/%s\n",
+		__get_str(driver),
+		__get_str(device),
+		__get_str(prefix),
+		__get_str(msg)
+	)
+);
 #endif /* _TRACE_H_ || TRACE_HEADER_MULTI_READ*/
 
 /* we don't want to use include/trace/events */
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 5ae2ef4..80f7760 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -249,6 +249,8 @@ static int ath11k_wmi_cmd_send_nowait(struct ath11k_pdev_wmi *wmi, struct sk_buf
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	cmd_hdr->cmd_id = cmd;
 
+	trace_ath11k_wmi_cmd(ab, cmd_id, skb->data, skb->len);
+
 	memset(skb_cb, 0, sizeof(*skb_cb));
 	ret = ath11k_htc_send(&ab->htc, wmi->eid, skb);
 
@@ -7054,6 +7056,8 @@ static void ath11k_wmi_tlv_op_rx(struct ath11k_base *ab, struct sk_buff *skb)
 	cmd_hdr = (struct wmi_cmd_hdr *)skb->data;
 	id = FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
 
+	trace_ath11k_wmi_event(ab, id, skb->data, skb->len);
+
 	if (skb_pull(skb, sizeof(struct wmi_cmd_hdr)) == NULL)
 		goto out;
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
