Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFABC4345F
	for <ath11k@archiver.kernel.org>; Thu, 18 Apr 2024 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uu5NcEhrU4CSSet1mXIeV842xnMMRGVefdneBBvr/3E=; b=jaJ+MFyd0R/myuz4k01RH2+Xhq
	8jnpSaG6E66tbq6QQylUlpJ95jpyMIoW5aqLSrqA3eJrK30kViq/IQRNqXkFIhltxmRdF0xvhy8Y7
	RJDdIIGgdmrlRb+1A9YjtpaTiWqTI8V7mRkeTFKJ9J30rWLq2Oq7EGfmGpHsXzDPxfsVi68XAcaxh
	ZSWPsuF4YP1bITEOyjE1N8nD6OY4baPm7W8Midr0DRJNnWbtjp8qnxLyeVPY0lXUQO+IMfF/2f6Vl
	9A93HXDuC00RPE9PcjxrGBXd83zejLLS2UJZQ34c5c9xrH94aEjwWy1ds7aVpSBjKMNfoqPHjOwUn
	vImOGxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTZ3-00000002lbV-35hJ;
	Thu, 18 Apr 2024 15:20:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTZ0-00000002lau-2GJ4
	for ath11k@lists.infradead.org;
	Thu, 18 Apr 2024 15:20:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91343CE185F;
	Thu, 18 Apr 2024 15:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB43BC113CC;
	Thu, 18 Apr 2024 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713453635;
	bh=/e1tInGkYUBdYm7yvZRxryugFAXscOsuzj1rVya6Oog=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OIEUZqdXtRzTWFAMtqknhihf1jrgD1+yPT4GM8WDLj0SbbYc83kKI9Rlp78TcqLVk
	 N12Zxn1R1Dut8YqZz5tZO/2+X057JjRZiJSlVMtEcVjMrT8tcdzpsGBXJtpIrG52Vp
	 U/1KK2sWteKaU+cb7FPUPclL5sAWYeVc+GO3OQPx1cgrY2m/GGgidb5iWOvhRH8Zi9
	 gq6XtMhy5TPBLyLYcld/rpjxVHbSRxCLrGRQx2eBfVg991lQ/yPvybPplhsUXIPiv1
	 fxKtHpFMuFFsOBAaEOQLDxV2RT11hox8dFUUY82WMIhLVzX/mtWbOOLX+B1Rh6wEjU
	 NF4PWBZNuVO+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath11k: Fix error handling in
 ath11k_wmi_p2p_noa_event()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <07f1fc75b2d5b4173ae1b7bb1da5be7f6fc608c8.1713212781.git.christophe.jaillet@wanadoo.fr>
References: <07f1fc75b2d5b4173ae1b7bb1da5be7f6fc608c8.1713212781.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171345363078.934743.11630888726665265520.kvalo@kernel.org>
Date: Thu, 18 Apr 2024 15:20:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_082038_881397_B2437B06 
X-CRM114-Status: UNSURE (   8.43  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> if (noa_descriptors > WMI_P2P_MAX_NOA_DESCRIPTORS), there is a mix of
> return and goto. In such a case, 'td' should be freed to avoid a memory
> leak.
> 
> While at it, change ath11k_wmi_p2p_noa_event() to return void.
> '0' was returned in all cases, even in case of error and the only caller
> does not handle the return value.
> This is also more consistent with most of functions called from
> ath11k_wmi_tlv_op_rx().
> 
> Fixes: 2408379f15a1 ("wifi: ath11k: implement handling of P2P NoA event")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

6ef5b4c9598c wifi: ath11k: Fix error handling in ath11k_wmi_p2p_noa_event()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/07f1fc75b2d5b4173ae1b7bb1da5be7f6fc608c8.1713212781.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


