Return-Path: <SRS0=yaCs=MM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319AEC07E9B
	for <ath11k@archiver.kernel.org>; Tue, 20 Jul 2021 21:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED65060FE7
	for <ath11k@archiver.kernel.org>; Tue, 20 Jul 2021 21:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED65060FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuuABfGHZW8p+GHzeG5rX1Y0e+lGDZ4aCyZaWM4DjQE=; b=CMuFMtT81EFO/6
	kJHRth+MV/URsbKQW95zz1jT/p7hyN2RbA0WAC2FQvem0k8Ya4j0l+dzwKBHE0wGOSAHLhIxljLTl
	jS1Xm+pLuzJFbTZqaPmj6zdjkWj8gB/6X1JOKRDXIHo67yvnnF5ozf0h9meBJdKPuoWGH0wOIMqkt
	Oa9iLsEUme0uJKCQxKkE2EMYTnMITSDlYMSJJb46E6z5kefp8z5iztI0zazy8HS70/OmJCRxwwgqR
	c5egUeFSkX8VHIguoasMTEGMU+uD+FWuh0FM+ITJ2LqfXsHhl3iwSb+sbF+ykSauxhHAVnX2YvPd0
	pBIR1vB/q18Mk6uwndwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5xce-00E1Lg-TZ; Tue, 20 Jul 2021 21:49:52 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5xcY-00E1Jl-DE
 for ath11k@lists.infradead.org; Tue, 20 Jul 2021 21:49:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626817790; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7EQEc/VP9Lg/IBDN+NJ7ZgpyA0kCuwCmfdbaDNmzUbY=;
 b=qd993nRiiN3PpPhY71iErAMxhN6S8Dyl9UrGcQq0UGDnbqQM156/aEQGRmIxJpfnBzGxcapN
 9muzwj68HWX3hLfIp/FVsKcucD0xidwhJD3xzeLNsmgSPK/hf+eTJzpOPbTHz8RNf6izLymU
 c8eBGpaCL+cmrv+svFMtVyIrUNQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f744f0b653fbdadd11504c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 21:49:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 12EC7C433F1; Tue, 20 Jul 2021 21:49:36 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF82DC433D3;
 Tue, 20 Jul 2021 21:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF82DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Ritesh Singh <ritesi@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 2/3] ath11k: add support in survey dump with bss_chan_info
Date: Wed, 21 Jul 2021 00:49:21 +0300
Message-Id: <20210720214922.118078-2-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720214922.118078-1-jouni@codeaurora.org>
References: <20210720214922.118078-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_144950_728757_5E674708 
X-CRM114-Status: GOOD (  12.71  )
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

From: Seevalamuthu Mariappan <seevalam@codeaurora.org>

Survey dump statistics is not displaying channel rx and tx time because
the service flag is not enabled. Enable the service flag "bss_chan_info"
in wmi_resource_config to fetch and print the stats for the specific
pdev.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hw.c  | 2 ++
 drivers/net/wireless/ath/ath11k/wmi.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index d9596903b0a5..9dd02f8b1dd2 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -97,6 +97,7 @@ static void ath11k_init_wmi_config_qca6390(struct ath11k_base *ab,
 	config->num_multicast_filter_entries = 0x20;
 	config->num_wow_filters = 0x16;
 	config->num_keep_alive_pattern = 0;
+	config->flag1 |= WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
 }
 
 static void ath11k_hw_ipq8074_reo_setup(struct ath11k_base *ab)
@@ -197,6 +198,7 @@ static void ath11k_init_wmi_config_ipq8074(struct ath11k_base *ab,
 	config->peer_map_unmap_v2_support = 1;
 	config->twt_ap_pdev_count = ab->num_radios;
 	config->twt_ap_sta_count = 1000;
+	config->flag1 |= WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64;
 }
 
 static int ath11k_hw_mac_id_to_pdev_id_ipq8074(struct ath11k_hw_params *hw,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 234aa59f708e..78849f0255fa 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2244,6 +2244,8 @@ struct wmi_init_cmd {
 	u32 num_host_mem_chunks;
 } __packed;
 
+#define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 BIT(5)
+
 struct wmi_resource_config {
 	u32 tlv_header;
 	u32 num_vdevs;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
