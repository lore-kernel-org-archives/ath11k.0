Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D05EC433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B76A60E90
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B76A60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+WBjbTKqSkWSLas1pftz6p5ZNsjNADvB5KqxkfVpnc=; b=uEXbYjOPNL/5eG
	PseQlXGI9BhBIs2DM5hfo8+DQAngAPGOpy166HAPYJJLVlRK6XksDqJdZ8Ze8VujlaW1BzcdiIwUw
	4hRnb1EjroAzREpHgLvjWSn1LCSvrI3XBpT7COgA1UYI8R3vNwO1/RPIbCd1o0jKAcwvHpkAXqV6E
	Y6GhWOVNLbQetV4tIGI0lpF7/Pw5ByilIWv5FoaptJqK5EUwTLAeW0sBSpzpHYFcMXFpFoJlDCXZc
	w7fL+fAccq4DH4ST+APFAfNEvVApgxwImApCN5Ewto9d4zPDswSivN2ydrZ4xFTd07SCJIRimvC5h
	TCP7lZQNzEZkXAuCrfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZp6a-007yST-Vm; Mon, 11 Oct 2021 06:48:13 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZp6W-007yQl-Qg
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 06:48:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633934889; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=X2IEGRiQjcWMuTqGKpeI/0QKhJdKCtBxxC+Br55StdU=;
 b=wd5s45+1yiQLVPQzt5uqAPX4NCDo1MGGXRpFi6ImIApoSTOU6kX3WcWoX2mXFZOe5EAoDn2E
 3FYh2H9r6l2WKU+nD/SuVtDwCkNTSh3g2WgkUeg4J7eWvrc8tU3RY94Z6SQZMkoU0zfqxfoW
 cqmwMve0MrJ96tvQTUC8bBAReOo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6163de1e4ccc4cf2c7a8fbcf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 06:47:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3CA8AC4360C; Mon, 11 Oct 2021 06:47:58 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AA389C4338F;
 Mon, 11 Oct 2021 06:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AA389C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
Subject: Re: [PATCH 5/5] ath11k: Handle MSI enablement during rmmod and SSR
References: <20210913180246.193388-1-jouni@codeaurora.org>
 <20210913180246.193388-5-jouni@codeaurora.org>
Date: Mon, 11 Oct 2021 09:47:50 +0300
In-Reply-To: <20210913180246.193388-5-jouni@codeaurora.org> (Jouni Malinen's
 message of "Mon, 13 Sep 2021 21:02:46 +0300")
Message-ID: <87r1cs3vmx.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_234810_151746_C02683B5 
X-CRM114-Status: GOOD (  22.49  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Baochen Qiang <bqiang@codeaurora.org>
>
> When doing "rmmod ath11k_pci", ath11k performs global SOC reset
> and MHI reset, where 0 address access is captured by IOMMU. See
> log below:
>
> ...
> [  133.953860] ath11k_pci 0000:02:00.0: setting mhi state: DEINIT(1)
> [  133.959714] ath11k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0x0 flags=0x0020]
> [  133.973854] ath11k_pci 0000:02:00.0: MHISTATUS 0xff04
> [  133.974095] ath11k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0x0 flags=0x0020]
> ...
>
> This issue is also observed in SSR process, cause a similar
> sequence as above is performed.
>
> Such an invalid access occurs because, during rmmod or SSR, MSI
> address is cleared but HW MSI functionality not disabled, thus HW
> target is able to raise an MSI transaction with 0 as MSI address.
>
> So it can be fixed by simply disabling MSI before reset. For SSR,
> since MSI functionality is still needed after target is brought
> back, we need to reenable it.
>
> Also change naming of some interfaces related.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index 7b3bce0ba76e..1094b53465bc 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -855,7 +855,18 @@ static void ath11k_pci_ce_irqs_enable(struct ath11k_base *ab)
>  	}
>  }
>  
> -static int ath11k_pci_enable_msi(struct ath11k_pci *ab_pci)
> +static void ath11k_pci_enable_msi(struct pci_dev *dev, bool enable)
> +{
> +	u16 control;
> +
> +	pci_read_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, &control);
> +	control &= ~PCI_MSI_FLAGS_ENABLE;
> +	if (enable)
> +		control |= PCI_MSI_FLAGS_ENABLE;
> +	pci_write_config_word(dev, dev->msi_cap + PCI_MSI_FLAGS, control);
> +}

To make the function cleaner I renamed this to ath11k_pci_msi_config(),
added an else branch and changed it to take structh ath11k_pci. I also
added helpers ath11k_pci_msi_enable() and ath11k_pci_msi_disable().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
