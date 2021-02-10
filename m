Return-Path: <SRS0=WqG4=HM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E19C433DB
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:26:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2347660231
	for <ath11k@archiver.kernel.org>; Wed, 10 Feb 2021 08:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2347660231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0EFYY9oSRkY45Y+lynajAFgOSL+ZfjlmxJ2T5vsHhQI=; b=cOZmXNV6/sAufsxXibjIyzfi0
	MNGnQ2VBkWuL+D2Mq/BsaxWiCX5Dwe3BbsYwAdxd7vU+10QkJNu7KQTpF0I+Hxw70iZtPLxIKDeLg
	SERor8gAgPgabg34b/wWgbNtdV/q9nv5c2o7EEfRo/rrpaap5vVvO/2iFvJOb9BrgNcVzI8RAnpxa
	PNeKjyPgC/Xw6R9JAgT+YMXhM5oa5UUVxjn8rTLF83w1MUpLDFh/vHlOEscNUK4USlrQgzYbZe+xw
	laBqgGWEbWhFrinWYu2GXh4JG53OHkQqUWs35Lfh9Zcn+G4jucgMAgibTnenOVkIgSu+K2+6v5Xm9
	H5l2CKZzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9koz-00056O-Mx; Wed, 10 Feb 2021 08:26:01 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9kox-000554-0j
 for ath11k@lists.infradead.org; Wed, 10 Feb 2021 08:26:00 +0000
Received: by mail-pj1-x102d.google.com with SMTP id my11so2600325pjb.1
 for <ath11k@lists.infradead.org>; Wed, 10 Feb 2021 00:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1bP8tntg9pA9yGxdgncjvitmKPqyFRS1o/Fqe5r2Ps=;
 b=irzmiVZ4wsEOeiwpQwsrht1OIb9g5AKBV+N1HM9YcKJf95u9lyJqdetLbOTkFDPznA
 pt3dJRYpn77GMxLX5KfzWm9UcxtdOpKl3BY0APSVniGsRPb/cYMyomC9kk6IHQtN1IBe
 62WQsgGlydXrwhNxQYWvaT2qJ1QllCXUrUSq4gYfQ0JPshAX0wHZnm7yEsHOVf5Bhx6C
 ocs1C4cbTJGsZjvnLIeZA4RU8Rb8Uo/ikTUr1XUqBe5Hr/+agFQroAithue/yMzdxBJs
 YRrTiJ2hM9zbxq/mcy+wGmFd51sh0CYkQJWdD4wpILQsBuQ7QWb4Cg+v/5rrUlxeOT7U
 MVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O1bP8tntg9pA9yGxdgncjvitmKPqyFRS1o/Fqe5r2Ps=;
 b=J5FDfdfnkHTshoWVwRdBSIxJJurJtYc+W6xm5tOZTDaob+LsxgvEy2A6I9ktZsrQld
 ITS1Q2t/+2wLW6Dn/YvkuzeI47ium0ly4vGxaxWm9QvpJKCHIVA4yuWoj9WvD2QoMjeB
 lkr2wPxhJGb5pAjIgLBJucKUQJBdFG/UCJU8ezlvaSS6TxMcHgmcqbOofQbXfOAiRZQc
 k+IzbORMMJHa+AUMXG6bV2DIcJ/dNmD9QELBgLPpx/poS6nMYAswMB2wwpsg6ZmsLZfI
 YcOYtbUcHNzex9fnnztQ26SUtFyhL6QhYFzeP1ZRNKRSciXQSNXA+7yh/ye3g8Zn1/0W
 rQOA==
X-Gm-Message-State: AOAM5306FOKvybOdJPEO639Kj7gRm8U6CTf+nNrlmRfM4n6rFWQtCNrN
 wMRFG7UPo9r6v/yLWy6tYJRA
X-Google-Smtp-Source: ABdhPJy6tqTNSlx2DOfv6fYexq28jWCpsUkSSEJgihZIaNnqN6sYV+awW/kjax6hCq7LNSo2A8zgCQ==
X-Received: by 2002:a17:90a:a585:: with SMTP id
 b5mr2093367pjq.110.1612945557053; 
 Wed, 10 Feb 2021 00:25:57 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.29])
 by smtp.gmail.com with ESMTPSA id r68sm1402963pfc.49.2021.02.10.00.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:25:56 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 1/1] mhi: Fix double dma free
Date: Wed, 10 Feb 2021 13:55:38 +0530
Message-Id: <20210210082538.2494-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
References: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_032559_102663_0729A241 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: loic.poulain@linaro.org, jhugo@codeaurora.org,
 linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
 linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Loic Poulain <loic.poulain@linaro.org>

mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
resources, including unmapping coherent MHI areas, can be called
from different path in case of controller unregistering/removal:
 - From a client driver remove callback, via mhi_unprepare_channel
 - From mhi_driver_remove that unitialize all channels

mhi_driver_remove()
|-> driver->remove()
|    |-> mhi_unprepare_channel()
|        |-> mhi_deinit_chan_ctxt()
|...
|-> mhi_deinit_chan_ctxt()

This leads to double dma freeing...

Fix that by preventing deinit for already uninitialized channel.

Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver remove")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: Kalle Valo <kvalo@codeaurora.org>
Tested-by: Kalle Valo <kvalo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1612894264-15956-1-git-send-email-loic.poulain@linaro.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index aa575d3fb3ae..be4eebb0971b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -557,6 +557,9 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	tre_ring = &mhi_chan->tre_ring;
 	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
 
+	if (!chan_ctxt->rbase) /* Already uninitialized */
+		return;
+
 	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
 			  tre_ring->pre_aligned, tre_ring->dma_handle);
 	vfree(buf_ring->base);
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
