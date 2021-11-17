Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F211C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A7961B54
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18A7961B54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcIzUQjpqj38ZL+F0bg4AMa4tVyIRbH4qo+DBWz1Za8=; b=A1/cg+ZKewf01T
	vV9h+BLstByyODsa7zmC1gPnmVWQc/XIXm0uOaK7nPoWkbxMmSpkeJuPlC2AhuneWcKRSJVIsyx1j
	WmAWvdm427AnzLmgUgfXv70oNjcU33WVkNN4Aw8ON35QsxlaNfILJMF/4cHrmMFP/iM6bA0Hc+peF
	PMOWQacUABGjSkNKDjjqJ0aPLGzow4hzGBP2zZqi2MR6DLMTo+0nCzMYwHIJj2CZizYml9MWO2CqX
	li0BKescNPwjCH5wrphbVCgHn7D8kdaQQq+sQg2YykfdjYUpqPp+mErxjGjOytuFKpmguuaCdTSoy
	4FLvnLr+dpKuAFYi62yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFQb-003oda-59; Wed, 17 Nov 2021 07:32:21 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFQX-003nw8-Uj
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:32:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134337; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=P+xmMnDeuVV3fcpmiQ/qL5HdNAPrSn0rNUls7jb9utY=;
 b=t+zDoAFOBuNFUBhAiU66xpmV3TXRSvfqmDoLwPtodD1LClyIi0IfsoqFPUpY3uopLu/CHo1M
 UEkJJPm3jz6OXBn4vrud9rygripv0d5htWGgE6YMKlNGAwRv8fINGsWlhPBzhF61dWvUOWZl
 +qavPd0M5g6Np0PLrzRXlf5766w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6194b001638a2f4d6119367f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:32:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E98D1C4360D; Wed, 17 Nov 2021 07:32:16 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 47C2CC4338F;
 Wed, 17 Nov 2021 07:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 47C2CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add support for BSS color change
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635178254-17732-1-git-send-email-quic_ramess@quicinc.com>
References: <1635178254-17732-1-git-send-email-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713433344.31320.15507831510169875119.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:32:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_233218_072849_F3AF8E66 
X-CRM114-Status: GOOD (  12.10  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> wrote:

> Whenever the MAC detects a color collision, or any of
> its associated stations detects one, the firmware will
> send out an event. Add the code to parse and handle
> this event and pass the data up to mac80211.
> 
> The firmware does not provide an offload feature such
> as the one used for CSA. The color change process is
> hence triggered via the beacon offload tx completion
> events sent out by firmware.
> 
> BSS color feature is enabled depending on service flag
> advertised by firmware, based on which color change
> functionality is invoked.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00680-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

886433a98425 ath11k: add support for BSS color change

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635178254-17732-1-git-send-email-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
