Return-Path: <SRS0=pDp8=KG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA4DC433B4
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:39:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAF756190A
	for <ath11k@archiver.kernel.org>; Tue, 11 May 2021 16:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAF756190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bea9zFPcoxDN6e5lRhnNoXTDmCOKMd/16JrrVMn2CUY=; b=JMrCPiQUk85CvhvqSZVCICk4cD
	bL5OlTOPq6qc4M7cvpkLDEZJG8t0Jgdjmk28UNo7yOhVR5AvaPHmUtb7SE0SPNrbisYRhukvmp6AT
	vrZTRznWrC8IgRcZJvL60gu3ZYOmcwnifszoUffYg0TH3EoRlXrTL77Jy4YjkPXHW3/1BjgOSehTd
	569lDeWIzO5SXVRNAhDFJGdjxpa1kz5JAXAvVlgLSvVsh+PrSTrlYKclqhsjpOWPJM/wMB1DXM3X+
	mRR0/QoOsXMICkOz87tcRloIFJcsNL7xR+Qy9N3r5Xn9XDicrzgMlAWJ33KTowlKZvPuj+sAQgQ6g
	8/IX1w8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVQF-000mME-Ub; Tue, 11 May 2021 16:39:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgV9u-000inQ-3Q
 for ath11k@desiato.infradead.org; Tue, 11 May 2021 16:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pvdXb0Z9rl4Ey2Nv8OCmHtrir+Q7GYlwpCW7ZGD2TtU=; b=TukEUBrIhSbUYNUeLeqzxFxe86
 G4BmoyaTYxVeLu33fOPvqR6kO7BzG12Rch0s1owR/Uyz70kHzQtd6oZTIL6FnY3Ld9M+Fdme3hLJt
 InblDSmN5wm3ZxbSCXd7li+sX9fcBoYQTTstPeOHzdErJiMyoTDcU1SJQ1AqmZ2kXIyxni9PDaFji
 a3PpZFH4lz7aZCarpoHCZ6CVb54Gj7gtSVEt+f8vEeCME51JD0SoTyknIx+rShyhvyTG5SS3PVB4F
 gwfS3TqWsVRFHDQxn6l1wNINqhy8W96Sq0vGt3sDEF3Dn/rLWQ54KN5HSWTOdBuByMW2CGWM3bYuj
 o43Z4AYQ==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgV9q-009l6R-Ff
 for ath11k@lists.infradead.org; Tue, 11 May 2021 16:22:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620750174; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=pvdXb0Z9rl4Ey2Nv8OCmHtrir+Q7GYlwpCW7ZGD2TtU=;
 b=njgVZ/Vk4Kyz6LKKYRGTlIO/A+T5a+EYtiB9bjVtzciwcyxmulp2gPtxMiOsx/GWlmWH43zr
 v4OeLzKis+D2UWgrUMvrsYgsR4OUdZAVHdAxqJNZRgkEoZEizbktzy73bKV2sdBn8t0PmOX2
 seqgnGTa32NzQNcnrKNa0PZiwdg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 609aaf5aff1bb9beec1889d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 May 2021 16:22:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 407EEC43143; Tue, 11 May 2021 16:22:50 +0000 (UTC)
Received: from jouni.codeaurora.org (85-76-96-12-nat.elisa-mobile.fi
 [85.76.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jouni)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FCDCC4338A;
 Tue, 11 May 2021 16:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FCDCC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jouni@codeaurora.org
From: Jouni Malinen <jouni@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Jouni Malinen <jouni@codeaurora.org>
Subject: [PATCH 0/7] ath11k: add support for WCN6855
Date: Tue, 11 May 2021 19:22:07 +0300
Message-Id: <20210511162214.29475-1-jouni@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_092254_608412_0D50CEE3 
X-CRM114-Status: GOOD (  11.64  )
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

This patchset adds supports for WCN6855. WCN6855 is a PCI based
DBS device. It is very similar to QCA6390 overall but with below
differences:
 -WCN6855 has different registers, so new regs are
  defined and attached in hw params.
 -WCN6855 has different rx descriptor, so new descriptors
  are created and in addition, new hw ops are added.
 -REO configuration is also different for this target, so
  separate reo handling is added in hw ops.
 -WCN6855 does not have clock drift problem which is found
  on QCA6390, thus no need to configure some related registers.

Baochen Qiang (7):
  ath11k: add hw reg support for WCN6855
  ath11k: add dp support for WCN6855
  ath11k: setup REO for WCN6855
  ath11k: setup WBM_IDLE_LINK ring once again
  ath11k: add support to get peer id for WCN6855
  ath11k: add support for WCN6855
  ath11k: don't call ath11k_pci_set_l1ss for WCN6855

 drivers/net/wireless/ath/ath11k/core.c    |  44 +++
 drivers/net/wireless/ath/ath11k/core.h    |   1 +
 drivers/net/wireless/ath/ath11k/dp.c      |  16 +-
 drivers/net/wireless/ath/ath11k/hal.c     |  10 +
 drivers/net/wireless/ath/ath11k/hal.h     |   3 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c  |  41 +--
 drivers/net/wireless/ath/ath11k/hal_rx.h  |   8 +
 drivers/net/wireless/ath/ath11k/hw.c      | 391 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h      |   5 +
 drivers/net/wireless/ath/ath11k/mhi.c     |   1 +
 drivers/net/wireless/ath/ath11k/pci.c     |  45 ++-
 drivers/net/wireless/ath/ath11k/rx_desc.h |  87 +++++
 12 files changed, 586 insertions(+), 66 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
