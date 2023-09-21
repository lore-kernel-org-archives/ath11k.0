Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ABE706E5
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6LPTafTjv04rzLiLs32P6ruTdp7KOKEbEEpgGN/4WI=; b=MCdxjhZuljdRkl
	lhvTUDL8aws2gS1ToXTAFm6Xm/QIbUEXvwy2xrd3RfRWEJ4RhCnY+5a3aFRWRk1bQlf4q9+pb+fvZ
	DW6wKP3n6DG7CNB+S7Jzy5oxyIgni06FthPvUNQY3jaSO3xmUTmQgTMFdGFnu5f9PPk7Fol0krwx2
	nF0Pury3AvaY133RyX0xNazIgOl3ymBAus9x2ve5uW7Q6p7J3Zv+S5l1h2aFXxQcQm/Q5biEpuosT
	450CpW+gDxUOxTHFd1WuF7vsdxgbOi5W5wuewJjspjiOHVT4ylrd26xl8XvEeWrtgZWPpMo/iFynN
	DOk830ZvPIBUJritj02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEq2-005TR8-2m;
	Thu, 21 Sep 2023 08:15:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEq0-005TQa-1f
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 08:15:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 889DF61DC5;
	Thu, 21 Sep 2023 08:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF60C116B7;
	Thu, 21 Sep 2023 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695284101;
	bh=AHBLwwOIwVWEmEP99U0FHUEQNUBcOntQwAP8JLk0Nrw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=oZQtzsaJoI5FcqsIFrLXfTKb3OPPmMerddAnyEue6eMDGmf74sMvx+jD/mt7bVlV8
	 lvWElRz1BmVrCaU4Cr1Nk5/4MI5rQDgZTKvgYEKQyEwr4wTqlFx+n6+/DaLXJjnRZH
	 qvn0lBrmP/ZbfuoUlSCS8/oW3Ow7gIAxJy9/dL0/H+XdY1BINd+R5qe3+dfuPPHRgx
	 PMVHXKD2NbpkoaVYlr7Yci5jZZU4Xvv/rnPBdVXISV/MdNw9pog6vOIJIC0bEXFt2D
	 lELB5upUDb7e61eERDi67C3qs1NAvDZ66Z9wx6cDaICSs83rms7jqh2J3MqAXX4F7z
	 L/buhWfrVQjqA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] wifi: ath11k: drop redundant check in
 ath11k_dp_rx_mon_dest_process()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230824075121.121144-1-dmantipov@yandex.ru>
References: <20230824075121.121144-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Tom Rix <trix@redhat.com>,
 linux-wireless@vger.kernel.org, lvc-project@linuxtesting.org,
 ath11k@lists.infradead.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528409870.1539628.16918837777689234702.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:15:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_011504_603512_491226A6 
X-CRM114-Status: UNSURE (   9.12  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> In 'ath11k_dp_rx_mon_dest_process()', 'mon_dst_srng' points to
> a member of 'srng_list', which is a fixed-size array inside
> 'struct ath11k_hal'. This way, if 'ring_id' is valid (i. e.
> between 0 and HAL_SRNG_RING_ID_MAX - 1 inclusive), 'mon_dst_srng'
> can't be NULL and so relevant check may be dropped.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

82ae3f463538 wifi: ath11k: drop redundant check in ath11k_dp_rx_mon_dest_process()
9066794113c4 wifi: ath11k: remove unused members of 'struct ath11k_base'

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230824075121.121144-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
