Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2126BE706E3
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 08:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZlQm/7p7uSOHbFJeHJ7GPmA2v4oc39OSg1EBRgHRY0=; b=DNrH84dBD9Ma23
	cMy9P7JCdljW8QpbpIq+b9pA3T8Y/z7a0M3Fp1B+vbJRutogmlYcltFMrKP1MU5asmC01XwRsD8nr
	ThZ/9N5VXqnV7CbGOvWI30rero+zu4mp96rc5DwlzQidCyyROciPL5ogf68k7O+3cgPEOjAz68nG3
	eN8Evcxh9EaTT3NeT44/NxO1rTB+7edIRDcZ6mGZ/4HpzdA2o8AQkmLtSavY6vhy0wjm/6OFj31yL
	2fwlucAPYs0rQaWxgKfBzh5PO2zo7Rm83iYAiXSeDlQ4HbDOJ2V4lL+b99PbV6M5W5WrX+FDAo3Ju
	5u9wBMu6Tr6LN4amOgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEoU-005TGp-2h;
	Thu, 21 Sep 2023 08:13:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEoR-005TGL-1z
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 08:13:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1DEFD61DC5;
	Thu, 21 Sep 2023 08:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AB7C116B6;
	Thu, 21 Sep 2023 08:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695284006;
	bh=w9s/3KqBpjc+F0htGHCCTEf8hPrclIy6Ux/UJYVbORQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ei62OwSI5BJtGMKOvLHwcgpMcK03iM0jFtMjxnhziKeQ6VyBRnnPr7mlFLqaa8aK4
	 0rmGiTaP5je9/33SGtvX1mqGzCoASfdKaZ5VznUz+YAnXNB1LcRc0ePrVdsTilJYqk
	 VYoTonLcgmMIIDbVtVN6XiUOjP489vTCNCK4SDrqm0enm4PgZT2acobznd6LnSVl2X
	 SBouwkYil8zhOdewkLFtgTGXtxZmzcIbxFDMKJqdMSDDJQtILbnFIGTZcRmZNN8zDp
	 AeYvgU2S7qX9ZI1Ledk+BNcDabxA4izd7LHgge275L9RHhSJkwv+Z7Lx6XzKHXn1WW
	 4SyzIwcp2FCRg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: drop NULL pointer check in
 ath11k_update_per_peer_tx_stats()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230906093704.14001-1-dmantipov@yandex.ru>
References: <20230906093704.14001-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 lvc-project@linuxtesting.org, ath11k@lists.infradead.org,
 Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528400337.1539628.7739014266024869825.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:13:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_011327_712464_2BAE5153 
X-CRM114-Status: UNSURE (   7.95  )
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

> Since 'user_stats' is a fixed-size array of 'struct htt_ppdu_user_stats'
> in 'struct htt_ppdu_stats', any of its member can't be NULL and so
> relevant check may be dropped.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ac13a7842ab4 wifi: ath11k: drop NULL pointer check in ath11k_update_per_peer_tx_stats()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230906093704.14001-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
