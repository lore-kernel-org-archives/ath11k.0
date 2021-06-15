Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23BEC48BDF
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4D661246
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4D661246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qk8oO2touq26IhaVDYLsoZCIUhZMgBkRczbko2aVQ+s=; b=usxSviWtPGUWhN
	+Nowy5ffCI7CJ7ry5pXe/mF1DHjgL0uN+kLSIVt1TUV39U/fjSWJ0eIUwySgBVF1nYyUW0EtT4LHs
	+l8fnCLzdVgh9zH7Y9jpVNNT6vaQ2akVXDSUIg0vKzLRZXLOC7xDatPZ27bN5/qSgZL16k2eEdeDj
	eqr9uMGc64Plin4l82ebiKBt+ZMxJKfAEnJtG3NRntrKf3uyYW6oqvwlEcI1ncPm5Kl7vOWWRjcAb
	E7+89xsNo/iT1HurHhUJ5MieBrtqJc825Nwd8xdqHi2da7S3fshvmYMUp451iOifL9rVGCpGINUwV
	tW36NjOwKA4z1nNYg06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHnp-003fVl-TG; Tue, 15 Jun 2021 22:45:02 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGOe-0033xY-U1
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:15:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791698; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XmT7A3ResGYB7ichtKPD9t9Sk6Ipj5FoxP/A1BTFSbk=;
 b=AKPd21Tq9Yv0+m0k7/hPN7u4+obARy+ihv27KMIsjxgkNnRFbr9cDKFV8BgR0WT8A2mmzIZS
 EEeyS8k+2vhiDcnqF5YiBLnzUrMB25jw8tU1RJ578YxclmTCRAvmwXd1CSQ8XutdrzJyy8vo
 8KPbcT3b7WG3voLrjPlAxt7ZPAU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60c9184e2eaeb98b5e0f099d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:14:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6EF9FC4323A; Tue, 15 Jun 2021 21:14:54 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4642CC43145;
 Tue, 15 Jun 2021 21:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4642CC43145
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 10/12] ath11k: avoid while loop in ring selection of tx
 completion interrupt
Date: Wed, 16 Jun 2021 00:14:05 +0300
Message-Id: <20210615211407.92233-11-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615211407.92233-1-jouni@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141459_100062_29244B19 
X-CRM114-Status: GOOD (  13.33  )
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

From: P Praneesh <ppranees@codeaurora.org>

Currently while loop is used to find the tx completion ring number and
it is not required since the tx ring mask and the group id can be combined
to directly fetch the ring number. Hence remove the while loop
and directly get the ring number from tx mask and group id.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1 v2

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index 1fef71c8edaf..a63a6fa24f9d 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -767,13 +767,12 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 	struct napi_struct *napi = &irq_grp->napi;
 	int grp_id = irq_grp->grp_id;
 	int work_done = 0;
-	int i = 0, j;
+	int i, j;
 	int tot_work_done = 0;
 
-	while (ab->hw_params.ring_mask->tx[grp_id] >> i) {
-		if (ab->hw_params.ring_mask->tx[grp_id] & BIT(i))
-			ath11k_dp_tx_completion_handler(ab, i);
-		i++;
+	if (ab->hw_params.ring_mask->tx[grp_id]) {
+		i = __fls(ab->hw_params.ring_mask->tx[grp_id]);
+		ath11k_dp_tx_completion_handler(ab, i);
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
