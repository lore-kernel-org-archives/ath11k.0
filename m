Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CE9C433EF
	for <ath11k@archiver.kernel.org>; Tue, 26 Apr 2022 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vR1nHuzdVMznO6WPfRxkxArZIiN8BXmXWDwF+PCGiig=; b=2IyF2fuj3/LSmn
	ClZblGw7XqsYY/2Bh4ij7Md6ppS38XpWMRSdV0NOENEhnZS9J1DoVkaqJXR6F3SCjfMm3NCn1FccS
	6jhv+GbPVcEu3v2oOi4GsLNnUDBceko2s8kK/RT4IINYD4VcJwicAKJh6IxzdYl+aYWO0fEJ/2h/P
	zfOqKlhdhfmLEIr/WZ5+/IjtX5Wxhe6E5i+V5lRBn2M+SQEWU2kVtALvGhz4ZCNR1DQDSOE10CSuf
	AKU2mII3dV412Zchbj4Yn1zTGiBtSF725tJf9fBsXCzd/adbsO5i778LpHW/ataShwn9AV0YRC/S3
	hPb68Lsk+uwx+pycqEWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njMba-00F3VZ-1j; Tue, 26 Apr 2022 14:55:54 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njMbX-00F3St-EG
 for ath11k@lists.infradead.org; Tue, 26 Apr 2022 14:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650984951; x=1682520951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2LA6dbIM00i5LHfY48GOdkd+e9kfNvDBfsprYopumQ=;
 b=Y/JCNri+rdcQU8+NK7eIJ7Jl9RhYEnr65lYXNtjF0Fur/48dQ8SQcB4a
 l7nuL7dRjVXTORXaV5tbeN3gjhQ2A4K2MR9BNYcNxgEgEtLHTxrGM+Xrh
 EF1QROuVoTSeJZjoI72wB8N05YgKE6ixJvqizFcImXsr8dOBggiaA1EOL Y=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 26 Apr 2022 07:55:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 07:55:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:50 -0700
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 07:55:47 -0700
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <mka@chromium.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH v5 10/12] ath11k: WMI changes to support WCN6750
Date: Tue, 26 Apr 2022 20:24:54 +0530
Message-ID: <20220426145456.8055-11-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
References: <20220426145456.8055-1-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_075551_549162_D50D51C0 
X-CRM114-Status: GOOD (  11.41  )
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

WCN6750 is a single PDEV non-DBS chip which supports 2G, 5G and 6G bands.
It is a single LMAC device which can be either hooked to 2G/5G/6G bands.
Add WMI changes to support WCN6750.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index d7243819d9bd..3c0ac1e29479 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -391,6 +391,10 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	ab->target_pdev_ids[ab->target_pdev_count].pdev_id = mac_phy_caps->pdev_id;
 	ab->target_pdev_count++;
 
+	if (!(mac_phy_caps->supported_bands & WMI_HOST_WLAN_2G_CAP) &&
+	    !(mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP))
+		return -EINVAL;
+
 	/* Take non-zero tx/rx chainmask. If tx/rx chainmask differs from
 	 * band to band for a single radio, need to see how this should be
 	 * handled.
@@ -398,7 +402,9 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		pdev_cap->tx_chain_mask = mac_phy_caps->tx_chain_mask_2g;
 		pdev_cap->rx_chain_mask = mac_phy_caps->rx_chain_mask_2g;
-	} else if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
+	}
+
+	if (mac_phy_caps->supported_bands & WMI_HOST_WLAN_5G_CAP) {
 		pdev_cap->vht_cap = mac_phy_caps->vht_cap_info_5g;
 		pdev_cap->vht_mcs = mac_phy_caps->vht_supp_mcs_5g;
 		pdev_cap->he_mcs = mac_phy_caps->he_supp_mcs_5g;
@@ -408,8 +414,6 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 			WMI_NSS_RATIO_ENABLE_DISABLE_GET(mac_phy_caps->nss_ratio);
 		pdev_cap->nss_ratio_info =
 			WMI_NSS_RATIO_INFO_GET(mac_phy_caps->nss_ratio);
-	} else {
-		return -EINVAL;
 	}
 
 	/* tx/rx chainmask reported from fw depends on the actual hw chains used,
-- 
2.35.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
