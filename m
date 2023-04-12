Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9AEC77B71
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SDjrbXPO7WnXzJtt+phcRM5/fOzAzUh14mQpPDXj+8=; b=Vb3WZkA8uv6y+5
	J4NorA0ZQ3w4fYewNx/r4XF1EtRHdXkFw2fxijtnCI4Ejw8RVgY2Td3a6Veq2P13u8gySG3yXgUUB
	40DUI1J5rkK00F1YLyM0wkQnFHLGkBhmHkUTcp2Os/G2xYx4HoPusH8xuIoTyM3w5k7PvnSLsug81
	Mav5UvTuiQlkCdgMtNRnlWERVTA3NJExYzD/5LIr8piUD6aMVPYn+sU+qhIOKr9bMXDn7nZibcFae
	gWYFoVdiopT2NhF4d7r4kkkgSoX9Zoz9EGM7WCMPpRE3c14K/+0KSqQA/ArtJcN4XYQQSx1NV7Cf8
	ap7/n4q8eA11Bb44QtVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXEy-002UZg-2F;
	Wed, 12 Apr 2023 09:58:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXEv-002UZ1-1A
	for ath11k@lists.infradead.org;
	Wed, 12 Apr 2023 09:58:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF4E162D3F;
	Wed, 12 Apr 2023 09:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62668C4339B;
	Wed, 12 Apr 2023 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293488;
	bh=GVh+aeYBaYA1KFeRtn+mqjStl4mXaYNEb0W2W45Xcvo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=eUG7oEY5x3ojHRZAxc1IWNdIgTbdBgdyPtb4607xe8NG5uPr3qVp3NFxDH5xjgZ9G
	 0dlGZBfSPJJo/DL4e8N13YrUJJ4rqW8Dc0pjzjV0Pr9/LBCsuBaU5doGNTuuQAVQUd
	 K6OZGgEk5l1JMzBAyL+uN7ss+brhw1v4gWkaCzpWNu7/WZ1M4CNAl6+PykXJz713AV
	 fXMG0bFJuSYIy+Tqdj4qz+S7kdPHsafa7RiTOeNS6R2YF3GPT3XMFO4YJP0KLcH+WZ
	 5mf5wYsTg9OxVdBypDdCJk6OZ0Glm1J1i7pIIrQkgu736GEAq3p/elRqgLsmkZN0hC
	 cklPl3Hcv5i4g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Configure the FTM responder role using
 firmware
 capability flag
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230317072034.8217-1-quic_gjothira@quicinc.com>
References: <20230317072034.8217-1-quic_gjothira@quicinc.com>
To: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168129348537.14673.10410864302995200064.kvalo@kernel.org>
Date: Wed, 12 Apr 2023 09:58:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_025809_442000_C8E2E528 
X-CRM114-Status: UNSURE (   6.29  )
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

Ganesh Babu Jothiram <quic_gjothira@quicinc.com> wrote:

> Fine Time Measurement(FTM) is offloaded feature to firmware.
> Hence, the configuration of FTM responder role is done using
> firmware capability flag instead of hw param.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

813968c24126 wifi: ath11k: Configure the FTM responder role using firmware capability flag

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230317072034.8217-1-quic_gjothira@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
