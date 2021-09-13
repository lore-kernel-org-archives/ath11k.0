Return-Path: <SRS0=KMo3=OD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEF7C433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B64BC60F3A
	for <ath11k@archiver.kernel.org>; Mon, 13 Sep 2021 18:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B64BC60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T243XqfajT/7K0VusnWTt6OZOQVTbBjUYCIU8/nb2/c=; b=ZoLXw8yEbYneOA
	LcZXkUEqEqf3Jwq3fq2fim8QCOlTssG0nTHIV08JSXIYywFOiDZ+QnRHxaof1QLQ0oN58OkdTGuna
	ZxWdbjsl37joMW5BncNF9Nm0zFsg8EAmZMg9oLdf+YnYaNZ0f0i7tTJh2DjfMgWqT0LeV7eUjqX+N
	miPpq8umqZ22ZBb75EEkZmBcaUNMzwTBCX65TrjkiRFCMtTjuhuxct9X6EYPaEmy090dtFTmMUhw5
	h3GZuW0Ab+aFSrIoeGvN25VaBQ9xTjAVdlfw6HEexppfHYrGlLz3roJDK7tLFVkX/GoxQZPWjdNtv
	rh/ooH/zPpOWFzCI4v7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPqIi-002t5f-TY; Mon, 13 Sep 2021 18:03:28 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPqId-002t16-Go
 for ath11k@lists.infradead.org; Mon, 13 Sep 2021 18:03:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631556206; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jEMSuFaCPIz2sIyxxf6/q0IS1wXTlyiBIamegErQAXk=;
 b=NYPZPi4rJOy1Tg+4q98oM2FZ/rFJwJduP8vdFwqDmd9zfVvw0MGgm8yacsRdJmqGstHiznb+
 h/rVd/ha0By5TdGgLicnizPODW1TxG1esoJrtS+yV79nVJMzN12MSmrjp/gmPlGClRuVmgqJ
 dYF93c4RW38wUwkIrSL5PSyZzpM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 613f9259b585cc7d240f84a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Sep 2021 18:03:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5E152C4360C; Mon, 13 Sep 2021 18:03:05 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-72-211-nat.elisa-mobile.fi
 [85.76.72.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AA84BC43616;
 Mon, 13 Sep 2021 18:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AA84BC43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 4/5] ath11k: Fix memory leak in ath11k_qmi_driver_event_work
Date: Mon, 13 Sep 2021 21:02:45 +0300
Message-Id: <20210913180246.193388-4-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913180246.193388-1-jouni@codeaurora.org>
References: <20210913180246.193388-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_110326_344381_0ADB5D98 
X-CRM114-Status: GOOD (  13.76  )
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

From: Baochen Qiang <bqiang@codeaurora.org>

The buffer pointed to by event is not freed in case
ATH11K_FLAG_UNREGISTERING bit is set, resulting in
memory leak, so fix it.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 7e82d03b0d87..0175e35849bf 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -2753,8 +2753,10 @@ static void ath11k_qmi_driver_event_work(struct work_struct *work)
 		list_del(&event->list);
 		spin_unlock(&qmi->event_lock);
 
-		if (test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags))
+		if (test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)) {
+			kfree(event);
 			return;
+		}
 
 		switch (event->type) {
 		case ATH11K_QMI_EVENT_SERVER_ARRIVE:
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
