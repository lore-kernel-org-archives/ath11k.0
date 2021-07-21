Return-Path: <SRS0=H079=MN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA48C6377A
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6772E60FF4
	for <ath11k@archiver.kernel.org>; Wed, 21 Jul 2021 20:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6772E60FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ic/Ja4FjwJ2WrRh45A2wlB9/V1uYZ93f2vVqLzdDpbM=; b=gbC0zU63UPNtTg
	+gn7ds3lSYXRbH9H8AdMu9J7z/m4RvQ1b79cr6IlpOU3pvscEDvlu3Adw1+YifznBXhqjMYrp/yH8
	cDJJhqUhS1g05oDiW7criIbBiVs2i+6FPzyAlgrpnbvk5Gk9Q1737MBTC5zsJ9DzmPXR3g4erCdQQ
	Z8O6BQuz2rZL/lLP3yO83jyMumWQ5tmH7PyLIz2SpPE6CF7kKjbYwTWhKBWBigxMzID/dSv7UYxFR
	wr7qkrZHigLE//nQgQVdpTJOOdLowX+VDxG5XsL7kqEOOpPBubhSDsflut2dH6CsmDdHX3hJLm12H
	u31ZSFH/6KsGPHj173FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6IhE-00H6Gh-AA; Wed, 21 Jul 2021 20:20:00 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6IhA-00H6Fp-Qc
 for ath11k@lists.infradead.org; Wed, 21 Jul 2021 20:19:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626898796; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=xEjx6vNY4DZDrWYKr0YXN0qNDte/uAq7gYFF9drHb64=;
 b=rvs6udNz7wve/N3OS9Sz0GiNKqojvs4yJBT11CUeSedf8eLdKvOCSmetF3SLXeDdeLs3qWNT
 XDRNHv5XnH5pRZNKml1OaNg21kkPrUYnBQ/h/4EKWE62Q0YoixVev+E2UqZ/uRaS1Hg2LdKf
 KoEPdW+1+IajpoazAWkELt2bQLc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60f8816bb653fbdadd565478 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 20:19:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 46033C43217; Wed, 21 Jul 2021 20:19:54 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-67-217-nat.elisa-mobile.fi
 [85.76.67.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E7F3C433F1;
 Wed, 21 Jul 2021 20:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E7F3C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: [PATCH 0/4] ath11k: Add caldata download support from file/EEPROM
Date: Wed, 21 Jul 2021 23:19:23 +0300
Message-Id: <20210721201927.100369-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_131957_082502_4BEEED5A 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Anilkumar Kolli <akolli@codeaurora.org>

Clean up BDF download functions to add caldata load support from EEPROM. 
Remove unnecessary macros. 
Write common function to send QMI BDF download request.
Allow caldata file load support for multiple PCI devices.

Anilkumar Kolli (4):
  ath11k: use hw_params to access board_size and cal_offset
  ath11k: clean up BDF download functions
  ath11k: add caldata file for multiple radios
  ath11k: add caldata download support from EEPROM

 drivers/net/wireless/ath/ath11k/core.c |  10 +-
 drivers/net/wireless/ath/ath11k/hw.h   |   2 +-
 drivers/net/wireless/ath/ath11k/qmi.c  | 330 +++++++++++++++++++--------------
 drivers/net/wireless/ath/ath11k/qmi.h  |  18 +-
 4 files changed, 207 insertions(+), 153 deletions(-)

-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
