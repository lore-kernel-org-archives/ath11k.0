Return-Path: <SRS0=Y6aC=HN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA78BC433E0
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 11:06:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE4064DE0
	for <ath11k@archiver.kernel.org>; Thu, 11 Feb 2021 11:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE4064DE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ht40ZvrqN4PshegrCsFmF7gzrDi7RFdyE7R1sAq7q8E=; b=xZn0lFWanTlzCmYJISiLYV40UR
	pP/MZ7QTlXqJ9uBfzcQ6hEiu8iJTbkRxyi6iu548w18REFcD1M4T/soH2mIxYMT7IvfQA9EfQl3Pf
	LFeNMaDEI37SwwxAhaTl5cR4dl6gwIAjEVS9aarNLY9i+ciO8SjjFn7H+ggPAsF5gFDna8iq9AVuV
	erDdwYdMMGJRoPrH66bpb0UoFHZDKLhMXoPrQhMj1o1/gW6ZTnL1UoqoFFvcraEED4qtphb3trmy3
	I1O2SMRbLj7Ww+oybWz9moTDACAzPO2+yVy6MLtS21KqBP5WdIXs/ft3RUyOnJcbvE+LsEt5FXa2v
	Guykvpjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA9nQ-0003m2-I1; Thu, 11 Feb 2021 11:06:04 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA9nN-0003kw-5w
 for ath11k@lists.infradead.org; Thu, 11 Feb 2021 11:06:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613041562; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZHyTXzCP1diOgxg//VtXpZpz0SVVM0kV8s3ghwkJp3A=;
 b=R8FkBgG4VBF46qwVe5Od16v6I4PUY153jZSonbw/iPFJefnkrLCSN0E00HgtHMKNrOfPE5tF
 +USyOELYhr3EVD3HsW84m9/BP++CjVW9diKJnK2hXxhSx4nAm9tk5VkOJc/v3EoJ08mekjRx
 +aosZZq1Kkt6+KRYHOJJhTy3yK8=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60250f938e43a988b763b7d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 11:05:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E9869C43461; Thu, 11 Feb 2021 11:05:54 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 982B6C433C6;
 Thu, 11 Feb 2021 11:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 982B6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: ath11k@lists.infradead.org
Subject: [PATCH] ath11k: qmi: add debug message for allocated memory segment
 addresses and sizes
Date: Thu, 11 Feb 2021 13:05:49 +0200
Message-Id: <1613041549-7265-1-git-send-email-kvalo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_060602_555117_2279F82E 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: linux-wireless@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

This helps debugging firmware memory allocation problems.

Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 0db623ff4bb9..1aca841cd147 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1686,6 +1686,11 @@ static int ath11k_qmi_respond_fw_mem_request(struct ath11k_base *ab)
 			req->mem_seg[i].addr = ab->qmi.target_mem[i].paddr;
 			req->mem_seg[i].size = ab->qmi.target_mem[i].size;
 			req->mem_seg[i].type = ab->qmi.target_mem[i].type;
+			ath11k_dbg(ab, ATH11K_DBG_QMI,
+				   "qmi req mem_seg[%d] 0x%llx %u %u\n", i,
+				    ab->qmi.target_mem[i].paddr,
+				    ab->qmi.target_mem[i].size,
+				    ab->qmi.target_mem[i].type);
 		}
 	}
 
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
