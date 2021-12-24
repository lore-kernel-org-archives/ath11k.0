Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E99C433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Dec 2021 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTC5W5O4L4lmO6SPFo6ydXaepfE4cNCV9v+sVphmaBk=; b=aVrw0NlHljNVXw
	rA9x7yQ6KK5FOdnjHHAZtjV7jplDUjQY7CbCa/I+eB9m417o4a/Z0hZa7+QbPCLrVPQ3eLqyjYpJr
	a0WEodn2s+KfLar1jdOnxI7QMvJ8CfpmujqvVGdUmtP7VIUBl8apwo5mqGmkrJ1WyOO7AUEdoWvdR
	YeUHXK7bPaRCr5540LQJBBdD4H7+DJbH/29KpbN/mImPQJlTHtHj4oCiioaG4U/gaF8pzDpG6XGBW
	DoRRRBs/maueJyWpPCj17klGW8WUuiyp7w0mAu1bTSGvQAvc3SujFsocx0hys34EjAZTlSq/PaZ5E
	+yJ5vRwAxc/AoDYBfIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gJv-00DxlK-Ix; Fri, 24 Dec 2021 08:52:59 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gJs-00Dxjw-HW
 for ath11k@lists.infradead.org; Fri, 24 Dec 2021 08:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640335976; x=1671871976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aXHFj3HvpAdMxKlLrBOVJfP6/nTgtdY5+3agdh4WGA4=;
 b=i+5Wpa2fQxPxot+buw501emG7YQkn7Dq1IE/HUUp4lfxoUuy/kTikfmw
 ehg1JNwzTQrsHH16ZHQQMAe4iiWtl5k2b9B3KcxWmGffkpRaF7GOYnzyQ
 YT3kd4g2vwqLCA2uFiu7pxZnGhSQyoNQdBeduG/C67N0dwG7DUZ1TaULj w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Dec 2021 00:52:55 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 00:52:55 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 00:52:55 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 24 Dec 2021 00:52:53 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2 01/15] ath11k: add support for extended wmi service bit
Date: Fri, 24 Dec 2021 03:52:22 -0500
Message-ID: <20211224085236.9064-2-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211224085236.9064-1-quic_wgong@quicinc.com>
References: <20211224085236.9064-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_005256_656571_12A70CF9 
X-CRM114-Status: GOOD (  14.75  )
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

Currently the wmi service bis is report from firmware, it is divided
to 128 bits for each segment. The first segment is processed by
ath11k_wmi_service_bitmap_copy(), the second segment is processed by
ath11k_service_available_event() with WMI_TAG_SERVICE_AVAILABLE_EVENT,
When the service bit exceed 256 bits, then firmware report it by tag
WMI_TAG_ARRAY_UINT32 in WMI_SERVICE_AVAILABLE_EVENTID.

ath11k does not process the third segment, this is to extend the wmi
service bits from 256 to 384 for the third 128 bits. The 3 enum value
WMI_MAX_SERVICE(128)/WMI_MAX_EXT_SERVICE(256)/WMI_MAX_EXT2_SERVICE(384)
are convenient to process the service bits.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 81 ++++++++++++++++-----------
 drivers/net/wireless/ath/ath11k/wmi.h |  9 ++-
 2 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6b68ccf65e39..bfb3effc161d 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7112,47 +7112,64 @@ static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab,
 	rcu_read_unlock();
 }
 
-static void ath11k_service_available_event(struct ath11k_base *ab, struct sk_buff *skb)
+static int  ath11k_wmi_tlv_services_parser(struct ath11k_base *ab,
+					   u16 tag, u16 len,
+					   const void *ptr, void *data)
 {
-	const void **tb;
 	const struct wmi_service_available_event *ev;
-	int ret;
+	u32 *wmi_ext2_service_bitmap;
 	int i, j;
 
-	tb = ath11k_wmi_tlv_parse_alloc(ab, skb->data, skb->len, GFP_ATOMIC);
-	if (IS_ERR(tb)) {
-		ret = PTR_ERR(tb);
-		ath11k_warn(ab, "failed to parse tlv: %d\n", ret);
-		return;
-	}
+	switch (tag) {
+	case WMI_TAG_SERVICE_AVAILABLE_EVENT:
+		ev = (struct wmi_service_available_event *)ptr;
+		for (i = 0, j = WMI_MAX_SERVICE;
+			i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
+			i++) {
+			do {
+				if (ev->wmi_service_segment_bitmap[i] &
+				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
+					set_bit(j, ab->wmi_ab.svc_map);
+			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+		}
 
-	ev = tb[WMI_TAG_SERVICE_AVAILABLE_EVENT];
-	if (!ev) {
-		ath11k_warn(ab, "failed to fetch svc available ev");
-		kfree(tb);
-		return;
-	}
+		ath11k_dbg(ab, ATH11K_DBG_WMI,
+			   "wmi_ext_service_bitmap 0:0x%04x, 1:0x%04x, 2:0x%04x, 3:0x%04x",
+			   ev->wmi_service_segment_bitmap[0],
+			   ev->wmi_service_segment_bitmap[1],
+			   ev->wmi_service_segment_bitmap[2],
+			   ev->wmi_service_segment_bitmap[3]);
+		break;
+	case WMI_TAG_ARRAY_UINT32:
+		wmi_ext2_service_bitmap = (u32 *)ptr;
+		for (i = 0, j = WMI_MAX_EXT_SERVICE;
+			i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT2_SERVICE;
+			i++) {
+			do {
+				if (wmi_ext2_service_bitmap[i] &
+				    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
+					set_bit(j, ab->wmi_ab.svc_map);
+			} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+		}
 
-	/* TODO: Use wmi_service_segment_offset information to get the service
-	 * especially when more services are advertised in multiple sevice
-	 * available events.
-	 */
-	for (i = 0, j = WMI_MAX_SERVICE;
-	     i < WMI_SERVICE_SEGMENT_BM_SIZE32 && j < WMI_MAX_EXT_SERVICE;
-	     i++) {
-		do {
-			if (ev->wmi_service_segment_bitmap[i] &
-			    BIT(j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32))
-				set_bit(j, ab->wmi_ab.svc_map);
-		} while (++j % WMI_AVAIL_SERVICE_BITS_IN_SIZE32);
+		ath11k_dbg(ab, ATH11K_DBG_WMI,
+			   "wmi_ext2_service__bitmap  0:0x%04x, 1:0x%04x, 2:0x%04x, 3:0x%04x",
+			   wmi_ext2_service_bitmap[0], wmi_ext2_service_bitmap[1],
+			   wmi_ext2_service_bitmap[2], wmi_ext2_service_bitmap[3]);
+		break;
 	}
+	return 0;
+}
 
-	ath11k_dbg(ab, ATH11K_DBG_WMI,
-		   "wmi_ext_service_bitmap 0:0x%x, 1:0x%x, 2:0x%x, 3:0x%x",
-		   ev->wmi_service_segment_bitmap[0], ev->wmi_service_segment_bitmap[1],
-		   ev->wmi_service_segment_bitmap[2], ev->wmi_service_segment_bitmap[3]);
+static void ath11k_service_available_event(struct ath11k_base *ab, struct sk_buff *skb)
+{
+	int ret;
 
-	kfree(tb);
+	ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
+				  ath11k_wmi_tlv_services_parser,
+				  NULL);
+	if (ret)
+		ath11k_warn(ab, "failed to parse services available tlv %d\n", ret);
 }
 
 static void ath11k_peer_assoc_conf_event(struct ath11k_base *ab, struct sk_buff *skb)
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 2f26ec1a8aa3..8609dcd0543b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1990,6 +1990,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_ACK_TIMEOUT = 126,
 	WMI_TLV_SERVICE_PDEV_BSS_CHANNEL_INFO_64 = 127,
 
+	/* The first 128 bits */
 	WMI_MAX_SERVICE = 128,
 
 	WMI_TLV_SERVICE_CHAN_LOAD_INFO = 128,
@@ -2082,7 +2083,11 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
 	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
 
-	WMI_MAX_EXT_SERVICE
+	/* The second 128 bits */
+	WMI_MAX_EXT_SERVICE = 256,
+
+	/* The third 128 bits */
+	WMI_MAX_EXT2_SERVICE = 384
 };
 
 enum {
@@ -5255,7 +5260,7 @@ struct ath11k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
-	DECLARE_BITMAP(svc_map, WMI_MAX_EXT_SERVICE);
+	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	const struct wmi_peer_flags_map *peer_flags;
 	u32 num_mem_chunks;
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
