Return-Path: <SRS0=20C1=QG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6789CC433EF
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 12:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2DF61ACE
	for <ath11k@archiver.kernel.org>; Fri, 19 Nov 2021 12:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D2DF61ACE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4eSSmgR7ZVAN6B8ZL0fJ1zApcmGb9/hECKyLSL/UbY=; b=wjq5Zk9oHL4fgL
	/zk73H+ilwuArvuwglIKndJcPh+6ZE1EtN0VaIhTRDBrvXa/kC41XB3U9LQnNvYw/vOBfhWaZPI3L
	AItVTS7iWsXTOvkKMmMArCPWVrPucJKoDFDyBv4uJ/4wXVjbr394Rkf4lP3mrDHR0zX7Rvkm9s+ny
	0l+ENWyvj6NxZLm2M90XUomv2dobjDXb933S1mhzBdYrBSIihSfCryx9vmBscUAAH37d3ecY6hgME
	Z0REpmwuNXNdU/11pSFgPgnA+XodKL6TEWmBiUe/EMNFVucB4yTC2Zg89VINYa3rxkeKcrSrlkaUf
	jlN7iZZnlIIeFQ75MCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo3Ev-00AOgh-3s; Fri, 19 Nov 2021 12:43:37 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo3Es-00AOg2-Gi
 for ath11k@lists.infradead.org; Fri, 19 Nov 2021 12:43:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637325813; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=z2cl02GQZDYpTZwOec3Fcl0cW+j42ZSVUTXNUs2skYw=;
 b=OxMni64Lf69Y/JKN+B84d7kMZNtKOKzk3wfxlK80w8+wtv6hEwsxFulBdJ3VU1Ak0clzEafG
 g42bL+V83J2Cm3yW023nofp3qPuLQX+vNe0xc501v/X2P6Ybu5hfQpMKLopePsC/YsJ7qt2A
 Q8eoJS1WHGhRoZ1uFq9NxVLg6KI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61979bf4638a2f4d610ed3b9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 12:43:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 107A8C43616; Fri, 19 Nov 2021 12:43:32 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 881D6C4338F;
 Fri, 19 Nov 2021 12:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 881D6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 4/7] ath11k: refactor multiple MSI vector implementation
References: <20211026041705.5167-1-bqiang@codeaurora.org>
Date: Fri, 19 Nov 2021 14:43:25 +0200
In-Reply-To: <20211026041705.5167-1-bqiang@codeaurora.org> (Baochen Qiang's
 message of "Tue, 26 Oct 2021 12:17:05 +0800")
Message-ID: <87lf1kco42.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_044334_655668_F9A7746B 
X-CRM114-Status: GOOD (  16.34  )
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
> This is to prepare for one MSI vector support. IRQ enable and disable
> of CE and DP are done only in case of multiple MSI vectors.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>

[...]

> @@ -558,6 +558,13 @@ static void ath11k_pci_free_irq(struct ath11k_base *ab)
>  static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
>  {
>  	u32 irq_idx;
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);

ab_pci should be before irq_idx to follow the reverse xmas tree style, I
fixed it in the pending branch.

> +
> +	/*In case of one MSI vector, we handle irq enable/disable
> +	 *in a uniform way since we only have one irq
> +	 */

There should be a space after '*', fixed now.

> +	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
> +		return;
>  
>  	irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + ce_id;
>  	enable_irq(ab->irq_num[irq_idx]);
> @@ -566,6 +573,13 @@ static void ath11k_pci_ce_irq_enable(struct ath11k_base *ab, u16 ce_id)
>  static void ath11k_pci_ce_irq_disable(struct ath11k_base *ab, u16 ce_id)
>  {
>  	u32 irq_idx;
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
> +
> +	/*In case of one MSI vector, we handle irq enable/disable
> +	 *in a uniform way since we only have one irq
> +	 */
> +	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
> +		return;

Both style issues fixed here as well.

>  static void ath11k_pci_ext_grp_disable(struct ath11k_ext_irq_grp *irq_grp)
>  {
>  	int i;
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(irq_grp->ab);
> +
> +	/*In case of one MSI vector, we handle irq enable/disable
> +	 *in a uniform way since we only have one irq
> +	 */
> +	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
> +		return;

And here.

>  
>  	for (i = 0; i < irq_grp->num_irq; i++)
>  		disable_irq_nosync(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
> @@ -651,6 +672,13 @@ static void __ath11k_pci_ext_irq_disable(struct ath11k_base *sc)
>  static void ath11k_pci_ext_grp_enable(struct ath11k_ext_irq_grp *irq_grp)
>  {
>  	int i;
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(irq_grp->ab);
> +
> +	/*In case of one MSI vector, we handle irq enable/disable
> +	 *in a uniform way since we only have one irq
> +	 */
> +	if (!test_bit(ATH11K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags))
> +		return;

And here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
