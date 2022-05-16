Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044FFC433EF
	for <ath11k@archiver.kernel.org>; Mon, 16 May 2022 03:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YY6ql34i434tGpeONLjegEQbDjpQfoBzelh4CI5oyoA=; b=QocqPfTEtk+M8r
	UTuMbteXDVsIp1lE0Mqxei7I0sX85mx0VbXwNiCsB2j323pcOwzJ4vxoxRcXJB85DxgBvosEoVRXB
	Jj1mwvv5oJtlzoQ201+Ml/MveOj2YNzU8t3NTPknvFASd/xS9uX+owlIGUG7EWUZ9JVmchunUvOak
	ALOevz4i0GzuwHZq+RjeszFS30aGZXs/x66fPc2BTIED/7dNO3FNAkB+9IfKTlEXWKvroxJNP5eGe
	05ZabwLL5yp2CP1ENXPY1b/bqJ1FgfhYkcytAHbzg3jdr8N7dRfGsGAVh8AbM3emCVHNby4fD+qKX
	aPRX1LRK8WWuk3Zg/5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqRLK-005lUV-JM; Mon, 16 May 2022 03:24:22 +0000
Received: from edge01.meizu.com ([14.29.68.187] helo=mail.meizu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqRLH-005lSr-9a
 for ath11k@lists.infradead.org; Mon, 16 May 2022 03:24:21 +0000
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 16 May
 2022 11:24:02 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 16 May
 2022 11:23:59 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>
CC: Haowen Bai <baihaowen@meizu.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ath11k: Fix pointer dereferenced before checking
Date: Mon, 16 May 2022 11:23:56 +0800
Message-ID: <1652671437-20235-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_202419_539421_5D4168FF 
X-CRM114-Status: UNSURE (   9.29  )
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

The pointer sspec is dereferencing pointer sar before sar is being
null checked. Fix this by assigning sar->sub_specs to sspec only if
sar is not NULL, otherwise just NULL. The code has checked sar whether
it is NULL or not as below, but use before checking.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1957e1713548..fe97c9a3c1c5 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8287,7 +8287,7 @@ static int ath11k_mac_op_set_bios_sar_specs(struct ieee80211_hw *hw,
 					    const struct cfg80211_sar_specs *sar)
 {
 	struct ath11k *ar = hw->priv;
-	const struct cfg80211_sar_sub_specs *sspec = sar->sub_specs;
+	const struct cfg80211_sar_sub_specs *sspec = sar ? sar->sub_specs : NULL;
 	int ret, index;
 	u8 *sar_tbl;
 	u32 i;
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
