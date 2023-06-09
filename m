Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6C7C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i56rVLoCmj06x/M5sjy84G9w3ZJoIpr/7yikKKTM0QY=; b=Vf/+X5DGumhaEL
	EN9/a5HmkhOgq/2mXjkT5Z04iJuapID/k+zrO0wcHJmEsVDbluvVtAfF/qp1DWqrwi3SawmDLUQr5
	5m0h2ZsXiIM9Qr12YvXykMQa3qmn8+eU224sFaA3QUy/LW92CYdWbPwgcuV4nrNT4g/0mAhQQUtKq
	RfEeN46ghHjw9INEjh9SQFIJ2mmVczIVk47+qhKn5ZsuK42WMqtvljdT1va3FR9F8WLGWUMs+ixQ4
	3TBxT15iJz1e2Lm2KIC1VMaAMUNPkWsO2JcLcQdQlN9GK8KAILKGXRsfKaqEK+TD1rgGbAdNRV1rN
	1Z/X435bB/6Nt6DvI5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2m-00DFVy-0U;
	Fri, 09 Jun 2023 14:24:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7d2j-00DFUr-26
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 14:24:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D3026173E
	for <ath11k@lists.infradead.org>; Fri,  9 Jun 2023 14:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14429C433D2;
	Fri,  9 Jun 2023 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686320684;
	bh=UaJWYbBerV1+c0yzKaM0ZSFmcF3N7Eb/Hwya0EflQhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Co0fOLUR91I1KLFbrxWdB90ygZFhi0sjHYmQgwZU/5gsIkXiX4n8UR6MYYdvUwxRN
	 MqOpO5KkrgZ5DeFzg7dSmRJz27LdiT6YS6O1DooO9PpY6djP+VWRdWNXQMpvjQqbs6
	 h/KtaZ2oez/eZak1/pf0U87rxWnUnkL6bANmTMllsrcRfm3rDj4h8M8s2hywLFUuHR
	 UdWgyomS3WHt2SdBj5v3GuTWSRAmV7f5cx+s0TRswGqxUILiVRNRBL5+tMuURrCMN8
	 2shph3bbhgWpSQs1pu6JhbM/wvg6xpnTucKoYuuqv28xlsBsdFnzZwrKckMs6tqbfT
	 WD6DkEnaRDraw==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH 01/15] wifi: ath11k: debug: remove unused ATH11K_DBG_ANY
Date: Fri,  9 Jun 2023 17:24:26 +0300
Message-Id: <20230609142440.24643-2-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230609142440.24643-1-kvalo@kernel.org>
References: <20230609142440.24643-1-kvalo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_072445_726886_3AF189AC 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

It's not used anywhere so can be easily removed.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.h b/drivers/net/wireless/ath/ath11k/debug.h
index 621d85f3118c..0a9418c36bf4 100644
--- a/drivers/net/wireless/ath/ath11k/debug.h
+++ b/drivers/net/wireless/ath/ath11k/debug.h
@@ -26,7 +26,6 @@ enum ath11k_debug_mask {
 	ATH11K_DBG_PCI		= 0x00001000,
 	ATH11K_DBG_DP_TX	= 0x00002000,
 	ATH11K_DBG_DP_RX	= 0x00004000,
-	ATH11K_DBG_ANY		= 0xffffffff,
 };
 
 __printf(2, 3) void ath11k_info(struct ath11k_base *ab, const char *fmt, ...);
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
