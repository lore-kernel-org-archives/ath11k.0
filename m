Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F3FC433EF
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EF7QRYL/m6S54t8z6qdQjBXVk4YXecBM5uj6L3f/Mcg=; b=WGP/M93Jbkp40h
	w7mWRVTD0hdsFnPy8+R92k38+llcwb6VsseMfi9KDm2VMPe+hmIlm0yXC/hlOXrlXEA+vJ7EagCRO
	rcZvy/CLRMjsjicZLDWwGWFkM8AdzfjLbZnhJwNWKSW7divKdNS72NHjh5ZPykI2+0TmSNeXm2Zx5
	zbzKMSn677pa6JF1kWfe1EyWTuIYrTOpmTk6HGb3MRXFDxo8mUH8bF54lfLQtk4Ll9brVWLitCtRo
	TF5tyDNymZkEFKX/3BEClUSHa93qWoCNQxPT1dnifo88IABjexzuU77qrPb2VH5pRiyo76KlNtx40
	treqhRQ5kvzCX7XAfOhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqYJx-009xoS-Bd; Fri, 26 Nov 2021 10:19:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqYJt-009xml-S4
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 10:19:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637921945; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=9w6CUHr3DnghWuXieLVzyi3+m3hj9sDLHN8VY6VfoAU=;
 b=QlLUXmNagebIYw+pv34FZ2ZGY8f5XB3K9o+rkQU033PqfylFoZ7ltAEijZYya3SLE543fgEB
 uOy+d3kCL6bDGiW5c2l0sZo2WCMZrEi3cQvq7D5tJvV3aJoHWCz7P3fr3Wi6mrFiPv4xAYT9
 F++tHchsT0tkl+75OtkCjf1M+t8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61a0b498db3ac5552a21e413 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 10:19:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4F395C4360D; Fri, 26 Nov 2021 10:19:04 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9CC81C4338F;
 Fri, 26 Nov 2021 10:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9CC81C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Use host CE parameters for CE interrupts
 configuration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1637249558-12793-1-git-send-email-akolli@codeaurora.org>
References: <1637249558-12793-1-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163792194060.23943.15273022078446639620.kvalo@codeaurora.org>
Date: Fri, 26 Nov 2021 10:19:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_021906_000288_D2EA8F33 
X-CRM114-Status: UNSURE (   9.15  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> CE interrupt configuration uses host ce parameters to assign/free
> interrupts. Use host ce parameters to enable/disable interrupts.
> This patch fixes below BUG,
> 
> BUG: KASAN: global-out-of-bounds in 0xffffffbffdfb035c at addr
> ffffffbffde6eeac
>  Read of size 4 by task kworker/u8:2/132
>  Address belongs to variable ath11k_core_qmi_firmware_ready+0x1b0/0x5bc [ath11k]
> 
> OOB is due to ath11k_ahb_ce_irqs_enable() iterates ce_count(which is 12)
> times and accessing 12th element in target_ce_config
> (which has only 11 elements) from ath11k_ahb_ce_irq_enable().
> 
> With this change host ce configs are used to enable/disable interrupts.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00471-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 967c1d1131fa ("ath11k: move target ce configs to hw_params")
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b689f091aafd ath11k: Use host CE parameters for CE interrupts configuration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637249558-12793-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
