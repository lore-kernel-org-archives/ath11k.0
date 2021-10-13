Return-Path: <SRS0=CdPh=PB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7327C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 06:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E4A60E53
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 06:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E4A60E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0wuLxAF5x9ZeFHTn2j7ttXSoy0n8lTVue64m5E7jlY=; b=2LFBsG4dZ+R2wT
	3Z0rZCSm+eCnWnI7NcYLQZdeBhM6RFYk2/AXKGnC7116r6nIZebJQM9O225GFQ4NX8lkN5NmkP4kO
	BGRFoR2y83IqnRRbVfcd7lLIHVKONrqybztySJCY83nBcr0FAJZxlQ/KLdlBpB11pPQD1pWi09bLi
	v3VXQRVdjH63c5p2xfKhwtLRXEr43w6sYm2Qkki2n0oMHPT5bGX2TNUfstkT7gKmVxwQpjDpsK/Df
	nhASnngjzQ5hAjEU87N5//woeuXelPsQpQFwSg0d7vL2w7lORp+K/QBR1Ttd5Gw1i3ilWdwpCCIM0
	26QJQ9y5vQGLbVm7Xnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maXSs-00F5sG-TU; Wed, 13 Oct 2021 06:10:10 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maX6y-00F1BG-GG
 for ath11k@lists.infradead.org; Wed, 13 Oct 2021 05:47:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634104052; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=a1HfOCtIMRXaZW1IUD3cf4eoXu+DtmiWmpf2hTFZPcE=;
 b=dM7bhYmENPITmwSFkuAlHftNaHUMSoQLO6DOutUPOTdvFpf7i7A95ls/bD5+TQ4ec/yjpb+Q
 FhUbahzHNCKrwASLFbPIks/rhHWyEWMq1nIcdFuVl5JFV3L+eOJtDwf3gh2Cx0QjQhtANyWQ
 mbLOSKdTlE4WrHfH3dx0x5uuGQ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 616672f0ff0285fb0ad6301e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 05:47:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6D864C43460; Wed, 13 Oct 2021 05:47:28 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 39E92C4338F;
 Wed, 13 Oct 2021 05:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 39E92C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Identify DFS channel when sending scan channel
 list command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211011054919.77071-1-bqiang@codeaurora.org>
References: <20211011054919.77071-1-bqiang@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163410404522.12797.13953089628773555081.kvalo@codeaurora.org>
Date: Wed, 13 Oct 2021 05:47:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_224732_660526_DFE78E41 
X-CRM114-Status: UNSURE (   8.16  )
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

Baochen Qiang <bqiang@codeaurora.org> wrote:

> WMI_CHAN_INFO_DFS flag should be set when configuring a DFS channel
> included in scan channel list. Without it, firmware will not send a
> probe request frame which is needed in connection to an AP configured
> with hidden SSID/network_id. So fix this to allow probe request frames
> to be sent in cases where a beacon frame has been seen on the channel
> first.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

8cd5c0847160 ath11k: Identify DFS channel when sending scan channel list command

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211011054919.77071-1-bqiang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
