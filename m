Return-Path: <SRS0=MWox=J2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE561C433ED
	for <ath11k@archiver.kernel.org>; Thu, 29 Apr 2021 11:48:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D79161222
	for <ath11k@archiver.kernel.org>; Thu, 29 Apr 2021 11:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D79161222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N30NnnB/cPfZgeSEGTSqcmkeD5jd6Al3+2b3uLVXqs8=; b=kGb3PakRs2lkvLG7//YJnhXTCc
	WqbrerQ7PAILD6k488CpTNFyHcJcHP38nO9MfJG/8nxJEGxgn3aKthgKtdUowQS0ilPObgMQwOolE
	4B26dsCgyDPrrdGxBfwxcvFDo3yp/91RP+oA3j8qBoDtrnzvz9cxR4wJalQMKUTcxLQQgZrMmWCaJ
	mv/qCrSwvH81vjdSgsW0PtxIA+utbCYnmjdURl9r0tvioSwfkjAtjbEL9iNqBprq4QRyZAbG03EZr
	8/Ka/GlBdEE1qRju3h1GXeOajymPE12eCccIIzvvd3x/beKafAsxAMb+HN+nO86A/70Q6a76wDJKR
	0waQMtGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc59k-005ZdS-7q; Thu, 29 Apr 2021 11:48:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc59j-005ZdB-3L
 for ath11k@desiato.infradead.org; Thu, 29 Apr 2021 11:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tnDMDN6qNXhD1CwrqsYIr3FMBVUHvEv3BXuDsvwxIWI=; b=UjwHPaLh2KK3oOoe52DSaVGvwb
 48kUj4saCOmyB0DwJEQ5VtPAxBdKfMja2+tZC/n1XBoPjXODcKI+cUJ6kPYEInO4UiDEK/yg9S8/N
 2yHaWsCCkmGEsgHC5/1ko4aP3VTyyIh+GH97sL0ocrkCjDHA6O58STjwrGKySd4qjUUSVCaS4b+Pb
 SrZXEE1U8pMmAL2lbCyyOVZ/YQmQBqpAnpEkTjWY8gtchNYigZFHJvyxKFPxsZl8SzNMJMdrwploP
 +A/Vym3c2ecSTQqCzMagFeOaS5za1kIi2pAPGRvvvzF3LVlERT5lYZXp6VGwu6P8DpJPoMEL+keSu
 70CNwMEg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc59f-000bDq-TY
 for ath11k@lists.infradead.org; Thu, 29 Apr 2021 11:48:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619696907; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tnDMDN6qNXhD1CwrqsYIr3FMBVUHvEv3BXuDsvwxIWI=;
 b=uHzoWu+LY5aDwDPKA/lW+ZcBTtPO4H7UcVhhG68hMvcwKhe4JocYZY19VhECUdIdJJ0jMaNs
 xMpu6MyhR6uUxaMTcmvKgFu/IgGhhY4E50hnJv+nlR4NefgNtaeFOdSO24zc2yO8t74LmpBd
 1TXO7RevBYw3Oh4WHcG9u2DHJ/o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 608a9d00a817abd39a60da18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 11:48:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1C7A7C433D3; Thu, 29 Apr 2021 11:48:16 +0000 (UTC)
Received: from ppranees-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: mkenna)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 781B4C433F1;
 Thu, 29 Apr 2021 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 781B4C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=mkenna@codeaurora.org
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
To: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH v2 0/3] Add support to configure beacon tx mode
Date: Thu, 29 Apr 2021 17:17:51 +0530
Message-Id: <1619696874-30072-1-git-send-email-mkenna@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_044828_064454_AB94A4FB 
X-CRM114-Status: UNSURE (   8.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Add support to configure the beacon tx mode as STAGGERED
or BURST mode via hostapd configuration during the AP
bring-up or via wpa_suppplicant configuration during MESH
bring-up.

Beacons can be sent out in burst(continuously in a single shot
one after another) or staggered (equally spread out over beacon
interval) mode.

V2:
	Addressed Johannes's comment on v1 patch.
	Updated the commit log.

Maharaja Kennadyrajan (3):
  nl80211: Add support for beacon tx mode
  mac80211: Add support for beacon tx mode
  ath11k: Add support for beacon tx mode

 drivers/net/wireless/ath/ath11k/mac.c | 10 +++++++---
 include/net/cfg80211.h                |  4 ++++
 include/net/mac80211.h                |  2 ++
 include/uapi/linux/nl80211.h          | 15 +++++++++++++++
 net/mac80211/cfg.c                    |  2 ++
 net/wireless/nl80211.c                |  9 +++++++++
 6 files changed, 39 insertions(+), 3 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
