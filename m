Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D247C001E0
	for <ath11k@archiver.kernel.org>; Wed,  9 Aug 2023 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p21Xk9eIEMEpZ8SGd83I8FtRjbUXIwUcBXI+htp01BM=; b=yNF0mqwG5D0hY9
	+KV0hpoCscZ9VlbrvfAGoRaSWRvGkOVHkkvOfAXjAlnkZyoZCLGEf/GnnI8xKQtU2Rk5rWd5QuKck
	HjAtvn4levzncv2hTXIaXEpeVDHpstvpLyUpMOuxrXDvmn0W7wjv8nWSfPoIjsbjkagIsUa5shrX1
	2OLf6Dk4BTaWIAtw++C50kLBA7XCleu2wkDYznPmbcWBTal8EGUwic1nJRfERipyf/PiRm97xSq50
	G2pB+dMdu6UK7rk6rvcx+svcZ2TNxjlCuItSASyjlxVGbJSKJ0c5nzTrLG1Ys7b0P4XROUK5L3Da5
	xWyzlJfangCKdnNuKH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdia-004H7s-1X;
	Wed, 09 Aug 2023 07:34:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTdiX-004H6m-1B
	for ath11k@lists.infradead.org;
	Wed, 09 Aug 2023 07:34:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9DCB62FC2;
	Wed,  9 Aug 2023 07:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A0FC433C7;
	Wed,  9 Aug 2023 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691566491;
	bh=60Y6J4I0j3xXL5Nco312J593o+/GGtthikOgUobZJYo=;
	h=From:To:Cc:Subject:Date:From;
	b=KLYbVGAPMTOE6TBQhJigf7VgNNYfcES5L5qJFBKGt1lX4B7ZhbYwkwLo2SVmkKUlx
	 jLl4q13qQfGDIX1SSZwBVsqxJc37jScOg/DEQEqi8jus0qQ1rn2aAQrhB9XYMWaYG5
	 ZWaScln3FVt0MBewvBUzRQGa0MXJ1u13QtJCL33XV2CAqaVCSVUKzz9dKAyBtpy+0B
	 1+lJCA0TmNshW026Cs1LL23QCTwDn/nAsHmDaVMIcDNtoi2BXG4FBp0fLHMHbS+/nG
	 tPJTtOzmnErHWYsC7yCsAUxdnkIwyvJDCq2tPtgG4aEsyoNevVUF5LDSiR3NO78poY
	 ry76Tm+3uD1Xw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qTdiS-00016I-1p;
	Wed, 09 Aug 2023 09:34:48 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Date: Wed,  9 Aug 2023 09:34:32 +0200
Message-ID: <20230809073432.4193-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_003453_501319_8C7E3F96 
X-CRM114-Status: GOOD (  11.99  )
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

This reverts commit d265ebe41c911314bd273c218a37088835959fa1.

Disabling threaded NAPI causes the Lenovo ThinkPad X13s to hang (e.g. no
more interrupts received) almost immediately during RX.

Apparently something broke since commit 13aa2fb692d3 ("wifi: ath11k:
Enable threaded NAPI") so that a simple revert is no longer possible.

As commit d265ebe41c91 ("Revert "wifi: ath11k: Enable threaded NAPI"")
does not address the underlying issue reported with QCN9074, it seems we
need to reenable threaded NAPI before fixing both bugs properly.

Fixes: d265ebe41c91 ("Revert "wifi: ath11k: Enable threaded NAPI"")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Hi Kalle,

Disabling threaded NAPI caused a severe regression in 6.5-rc5 by making
the X13s completely unusable (e.g. no keyboard input, I've seen an RCU
splat once).

I'm supposed to be on holiday this week, but thanks to the rain I gave
rc5 a try and ran into this.

I've added Bjorn, Mani and Konrad on CC who may be able to help with
debugging this further if needed while I'm out-of-office.

Johan


 drivers/net/wireless/ath/ath11k/ahb.c  | 1 +
 drivers/net/wireless/ath/ath11k/pcic.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 139da578831a..1cebba7889d7 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -376,6 +376,7 @@ static void ath11k_ahb_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
+			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath11k/pcic.c b/drivers/net/wireless/ath/ath11k/pcic.c
index c63083633b37..c899616fbee4 100644
--- a/drivers/net/wireless/ath/ath11k/pcic.c
+++ b/drivers/net/wireless/ath/ath11k/pcic.c
@@ -466,6 +466,7 @@ void ath11k_pcic_ext_irq_enable(struct ath11k_base *ab)
 		struct ath11k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
 		if (!irq_grp->napi_enabled) {
+			dev_set_threaded(&irq_grp->napi_ndev, true);
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
-- 
2.41.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
