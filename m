Return-Path: <SRS0=16SZ=K2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8350FC47080
	for <ath11k@archiver.kernel.org>; Mon, 31 May 2021 15:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9EA61186
	for <ath11k@archiver.kernel.org>; Mon, 31 May 2021 15:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9EA61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yc6p+X/UpGopRgvIlNCJ75tiPM6h7b6yKRzwANInkEE=; b=Ijrz9P3ghJqNBS
	kB0rAJEX5iN0KBb0V2hkE8SXKyF5fjDWsmoOBceXszQfryiNDmdZrlKCR2+9gZbZKTEHrcLFn9HiW
	J9q+twNE5A6lb+tzoAVp+1Ey7/iTbae92mx/zcStNLaxDCLF7I8wEp50sgr8SQBEaMeiVMIx1CtPK
	LGHEOHqcmCEXDw6dELi1IoVbnzpWw7jrjPHzU/pkry5E233+DqgaP78F8cTUvFhnTzLurgEx0owpF
	sT8PvjqEmyZ2VC9ltsw0C2VPNkgcOM0fG9qesbiFM8MDeFjpzkT/r2OrI8C7Hv4wHr5Z8ppQiwYIY
	43y3qRy3VSG6Q9I22nKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnjXf-00ChnT-Ef; Mon, 31 May 2021 15:09:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnjXc-00Chm1-RN
 for ath11k@lists.infradead.org; Mon, 31 May 2021 15:09:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622473760; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=B9FVKugDSt9Fsc2ZBPWVWENKfl+H0G+pO1djroLQj+Y=;
 b=SzXFL3nyAdiUSCiAXgP3zonVOa3cMY+eAxn/VxugNxNRHJt/AHCR6poX/bU035ZQEhOldmun
 7oTAB3RzvM0m6TktyssWw4ylmLCVRlnMgWDpmIqnNKbiSTDbL5bb2q0RGKUwUp67FN0A2z57
 1fTxA2pRebjh2g4CUfotGA+SM08=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60b4fc1c6ddc3305c4ec59f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 15:09:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 535F1C433D3; Mon, 31 May 2021 15:09:15 +0000 (UTC)
Received: from tykki.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A589C4338A;
 Mon, 31 May 2021 15:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A589C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] ath11k: add hw reg support for WCN6855
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210511162214.29475-2-jouni@codeaurora.org>
References: <20210511162214.29475-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, 
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210531150915.535F1C433D3@smtp.codeaurora.org>
Date: Mon, 31 May 2021 15:09:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_080920_983410_A1E4200D 
X-CRM114-Status: UNSURE (   8.24  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Reg address of WCN6855 is different from other devices,
> so add separate reg definition for this target.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This patchset had some warnings from ath11k-check:

drivers/net/wireless/ath/ath11k/pci.c:1229: line length of 93 exceeds 90 columns
drivers/net/wireless/ath/ath11k/pci.c:1248: line length of 93 exceeds 90 columns
drivers/net/wireless/ath/ath11k/hal_rx.c:804: Please don't use multiple blank lines

I fixed them in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210511162214.29475-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
