Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EB0C433EF
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 12:45:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CDC61ACE
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 12:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50CDC61ACE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ab3lf3672I47K/qWi4Y4uVAvLCp3b/AO6/qBk6d1K/0=; b=3FjAtPSKPBTxxu
	5HCTmzC8YOg168mXKabjP/HP+eRTHvKGU/hXhTFyvuxmmkU32EyyZ+AB6HXKWJ8gqK1K5DN/oi6DU
	/RrC2hESF/aMbC1DLP8eMkKfDHusfs/dfe33/hwAkgO5pbHMTwju+aavCFdxQOVubmWxRVBlzWxl+
	+79dlMgiZNrsQLnRuarYvrsOPmjvSZjaJzCLi3NqyWBReYp6bzNPq6rFMC8c15I2uVZIk83P2y6Vj
	xCm2wX/MTzZaj76gKleQuGBWL9uHn28eFTkA0UJy+PUGVt4qVm2Ewyj4jMU72djz0zeDwi79mHvpf
	I6jOPUkCtrVqlDDMYDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo3Gs-00AOwv-7P; Fri, 19 Nov 2021 12:45:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo3Gq-00AOwE-BN
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 12:45:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637325936; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=EZi/zCgJPm2leshsjL14mSS1st5upvHCP4b2z58YjGk=;
 b=eOetsz8tJWR9ppcVy234pjwKYYNsvHEZuyjC+Elu55WjPiOAY8j4/PxweQmpt1SVoEM+r8A+
 twca0SJuElno2U6zuqjANcsyosVgCQRxIf+iudeUNlzinOQUBTbNUedXxNEXkjrbtgTwhv80
 cnOzbPLP5N1rHy4ADIZ0R2GsShI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61979c6f5bbbed1f7044498e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 12:45:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0E9C1C4360C; Fri, 19 Nov 2021 12:45:35 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AA7D8C43616;
 Fri, 19 Nov 2021 12:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AA7D8C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 7/7] ath11k: Set IRQ affinity to CPU0 in case of one MSI
 vector
References: <20211026041732.5323-1-bqiang@codeaurora.org>
Date: Fri, 19 Nov 2021 14:45:31 +0200
In-Reply-To: <20211026041732.5323-1-bqiang@codeaurora.org> (Baochen Qiang's
 message of "Tue, 26 Oct 2021 12:17:32 +0800")
Message-ID: <87h7c8co0k.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_044536_461725_84C271E1 
X-CRM114-Status: GOOD (  21.21  )
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

> With VT-d disabled on Intel platform, ath11k gets only one MSI
> vector. In that case, ath11k does not free IRQ when doing suspend,
> hence the kernel has to migrate it to CPU0 (if it was affine to
> other CPUs) and allocates a new MSI vector. However, ath11k has
> no chance to reconfig it to HW srngs during this phase, thus
> ath11k fails to resume.
>
> This issue can be fixed by setting IRQ affinity to CPU0 before
> request_irq is called. With such affinity, migration will not
> happen and thus the vector keeps unchanged during suspend/resume.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index b450b4ed35d1..1cad7545ceb9 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -840,6 +840,14 @@ static int ath11k_pci_ext_irq_config(struct ath11k_base *ab)
>  	return 0;
>  }
>  
> +static int ath11k_pci_set_irq_affinity_hint(struct ath11k_pci *ab_pci, const struct cpumask *m)
> +{
> +	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
> +		return irq_set_affinity_hint(ab_pci->pdev->irq, m);
> +
> +	return 0;
> +}

I reversed the order here:

static int ath11k_pci_set_irq_affinity_hint(struct ath11k_pci *ab_pci,
					    const struct cpumask *m)
{
	if (test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
		return 0;

	return irq_set_affinity_hint(ab_pci->pdev->irq, m);
}

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
