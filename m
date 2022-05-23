Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC17DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 23 May 2022 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xJp9qtDg6e1wOb1KL1ntstVVSq80IBQzDiiNTg33w0c=; b=d7m/bB5fRZzYFq
	MHXLge7JYbKfWezgJ1etpsTIyWd0UnIiwCEezlCQ9fVm4UWEXG2P2sOnXp0abR5NZC1AuJlIGwX5x
	u6dgV2DA5MGIwKssC7CqTPztHFzVI+yHMB5bpL7pwL0Wws69F5U7LARMxTdWiRwfPYMP041j6Ro7F
	ib/mwlS4W9GSfC+Vh2yydlX5chVn5r4mqml6GM7NL3SvaGXgpV6NoGdsxOGPpCfZyznwUIzecXR4C
	Gg0Zs6kUg8ksT3hSWdcnd7lp6xMl3DrDkhjKcOhotHHav8QqJ5tjkaw1TdI0OM+dE4PEymtz3Kykn
	hy1Rs9prWGX/aemCn2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4KB-002pFn-I1; Mon, 23 May 2022 09:26:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2op-002A7b-Rs
 for ath11k@bombadil.infradead.org; Mon, 23 May 2022 07:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=E3Ix6skTU/ChiwdneFC08WAQXDRPjr6009fjmvtbd8U=; b=B+PAmRlcIvH4s4t5QH/bG6q8GN
 JkG9fqtFdcSbYy5+opAx0+LoympDpqnrvPk+oUrb9xSrN8KylyAD+ng0fJhlqz8bNoSQcqnp6O9/0
 lDoSL+2GLHtFqvLq/78oTx+XpS6YxjqK9f0n0d++Z8XCntcr585t+hhBVIj7IJOiR2FYuGhl4GICz
 r+W3+R5oZbo+aOgCCbvQqDIZ5ag1+Q/5otlkwz0Hxu9k9+xtJOt9Tk65U5G6JXaFlyF55mdAoUhiJ
 3frmiEAZlqy210Mbon7QiiRZDLIXXIWZr2ngfQ2nsObol6M+EuUQe8uUIPhZ6yXI+VZ7H+3EKW0Tv
 4xKFEvZw==;
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt19L-000seI-OG
 for ath11k@lists.infradead.org; Mon, 23 May 2022 06:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653285760; x=1684821760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E3Ix6skTU/ChiwdneFC08WAQXDRPjr6009fjmvtbd8U=;
 b=niDWRzgXuJCTg+4LzAxSIrRsD729HsAotLLks7kOL3jbVKN1Fp8CUnEs
 bGNL6dief+VMXQ8XjkgzRRlUQ03Q/7mMDBdbhGr/2RMuoHQAFTCQMGhO/
 LT2T607S2GI4/DMl/vcrfJsRVEKKN7u0RfECUe4XI+/WWMb4tOaO+ynON E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 22 May 2022 23:01:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 23:01:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:26 -0700
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 22 May 2022 23:01:26 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 <ath11k@lists.infradead.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>, John Crispin <john@phrozen.org>
Subject: [PATCH 2/9] ath11k: add WMI resource config for EMA
Date: Sun, 22 May 2022 23:01:01 -0700
Message-ID: <20220523060108.23982-3-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220523060108.23982-1-quic_alokad@quicinc.com>
References: <20220523060108.23982-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070240_294744_CBE24C6A 
X-CRM114-Status: GOOD (  11.10  )
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

Add new fields in structures target_resource_config and
wmi_resource_config to configure maximum vdev count and profile
periodicity when enhanced multiple BSSID advertisements (EMA) are
enabled.

Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
- This patch-set splits the changes from following patch in
logical separate patches:
https://patchwork.kernel.org/project/linux-wireless/patch/20210120003221.21984-1-alokad@codeaurora.org/
And also use the latest API changes in MAC80211 which were different
at the time of V6.

 drivers/net/wireless/ath/ath11k/hw.c  |  3 +++
 drivers/net/wireless/ath/ath11k/hw.h  |  1 +
 drivers/net/wireless/ath/ath11k/wmi.c |  3 +++
 drivers/net/wireless/ath/ath11k/wmi.h | 16 ++++++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 96db85c55585..5672def09e32 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -201,6 +201,9 @@ static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 	config->twt_ap_pdev_count = ab->num_radios;
 	config->twt_ap_sta_count = 1000;
 	config->flag1 |= WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
 }
 
 static int ath11k_hw_mac_id_to_pdev_id_ipq8074(struct ath11k_hw_params *hw,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 77dc5c851c9b..a9e8d325a059 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -64,6 +64,7 @@
 #define TARGET_NUM_WDS_ENTRIES		32
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
+#define TARGET_EMA_MAX_PROFILE_PERIOD	8
 
 #define ATH11K_HW_MAX_QUEUES		4
 #define ATH11K_QUEUE_LEN		4096
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 84d1c7054013..b71f68d675f1 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -3934,6 +3934,9 @@ ath11k_wmi_copy_resource_config(struct wmi_resource_config *wmi_cfg,
 	wmi_cfg->sched_params = tg_cfg->sched_params;
 	wmi_cfg->twt_ap_pdev_count = tg_cfg->twt_ap_pdev_count;
 	wmi_cfg->twt_ap_sta_count = tg_cfg->twt_ap_sta_count;
+	wmi_cfg->flags2 = WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET;
+	wmi_cfg->ema_max_vap_cnt = tg_cfg->ema_max_vap_cnt;
+	wmi_cfg->ema_max_profile_period = tg_cfg->ema_max_profile_period;
 }
 
 static int ath11k_init_cmd_send(struct ath11k_pdev_wmi *wmi,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index b1fad4707dc6..842c074c7efa 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2308,6 +2308,7 @@ struct wmi_init_cmd {
 } __packed;
 
 #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 BIT(5)
+#define WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET BIT(9)
 
 struct wmi_resource_config {
 	u32 tlv_header;
@@ -2368,6 +2369,18 @@ struct wmi_resource_config {
 	u32 sched_params;
 	u32 twt_ap_pdev_count;
 	u32 twt_ap_sta_count;
+	u32 max_nlo_ssids;
+	u32 num_pkt_filters;
+	u32 num_max_sta_vdevs;
+	u32 max_bssid_indicator;
+	u32 ul_resp_config;
+	u32 msdu_flow_override_config0;
+	u32 msdu_flow_override_config1;
+	u32 flags2;
+	u32 host_service_flags;
+	u32 max_rnr_neighbours;
+	u32 ema_max_vap_cnt;
+	u32 ema_max_profile_period;
 } __packed;
 
 struct wmi_service_ready_event {
@@ -5326,6 +5339,9 @@ struct target_resource_config {
 	u32 sched_params;
 	u32 twt_ap_pdev_count;
 	u32 twt_ap_sta_count;
+	bool is_reg_cc_ext_event_supported;
+	u32 ema_max_vap_cnt;
+	u32 ema_max_profile_period;
 };
 
 enum wmi_sys_cap_info_flags {
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
