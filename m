Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302D4C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:33:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B3461BFA
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 10:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0B3461BFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BR3S/icdMdnvNf3WV/zXt+iEuS57K2aIhdl5DJE2Py4=; b=1HC7xu18GAXEsO
	Nu7RLeHaemHzDLJhTNBA9dPgS9O2aBo/CH0feu/+rbwrQc4XBPJUApNoyaFu5ylblwQyH4bRVozyn
	0fXhhtzokyQoWu/F9ulo1j22yYtNP8yFMDucHaOvo3x01bXNiG472hYX0qDWrk/thAz026x0NHsCm
	2coOM6AB6acgT4w61Kyz3hXU2bPG653P0OXlmzwYpa2ELWxvCarusZ+IaxvZE5bwCR4TeUSOoGys6
	FBXpwQO5HUTE52poCdjqLHZLbjCfmW2vYLbwUXt2P5qbF3Al239aVYZz7qVSGa+cC+40qWj/CNR+c
	KlZ13eue3tti3mQ1AilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmZIk-00FD3j-4E; Mon, 15 Nov 2021 10:33:26 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmZGp-00FCNE-0c
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 10:31:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636972286; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=/D4U2pti7GugSxYQtVmprvM+xoTx1CIFzT5P6ydhkFg=;
 b=vYYziUAxuP32n3wJ0+JeTRad8i5aQxreKhhC4BJ3soJzOjzFguTVwbQEF+KqgAdmtSIdDeKw
 HCpnLg8ATL7sQC02IHkbjGrkLbVntcJ1WEZGUAWvQ9BbSAnrf7u77qwEC8PiCIAxN9fv0D5y
 WhE842bi7E5y4lB/+fQQd2CSnBQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 619236fdbb7027b8e1acb9be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 10:31:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A3F42C4360D; Mon, 15 Nov 2021 10:31:24 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 59CA6C4338F;
 Mon, 15 Nov 2021 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 59CA6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/7] ath11k: use ATH11K_PCI_IRQ_DP_OFFSET for DP IRQ
References: <20211026041655.5112-1-bqiang@codeaurora.org>
Date: Mon, 15 Nov 2021 12:31:21 +0200
In-Reply-To: <20211026041655.5112-1-bqiang@codeaurora.org> (Baochen Qiang's
 message of "Tue, 26 Oct 2021 12:16:55 +0800")
Message-ID: <874k8diubq.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_023127_165551_E68C5870 
X-CRM114-Status: GOOD (  17.68  )
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

Baochen Qiang <bqiang@codeaurora.org> writes:

> From: Carl Huang <cjhuang@codeaurora.org>
>
> Like ATH11K_PCI_IRQ_CE0_OFFSET, define ATH11K_PCI_IRQ_DP_OFFSET for
> DP to save the IRQ instead of base_vector from MSI config.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index bf8d34bc5afa..ed610e56c160 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -16,7 +16,8 @@
>  #define ATH11K_PCI_BAR_NUM		0
>  #define ATH11K_PCI_DMA_MASK		32
>  
> -#define ATH11K_PCI_IRQ_CE0_OFFSET		3
> +#define ATH11K_PCI_IRQ_CE0_OFFSET	3
> +#define ATH11K_PCI_IRQ_DP_OFFSET	14
>  
>  #define WINDOW_ENABLE_BIT		0x40000000
>  #define WINDOW_REG_ADDRESS		0x310c
> @@ -764,7 +765,7 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
>  		}
>  
>  		irq_grp->num_irq = num_irq;
> -		irq_grp->irqs[0] = base_idx + i;
> +		irq_grp->irqs[0] = ATH11K_PCI_IRQ_DP_OFFSET + i;

This broke the build, I fixed it in the pending branch:

drivers/net/wireless/ath/ath11k/pci.c: In function 'ath11k_pci_ext_irq_config':
drivers/net/wireless/ath/ath11k/pci.c:740:50: error: variable 'base_idx' set but not used [-Werror=unused-but-set-variable]

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
