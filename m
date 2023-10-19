Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDB3CDB465
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FC/Xk7xgO1DcbD79iDm8pfIS1Edru7ZeJWjknaJ1F5U=; b=2bjwQOGn8d/C/P
	CdVuiXVOgvw7Z6buaw+2xa2kxvIZ1bB2gn1LmGOKQbFIAFKpwPT2pyWRiWNy3unET66zAHGv9LaIs
	9LnB0o4i9W3BhlgIHbLgB2cb2qa6+3flnc7H6dQxnM+mwTtMrO39JBCFWwVSNoUl5ao9xvWmtWGQc
	4ffc+ImqkGxNfTbPZX+JhZd4Bx+MjZkLwdu6lPz8xATrT17DRBjLiM2KjJG6QbibVDEu3Br2dYGdV
	YuIchfB0NeWwnD6Zfrq58sKI0qgInRXQJR1WdaC/+9qTF3L8Hbc0BMOMpnWW4NoWFEhFrXNZTFLcl
	d1OpumwWQyY7xn/t1IKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtR9f-00H9bl-0B;
	Thu, 19 Oct 2023 11:25:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtR9b-00H9bA-32
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 11:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EF505B827E4;
	Thu, 19 Oct 2023 11:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50389C433C7;
	Thu, 19 Oct 2023 11:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697714725;
	bh=2+1ko55W9laxkcWM8XgRn2t5ivATFYF/i+u9InS6YGg=;
	h=From:To:Cc:Subject:Date:From;
	b=iFvREIZttd4PBZP5wFQgW5etIhNOod1lbEpO6DboYsnmHopXPF+nkcYHeWu7lFIk+
	 9Awcuzz9OUOD2zYmvbf5UhZAr38qduuWe/CGusXmhCPLjHLgylJjajGteVdG/0LKt2
	 BmjdUS/32FIfKQZFbbu/Xst0tGHXok7bZNidnvgNcFde6oYTZpnFNk2foNy2vPGwyq
	 RfUPnMjI3Te7coftpneYAaFXFuRbouSldLU0Q36q0EjFjCJYlPrwr70Tq4Hpl/zeCx
	 jf6ohOfVUtrgTHVTf8qHSGrxMRPqTUIO67yhyWT9pSduo8yWQokEpTLEQt7LnT2M9e
	 sgVzSmYdHGn2Q==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qtR9b-0000Xa-2E;
	Thu, 19 Oct 2023 13:25:28 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath11k: fix htt pktlog locking
Date: Thu, 19 Oct 2023 13:25:21 +0200
Message-ID: <20231019112521.2071-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_042528_136320_2FBCF791 
X-CRM114-Status: UNSURE (   8.21  )
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

The ath11k active pdevs are protected by RCU but the htt pktlog handling
code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
read-side critical section.

Mark the code in question as an RCU read-side critical section to avoid
any potential use-after-free issues.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Cc: stable@vger.kernel.org      # 5.6
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Here's one more...

Johan

 drivers/net/wireless/ath/ath11k/dp_rx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 62bc98852f0f..0acbf53ae991 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1621,14 +1621,18 @@ static void ath11k_htt_pktlog(struct ath11k_base *ab, struct sk_buff *skb)
 	u8 pdev_id;
 
 	pdev_id = FIELD_GET(HTT_T2H_PPDU_STATS_INFO_PDEV_ID, data->hdr);
+
+	rcu_read_lock();
 	ar = ath11k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
 		ath11k_warn(ab, "invalid pdev id %d on htt pktlog\n", pdev_id);
-		return;
+		goto out;
 	}
 
 	trace_ath11k_htt_pktlog(ar, data->payload, hdr->size,
 				ar->ab->pktlog_defs_checksum);
+out:
+	rcu_read_unlock();
 }
 
 static void ath11k_htt_backpressure_event_handler(struct ath11k_base *ab,
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
