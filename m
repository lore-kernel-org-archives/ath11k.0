Return-Path: <SRS0=Cifq=M3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AD1C4338F
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 18:13:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022F460EB2
	for <ath11k@archiver.kernel.org>; Wed,  4 Aug 2021 18:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 022F460EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvaSVfXVWjhnA8yFg6xSK4ImoPME/KMIq83y8Ep/ups=; b=s2Cv9u4JsPBlaG
	+Tcr5TPvxis7xnlqG0Bp0u/tty+6i4SlAF4ru6Mvz2VNmdBpMjVFSUo+jP6szUvMOhCyW2PIgxt8J
	UvO/bk6wqCdikSmXLYYqw8PXlBNpWJRmqMHU1OFucv/HbCV1ci7zJ8chc3EsZliQ3Nv4eMJ0toOpG
	4mmGITMEPO/IRzpf5Wa40jw28i7Lxy5CUoYIonOr1p9+512E5C55aX0u0RMGqo85nkRJ8Mmlh9mSS
	cCptXIo3w7msnJkhg5HhzaQp0gjhX4YYRoQXQnQXn3EorLzZupQJJ6jBoY1aBwLuIEIxAMlstRrU9
	nOIbFW1V/OhBpX3pHw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBLOE-0078mQ-2B; Wed, 04 Aug 2021 18:13:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBLO1-0078dq-AW
 for ath11k@lists.infradead.org; Wed, 04 Aug 2021 18:13:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628100791; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3/DgNzMjlr5AhtAejF7QwvtDRT1kV61NpQRnue6gGxc=;
 b=bT3f8nLlBebknxznAs+Kn1XA+o04mFi/IT+7KEjckDw/xLaANgmtcPwJ2CRDb7ORD1/KUDvE
 NxBOAQt6EKp6ZwLiZ0MG/Os4tuRe27YKDR6wI7FbPz8P9F4JKwnjYTDVvEHIw1ZGmcKRKin9
 qzG8wgcUmPC55gW1kQDm37QFEN0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 610ad896bcdc32aad31b0e59 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 18:12:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 05C66C43460; Wed,  4 Aug 2021 18:12:36 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-77-199-nat.elisa-mobile.fi
 [85.76.77.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38F14C433D3;
 Wed,  4 Aug 2021 18:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38F14C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 3/3] ath11k: copy cap info of 6G band under
 WMI_HOST_WLAN_5G_CAP for WCN6855
Date: Wed,  4 Aug 2021 21:12:17 +0300
Message-Id: <20210804181217.88751-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804181217.88751-1-jouni@codeaurora.org>
References: <20210804181217.88751-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_111311_976571_E6D8125F 
X-CRM114-Status: GOOD (  13.44  )
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

From: Wen Gong <wgong@codeaurora.org>

WCN6855 has 2 phys, one is 2G, another is 5G/6G, so it should copy the
cap info of 6G band under the check of WMI_HOST_WLAN_5G_CAP as well as
for the 5G band. Some chips like QCN9074 only have 6G, not have 2G and
5G, and this 6G capability is also under WMI_HOST_WLAN_5G_CAP, so this
change will not disturb it.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index e7429d17030b..ec46e06aace9 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -407,18 +407,18 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
 		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
 		       sizeof(struct ath11k_ppe_threshold));
-	}
 
-	cap_band = &pdev_cap->band[NL80211_BAND_6GHZ];
-	cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
-	cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
-	cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
-	cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
-	cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
-	memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
-	       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
-	memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
-	       sizeof(struct ath11k_ppe_threshold));
+		cap_band = &pdev_cap->band[NL80211_BAND_6GHZ];
+		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_5g;
+		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_5g;
+		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_5g;
+		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_5g_ext;
+		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_5g;
+		memcpy(cap_band->he_cap_phy_info, &mac_phy_caps->he_cap_phy_info_5g,
+		       sizeof(u32) * PSOC_HOST_MAX_PHY_SIZE);
+		memcpy(&cap_band->he_ppet, &mac_phy_caps->he_ppet5g,
+		       sizeof(struct ath11k_ppe_threshold));
+	}
 
 	return 0;
 }
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
