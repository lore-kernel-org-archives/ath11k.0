Return-Path: <SRS0=wUnC=LJ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A205C48BE5
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4BC60FE4
	for <ath11k@archiver.kernel.org>; Tue, 15 Jun 2021 22:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B4BC60FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iciAL3jL+JH5LctU6knyZMcWMbau2XZf8pFEMM2qnYo=; b=a/n3u1BwQvfIvd
	zIF1UEg/s7IOVXhe+S69ACfocR9ybdg7jF5zysMB2+YFJetHWKjddlgPOkT4RoQM8yIP3GnI+/eg+
	ssBYDFRdevG7zXXHyWPpQ8+dBA6oZpkISwSeuqgb8uYe61Z7xApDrm4Dxzl52mcYxY09Ox6KW3RDH
	iTGcT81f8XH4bljWAYqPTp1Iqd5rBtZzYevOwqDt0JlhZTaa1EJz0iYbhvEDyS2BXtU3G9/HkF/D6
	K4OpNIVzHPbg+ffOuMlL8szHpgEvGs1y8PbraRopz8LB24YJmL/XpFHTCXfiEQ7hZ9P2nfIsXq4az
	oQc5CEXTFabssB3ch5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltHnZ-003fHT-4L; Tue, 15 Jun 2021 22:44:45 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGOL-0033qk-N8
 for ath11k@lists.infradead.org; Tue, 15 Jun 2021 21:14:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623791677; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vdwvR5rnGJ6D8aCJjKEH3CzQd36qt64o5iCHJ2mXe/o=;
 b=ww6dA6k2h5FGNhm8Bp62g0TLm2xCxju2oZZSTGtSI6XbYMHOOAHtPw8ac5yBblCjKzF5eOVJ
 0q8jMjRUmBZKapFkHr+mCkwd3wqpmly/oxjsAF7BggnCygzg4IoPZHmwkcPYS5s+8JTRnzcF
 WjxkSW3cq8+N2lCS520w0F+56pU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60c9183d8491191eb3e25ee5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 21:14:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2CFCAC4338A; Tue, 15 Jun 2021 21:14:37 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-78-13-nat.elisa-mobile.fi
 [85.76.78.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B6EFC43460;
 Tue, 15 Jun 2021 21:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B6EFC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 P Praneesh <ppranees@codeaurora.org>, Sriram R <srirrama@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 04/12] ath11k: avoid additional access to
 ath11k_hal_srng_dst_num_free
Date: Wed, 16 Jun 2021 00:13:59 +0300
Message-Id: <20210615211407.92233-5-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615211407.92233-1-jouni@codeaurora.org>
References: <20210615211407.92233-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_141437_874328_8ECA32C1 
X-CRM114-Status: GOOD (  12.98  )
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

In ath11k_dp_process_rx(), after processing rx_desc from
ath11k_hal_srng_dst_get_next_entry(), ath11k_hal_srng_dst_num_free()
is accessed everytime because of done flag is not set.

To avoid this additional access to ath11k_hal_srng_dst_num_free(),
increment total_msdu_reaped only when continuation is not set and
update done flag correspondingly.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Co-developed-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: Sriram R <srirrama@codeaurora.org>
Signed-off-by: P Praneesh <ppranees@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 32c348812769..54ab69959c98 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2628,7 +2628,6 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 				 DMA_FROM_DEVICE);
 
 		num_buffs_reaped[mac_id]++;
-		total_msdu_reaped++;
 
 		push_reason = FIELD_GET(HAL_REO_DEST_RING_INFO0_PUSH_REASON,
 					desc.info0);
@@ -2651,10 +2650,15 @@ int ath11k_dp_process_rx(struct ath11k_base *ab, int ring_id,
 
 		__skb_queue_tail(&msdu_list, msdu);
 
-		if (total_msdu_reaped >= quota && !rxcb->is_continuation) {
+		if (rxcb->is_continuation) {
+			done = false;
+		} else {
+			total_msdu_reaped++;
 			done = true;
-			break;
 		}
+
+		if (total_msdu_reaped >= budget)
+			break;
 	}
 
 	/* Hw might have updated the head pointer after we cached it.
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
