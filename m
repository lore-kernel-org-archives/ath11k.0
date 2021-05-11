Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0E3C433B4
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A13506190A
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A13506190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBqU7LyJX70Zn0SA87z4ncnSzGAG3u/zf1nBcu0WZmw=; b=gDy1TtOcvgi3R2oij/IhYWjPz
	UoN+xu/4LDuO2NoOCzxjYxij0VrvQ0uXEbZun9iXiXZnvmjua0Wx8RgxaHoaWJWQHKxL3b58lIf2B
	t2Dk1iMOvGOzJIuTsZXRRTwk3XdDO9pTigSbPDpzH7pQeJQtC5k7/7KKv8uW6QhRGaLjb5cc/QTAn
	ldBhikGDUcjp0U1KQEZKMKYEyPNxVBm5q67JgszeW8ZUkNfrCGbdtMbJZMXindzSWaAvw7pkSt+cg
	gGv9+Y2auIq00Q+g/BchKW8O7bkhcn/hp5tj3cDImAsReGY3o+coZNZvXAfqakJQxtyIttPfGHQxH
	HUbot6ugA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQQ-000mPJ-NY; Tue, 11 May 2021 16:40:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVA4-000ipE-Fh
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vtyuWCUgaC24+ysgVPL7pIxIwB7fT6eCYf1JfxEDu3k=; b=4S/PeDQI0nrWKZCXYgc5KFJP3c
 yZT9430346PSsI02yLTN/qCzvMTiM0XZERilbsEV/S49e1QTvoe0vN29m05htAqH5Y4Ilf0s771gz
 7q4Dl0hupixPWjAsHQLXIlY3pB2RKqTwxPwS5kMk//rt7m9JxXtI7m/5/pXW3P/7bnBNIsOSs2Uxg
 TlMLv1tBuWksdTf/LtAmCT0XT7pR32Q6d6E+wieDSo+hnZPA0wIM/CQauYKsrRk6fNr1C0Xafd+nA
 MxQnoeIjQUT/IUsQVahAhIRjHPbz+v3ZitoLukzitWZ3AsOknx/5pcdmVam7083T65VfTsArbgHHM
 qVFIwNRg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVA0-009l6R-J7
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:23:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750185; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vtyuWCUgaC24+ysgVPL7pIxIwB7fT6eCYf1JfxEDu3k=;
 b=kfeg+rOD/xAXJLRzcswdI2BANboaNb6ZjjrJsxtn4Tdkr4Dwb5fJRpYlfa9T6lavlm0JPtu6
 apWLg+u5h+sryMSHLZ2k9el79i6V6l9dTpLKfTEI5zBRhBMXoZ5Jz+sciCWXyAlFdYuQ0ZKW
 c0YfZ76b140JRWtVLE71ehAFBSw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 609aaf66e0211609c47d9a1f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:23:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8E28AC4338A; Tue, 11 May 2021 16:23:02 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CF69C43143;
 Tue, 11 May 2021 16:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9CF69C43143
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 4/7] ath11k: setup WBM_IDLE_LINK ring once again
Date: Tue, 11 May 2021 19:22:11 +0300
Message-Id: <20210511162214.29475-5-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511162214.29475-1-jouni@codeaurora.org>
References: <20210511162214.29475-1-jouni@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092305_830175_535907ED 
X-CRM114-Status: GOOD (  11.93  )
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

For WCN6855, WBM idle link ring needs a reinit.
Without this reinit, firmware crash might happen occasionally.
This is requested by the hw team.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/hal.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 08e3c72d9237..eaa0edca5576 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -382,6 +382,16 @@ static void ath11k_hal_srng_src_hw_init(struct ath11k_base *ab,
 	val = FIELD_PREP(HAL_REO1_RING_ID_ENTRY_SIZE, srng->entry_size);
 	ath11k_hif_write32(ab, reg_base + HAL_TCL1_RING_ID_OFFSET(ab), val);
 
+	if (srng->ring_id == HAL_SRNG_RING_ID_WBM_IDLE_LINK) {
+		ath11k_hif_write32(ab, reg_base, (u32)srng->ring_base_paddr);
+		val = FIELD_PREP(HAL_TCL1_RING_BASE_MSB_RING_BASE_ADDR_MSB,
+				 ((u64)srng->ring_base_paddr >>
+				 HAL_ADDR_MSB_REG_SHIFT)) |
+			FIELD_PREP(HAL_TCL1_RING_BASE_MSB_RING_SIZE,
+				   (srng->entry_size * srng->num_entries));
+		ath11k_hif_write32(ab, reg_base + HAL_TCL1_RING_BASE_MSB_OFFSET(ab), val);
+	}
+
 	/* interrupt setup */
 	/* NOTE: IPQ8074 v2 requires the interrupt timer threshold in the
 	 * unit of 8 usecs instead of 1 usec (as required by v1).
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
