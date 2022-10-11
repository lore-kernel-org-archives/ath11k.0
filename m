Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8EFC433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6QwfP80iXJAH3tOEODlrUDCsnOMwanY9nmkHUurn7g=; b=kqLe+yLrcaG9ze
	0z7smECSCXTqxHcgXzTHd/MX1VzM1/pVif2ySg+vGhNUnoKhX4WM4HrirABWFKgbYbgNI7s85bwUF
	nJUA6fv6+gld21Oo1fQy6ciQDFri+rviONk4LlbpSw/Vd14daJbGl1+rTJngNL0vI3tXO/lwx9Mdc
	p+kMvf0cLfA7UVzviHQYBbgDdSTt8cA/SK/f6fJSdeCDD7IyUdsYBI1YHrE2Nk/EeHH/TGQymwfhY
	K68Y2gSx7quxDE7SIhEyhm+ne0XoHmRCeVM8OjO/OexzKg/hiOvVqO5oEPuirLSLPgh4GwPtERqgS
	yWx0dh+X5zOCF/dvq9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAQQ-003gDs-E3; Tue, 11 Oct 2022 08:15:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAQO-003gDS-69
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 08:15:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9E39561148
	for <ath11k@lists.infradead.org>; Tue, 11 Oct 2022 08:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74FFC433D6;
	Tue, 11 Oct 2022 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665476139;
	bh=A6wVGA+pwMc+0q/He+Pp+aN/oc/seDRDWRwlQE7tQeQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Q2rQmLTGO1zruL7ldvYdUQDpq8pvO3uGHpd++d7IDx0x94ELM8lLGfWg812wCJ3Bf
	 WssmJYIf+GE3iXYYiVcz6F7LWFNAhQRbhDAKdKpmofUmI4W3EhaFDyQW8FmcGnvv4r
	 S7jnZqN/ewZLcZM0EMb1qU/uvPvre8Z3CTDJbK3tjSflCVu2dIFunDmIRLQtfulWB8
	 0Qioi6gZ3kvWAeaL0FNReXFw/HW/wvp0MwtLUBII2WJjsh8rY5TNt8fNFjOs0aq3MI
	 0UxibB0ICVvBwJ/7BectuM/tEst+ZcWpl1B+4YwfWzqudzJlNc95zd79e11oyQaPZJ
	 bGyu4gtjbxf8Q==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: Re: [PATCH v6.1] wifi: ath11k: mac: fix reading 16 bytes from a region of size 0 warning
References: <20221010160638.20152-1-kvalo@kernel.org>
Date: Tue, 11 Oct 2022 11:15:36 +0300
In-Reply-To: <20221010160638.20152-1-kvalo@kernel.org> (Kalle Valo's message
	of "Mon, 10 Oct 2022 19:06:38 +0300")
Message-ID: <87pmeyojx3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_011540_287225_E6799ADE 
X-CRM114-Status: GOOD (  12.73  )
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

Kalle Valo <kvalo@kernel.org> writes:

> From: Kalle Valo <quic_kvalo@quicinc.com>
>
> Linaro reported stringop-overread warnings in ath11k (this is one of many):
>
> drivers/net/wireless/ath/ath11k/mac.c:2238:29: error: 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0 [-Werror=stringop-overread]
>
> My further investigation showed that these warnings happen on GCC 11.3 but not
> with GCC 12.2, and with only the kernel config Linaro provided:
>
> https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/config
>
> I saw the same warnings both with arm64 and x86_64 builds but couldn't figure
> out what exactly triggers the warnings, or why I didn't see them earlier.
> Nobody else has reported this either. This is also why I can't provide a Fixes
> tag as I don't know what's causing this. The function hasn't been touched for
> a year.

Thanks to Arnd I found out that KASAN caused this so I'll update the
commit log in this regard.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
