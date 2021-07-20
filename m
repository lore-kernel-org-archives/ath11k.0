Return-Path: <SRS0=yaCs=MM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABDAC07E95
	for <ath11k@archiver.kernel.org>; Tue, 20 Jul 2021 21:50:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C914D60FF2
	for <ath11k@archiver.kernel.org>; Tue, 20 Jul 2021 21:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C914D60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zaz81sYeHRHW1fhoUXc2BW2AsLaX3Pwcy+FiNAtIzB4=; b=3y7Bsww7tJoPHi
	P6HtZ8u9kaqSeia++sGZd1ZtIzHxV9K++BXsqu/MTy3M6CFZdrsiZAPqRobLrlRGmC5tbPqFrqpGu
	R75gxTTsnSanWl91AJbbK3mCvD4MaYMVntJ58DONEY9Zwxwz1D6OeAYSdeSl3vXfwg45FM+BiuFxh
	+Djy9YpK5nZzFtYaMe0Kwk0gLcXuBUCIZZYgmkyvn2T7lfArP4WvgxzW9w3nuAEPlmZUVNq9QmMEO
	VFcufov/AwgPTnjnVDPwkuh5K2k1gRrnxoyvu0C7AEpfLT0Fe9Wo+HGCMMUyeCM9qnQ28l2sFhhlD
	YJMhcJxGdxuVHNDMKstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5xco-00E1PI-FA; Tue, 20 Jul 2021 21:50:02 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5xci-00E1HL-3I
 for ath11k@lists.infradead.org; Tue, 20 Jul 2021 21:50:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626817798; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6pzFGEDvqBEmnGYB5qUOd0LsVvfzg+I3RubpomLBkZs=;
 b=oVzcnLEaD9jnWrt4NlYmsKZuPlD8WKfOOhzehjDrqptyAOUVXsjJeeO0XQjjrFbt2gcSgDpd
 8raTIQdFNb+Taa5me3TQhYDNnqrjQx97xSP3szlOGLAUAmXTZkXy/pyhq7+EovVhhmWYUZJO
 0hgHFucY9WIJ12VqjJaDxpqDxSI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60f744f225e56632788129cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 21:49:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2BF7C433F1; Tue, 20 Jul 2021 21:49:38 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76032C43460;
 Tue, 20 Jul 2021 21:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76032C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Ritesh Singh <ritesi@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/3] ath11k: Align bss_chan_info structure with firmware
Date: Wed, 21 Jul 2021 00:49:22 +0300
Message-Id: <20210720214922.118078-3-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720214922.118078-1-jouni@codeaurora.org>
References: <20210720214922.118078-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_144958_964043_5CD4CD14 
X-CRM114-Status: GOOD (  14.46  )
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

pdev_id in structure 'wmi_pdev_bss_chan_info_event' is wrongly placed
at the beginning. This causes invalid values in survey dump. Hence, align
the structure with the firmware.

Note: The firmware releases follow this order since the feature was
implemented. Also, it is not changing across the branches including
QCA6390.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 1 +
 drivers/net/wireless/ath/ath11k/wmi.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a53783229520..e3d11a0a7b7c 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1339,6 +1339,7 @@ int ath11k_wmi_pdev_bss_chan_info_request(struct ath11k *ar,
 				     WMI_TAG_PDEV_BSS_CHAN_INFO_REQUEST) |
 			  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
 	cmd->req_type = type;
+	cmd->pdev_id = ar->pdev->pdev_id;
 
 	ath11k_dbg(ar->ab, ATH11K_DBG_WMI,
 		   "WMI bss chan info req type %d\n", type);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 78849f0255fa..799b3bd96a27 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2962,6 +2962,7 @@ struct wmi_pdev_bss_chan_info_req_cmd {
 	u32 tlv_header;
 	/* ref wmi_bss_chan_info_req_type */
 	u32 req_type;
+	u32 pdev_id;
 } __packed;
 
 struct wmi_ap_ps_peer_cmd {
@@ -4058,7 +4059,6 @@ struct wmi_vdev_stopped_event {
 } __packed;
 
 struct wmi_pdev_bss_chan_info_event {
-	u32 pdev_id;
 	u32 freq;	/* Units in MHz */
 	u32 noise_floor;	/* units are dBm */
 	/* rx clear - how often the channel was unused */
@@ -4076,6 +4076,7 @@ struct wmi_pdev_bss_chan_info_event {
 	/*rx_cycle cnt for my bss in 64bits format */
 	u32 rx_bss_cycle_count_low;
 	u32 rx_bss_cycle_count_high;
+	u32 pdev_id;
 } __packed;
 
 #define WMI_VDEV_INSTALL_KEY_COMPL_STATUS_SUCCESS 0
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
