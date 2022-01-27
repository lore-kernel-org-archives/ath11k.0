Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CEBC4332F
	for <ath11k@archiver.kernel.org>; Thu, 27 Jan 2022 05:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=www6CLx/nxzGin6mn6KSQ3uLdQBt7VkuR8VpFwnFNiA=; b=2mRwsplasFxAiy
	yjR4DexRMxsSx7lKlT34OybhzMEB+aLaUxbqXlZU1kvCk8JKDDFjfOKukcC9vyummrP2X9cvZcuwh
	qXEh1pGCbejwX75BvhojQzNVb6ETPMyQPSpBQ0QglAc1cZIO4uvUdxExkLPkp9TvNrCykGmfO2oSB
	XVYwZSUq3FjoXgbQIIM4BNj7QPOXYC4WeN/FqDfNE+ocP4YT/KcHiQ16RhavL65c+JhamXETmhxNK
	gF6C+E31ap/nro0nvGGBja9mWyeLMuK12qPRjXI4wZ2aqjfjEca03FgtuMxMwWdHTvD9Zy551uFNR
	Mir1mGDlNfTZ20RTZbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCxPx-00EPWl-2K; Thu, 27 Jan 2022 05:33:57 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCxPr-00EPSZ-JC
 for ath11k@lists.infradead.org; Thu, 27 Jan 2022 05:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1643261631; x=1674797631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0LNGn4Augm8ykglUCzO1NAeXrbYBC//4ak+/9v2H5R8=;
 b=nheW+XyduqWt8bhChMuvpHMQo1RnDL5gRgSm+D8zqmEiy7kWYhgDW2sJ
 XPK5BbDWO3bdsLttR5uLsSYUB4N4OxUWPIAPIq3dhk2m4uxO9HhxjvWYG
 o78SVgE+rX4F6C7Ajz19JLGGxkeh7WUmFTJ2SN8QlzODorumg7Mevnftv E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 26 Jan 2022 21:33:51 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:33:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:51 -0800
Received: from mpubbise-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 26 Jan 2022 21:33:49 -0800
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Manikanta Pubbisetty
 <quic_mpubbise@quicinc.com>
Subject: [PATCH RFC 4/8] ath11k: Cap NSS of HE peer to radio supported NSS
Date: Thu, 27 Jan 2022 11:03:25 +0530
Message-ID: <1643261609-13500-5-git-send-email-quic_mpubbise@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
References: <1643261609-13500-1-git-send-email-quic_mpubbise@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_213351_687386_A0E16710 
X-CRM114-Status: UNSURE (   9.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Cap NSS of HE peer to radio supported NSS during assoc, this
is needed as the WCN6750 FW expects peer NSS to be <= radio
supported NSS, this will fix the FW assert because of peer
NSS being greater than max NSS supported by the radio.

Since we are capping the NSS to the NSS that radio supports,
this change should not impact other supported hardware.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1

Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2402405..55cdee9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -2274,6 +2274,7 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 			max_nss = i + 1;
 	}
 	arg->peer_nss = min(sta->rx_nss, max_nss);
+	arg->peer_nss = min_t(u32, arg->peer_nss, ar->num_rx_chains);
 
 	if (arg->peer_phymode == MODE_11AX_HE160 ||
 	    arg->peer_phymode == MODE_11AX_HE80_80) {
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
