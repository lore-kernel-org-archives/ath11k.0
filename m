Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2149DC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 14:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA426610E6
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 14:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA426610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdUzzPo/dEWK8Z1XTyf5p4ZfxWNKiiMoEbMkgPXYt5M=; b=kaxQNxwwxee7F4
	hXuiuhYTezEMc1JVwpJ4MZG9Rg597LMNyF4d1LnGE1/aFPoy8rNhwJ1mJ6mUNl7EYOgzTfUX0Vm0Z
	oDsw34MpXBGND/sdocY7pyFnsSMW59CDXHPlZ1W0+6AbQLcwWeent5K7KTXfjniKlQr3o0n7MufzU
	kX3pbYj161HvITEAI75oNMg9R+iDFNNY6qa9qdI1ify9vkQ8pvOPzmGONzmPI0xwHzzSztpBiaxHQ
	afTwZVgrKu1PM4zI2eDPgBczwILMcC4oal0zncDPtXeELzbCU39ytASo5XzBvzeDLq3+uflzo1205
	sP2NlYutra1DVG7GY7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDlI-007U4W-7r; Tue, 28 Sep 2021 14:07:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDkz-007U2l-1K
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 14:07:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632838029; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=WwNHM09Qr4p8cXcsFb6DLViXvQmDCcjJuGzRyvPrsTg=;
 b=SwNu9pJfaUHMecb+IOvEuqsgaE9xr2NN5JOWgytkL9FE4nzAjiSnuQW4N7DNwHrdDY6erMYf
 MEbSayB8z+3XpqSbZWIRygLnAb/wGJ44O4El5NSGHYLNhSZumYVpEPbmdCctD3Pe0CI8Nn8I
 xUPPn3Z5nQalUpsDdVe7hjRf0Kk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6153213a605ecf100bd7580e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 14:05:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1BBFCC43460; Tue, 28 Sep 2021 14:05:46 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A5261C4338F;
 Tue, 28 Sep 2021 14:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A5261C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Change DMA_FROM_DEVICE to DMA_TO_DEVICE when
 map reinjected packets
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210916064617.20006-1-bqiang@codeaurora.org>
References: <20210916064617.20006-1-bqiang@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928140546.1BBFCC43460@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 14:05:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_070709_832154_3014F34E 
X-CRM114-Status: GOOD (  11.99  )
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

Baochen Qiang <bqiang@codeaurora.org> wrote:

> For fragmented packets, ath11k reassembles each fragment as a normal
> packet and then reinjects it into HW ring. In this case, the DMA
> direction should be DMA_TO_DEVICE, not DMA_FROM_DEVICE, otherwise
> invalid payload will be reinjected to HW and then delivered to host.
> What is more, since arbitrary memory could be allocated to the frame, we
> don't know what kind of data is contained in the buffer reinjected.
> Thus, as a bad result, private info may be leaked.
> 
> Note that this issue is only found on Intel platform.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

86a03dad0f5a ath11k: Change DMA_FROM_DEVICE to DMA_TO_DEVICE when map reinjected packets

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210916064617.20006-1-bqiang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
