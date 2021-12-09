Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E62C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVTnsDpqA2CQs/HucreDBrHK0o9L46Vh1F9CDetGYuY=; b=zDpt1XxghXkoMF
	MwMxkMNieyGMlwXIf5XgmR2Fx7qFA8qboP36p9xAjf9DEmjlyaEnWJemmaFQ2O61RbQ8EwCPupb0A
	0pRjtcp2dwFyzuNF8lB2f27lMGerpWCJy4nQU/QZCcZqQFHh9MuACrSinJoRhUr4H1I5da9WqQoBa
	WGVCtQEyTAgjFXACOix5K2GWzZwdSvSKdSvZ9bmDJXeet+wmVCjqsN9xtJtGcrjkTL8ilSnWpqTS6
	CuiH8xJvaPzSd2U/y/Y52PRl0XR81SwobNuNpIjPCrcC43x5bj40bNHvm5+UgWQEJjVVVKZkHYL4W
	DAXvgx9+OI3mFm609iHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvEZW-00FDv1-ON; Thu, 09 Dec 2021 08:14:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvEZU-00FDuV-2E
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 08:14:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B69C7B823CF;
 Thu,  9 Dec 2021 08:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87705C004DD;
 Thu,  9 Dec 2021 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639037669;
 bh=cI6fB8jYk7B5iWJUwkjsFL5eE4/I5EYnZxkDXmlOWpE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=rNdb+jTFormIy9AOcRmnXdBITRxUWcHuJFNXw1JWr/n3bBiIjIj1ct1c5BL1YDcj1
 nUVWYisy6/QdFrtUFMg8wsR6Um8XjtT4jZCNczmWuTQVhTksSgkYUj+n82R3f9FkJ4
 R1n7/J5YGIbUuGQqAh7SYXsejz4QLvKP2QpddXm9J52qEATT/W04YNwY9iIbb79GLJ
 DGs3WVYj9j2AjciL2WSiKkJOvkCAG6GDkvyklMCqk8+IKAOr9C/y+L337zze29PAG3
 TnRnlPm/4Z2ybsVCgwyFCw7h+ydGw7SboZr2dLC5zMnfoSQoEjNvIb2fr7Mi//CRwl
 1+0Td6ogvsSGQ==
MIME-Version: 1.0
Subject: Re: [PATCHv2 2/2] ath11k: add spectral/CFR buffer validation support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1637312901-10279-2-git-send-email-quic_vnaralas@quicinc.com>
References: <1637312901-10279-2-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163903766687.12588.9252504203114598638.kvalo@kernel.org>
Date: Thu,  9 Dec 2021 08:14:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_001432_284315_93C38930 
X-CRM114-Status: GOOD (  10.61  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> Currently there is no validation on the spectral/CFR report
> over the db ring buffers from the hardware. Improper/incomplete
> DMA by the target can result in invalid data received by host.
> Due to this we may populate incorrect data to user space.
> 
> This buffer validation support fix this issues by filling some
> magic value in the buffer during buffer replenish and check for
> the magic value in the buffer received by the target. If host
> detect magic value in the received buffer it will drop the buffer.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d3d358efc553 ath11k: add spectral/CFR buffer validation support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637312901-10279-2-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
