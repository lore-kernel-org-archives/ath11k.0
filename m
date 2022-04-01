Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6985DC433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbIIVqAXAb2OVW2vcR8/nrNSxKwK+09agP8AbXcAYrQ=; b=33Wt/B0lNODJ1g
	7oP31VxvVItdIIVD1UIjq/jrr7jpp4UvJpSEuydabZN18fONRALyneK4F6EwEbC2deh+8G4yB5wMA
	3daXo17q8Ptl/VWcTSSzHLGhCBiZxHubBNg/D9Rh2EYOXmAINMbh9TsRDqkcMk4PalK0jf3R1i+H7
	sGM61IePXrGhCnw48BNGP43fs95FiFb4ZXW4sK0kSDOSxWfpMzgQQUpI5ZyNe6mcepw5tMoXYMstT
	ECkmbF7N8UKVU2e9n6SIHCYjEosMe6T944frcSOpaF6k++4TdJ1CCgeFGw/L0fEqbK+LTU280eSbT
	S8lJOzO4tPMa8rMdyIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naG6V-005ai7-Lk; Fri, 01 Apr 2022 12:10:11 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naG6S-005afj-NE
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 12:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648815008; x=1680351008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPZKE3ZeXnOXqHSBsAPmCy4uzHnT7muSQPP9H6jmQE0=;
 b=zhXhFn5jwoJEhkb/uRFh6MagOmChWNBiU45cB/6b95gHclpxbmzWBJI0
 dbvPgNDGzl4OPQv8UHj2yT5lrozoc3b6QuK36EAJd5HZ5lJKhfxVGkOe4
 5cU24lV3yJHpbVtLCRvBTcTM0U+u6J3nxbcbbpMGXiB0QODjoJ7ekBFao I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Apr 2022 05:10:03 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 05:10:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 05:10:02 -0700
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 1 Apr 2022 05:10:01 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v4 1/2] ath11k: add support for extended wmi service bit
Date: Fri, 1 Apr 2022 20:09:47 +0800
Message-ID: <20220401120948.1312956-2-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_051008_826501_FB4C718B 
X-CRM114-Status: GOOD (  15.29  )
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

From: Wen Gong <quic_wgong@quicinc.com>

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
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 81 ++++++++++++++++-----------
 drivers/net/wireless/ath/ath11k/wmi.h |  9 ++-
 2 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 3af24b18204e..a5876e0378fe 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7297,47 +7297,64 @@ static void ath11k_vdev_install_key_compl_event(struct ath11k_base *ab,
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
index 925b8003feae..da9b0a90fd70 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1992,6 +1992,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_ACK_TIMEOUT = 126,
 	WMI_TLV_SERVICE_PDEV_BSS_CHANNEL_INFO_64 = 127,
 
+	/* The first 128 bits */
 	WMI_MAX_SERVICE = 128,
 
 	WMI_TLV_SERVICE_CHAN_LOAD_INFO = 128,
@@ -2084,7 +2085,11 @@ enum wmi_tlv_service {
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
@@ -5378,7 +5383,7 @@ struct ath11k_wmi_base {
 
 	struct completion service_ready;
 	struct completion unified_ready;
-	DECLARE_BITMAP(svc_map, WMI_MAX_EXT_SERVICE);
+	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
 	const struct wmi_peer_flags_map *peer_flags;
 	u32 num_mem_chunks;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
