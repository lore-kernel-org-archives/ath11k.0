Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5732C0015E
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 17:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbWFxwFppAu32ji5HbsQwt60S5tsPKVp9Af4g3AUURo=; b=RFSjL1bl+Fvfz9
	KAudUffdzgo7+kMfjIIxsahc1kK7WbZNvIh6hDE+r3tSeb4nNzenngS27zPxYG2yxEbtkd/3ViYvw
	skmlR915+bwSu2X/+L/1F9jsLEgkxQo9wmyc4Ng90XhcvZCvb0Or2b4W7QWKq9ybZOxO7uoX10LDM
	uHs8msODQSb8tTgTbWYnVsH6civzTCuFajfcCYBeEbfa1rTYuHLiftRlkbbdLdTBfZr9MZl9oDa1E
	RNQJ1ur6lNBsNgCGQAB6EB+WilY/6UqFXRCUdPK75NSDtzcYbMEmZKmG/eNCmgBdBJd5R6iX3DkPk
	IkOb/oFyVCJRwAR+Drzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5ET-0000NP-2W;
	Thu, 27 Jul 2023 17:57:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP5ES-0000He-0t
	for ath11k@bombadil.infradead.org;
	Thu, 27 Jul 2023 17:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ydcN7KdZZ/27QfGC1dtODeQ46m5XK3Zf78caSNgHk4o=; b=jfgW1w141iiilHM1plt2xLfdi+
	hhxOdYU3HOF5PWqrIeSD0zOiPL8h/int3m9ndY5zffjuidw3TvMrYMcTvWq4sY6/oDbCASAHy7Xg6
	GG+N7c0ECPOsrHpmUzYfbJJuTL0QrYGcd1EaRNyhk1T6seTYH8sOCBMXU3N8lRlkX70gbNUHkMA60
	596yzHNLN9bDQn3yOypLZbWIdVsQKVIq0NqlNHYwJcqlM3APZz1KWoX4ufIHGth70S8rOmOG/COOz
	edXxQEwACsXfcNV5x5laImeZKzh7RtL9cQXHztgnD+Sh7BY/UEFHupyXBHrhxx1q83v5iOVPf21p+
	cQhpE+cQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3vM-007AKP-2p
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 16:33:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAF1E61EC6;
	Thu, 27 Jul 2023 16:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC98C433C9;
	Thu, 27 Jul 2023 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690475583;
	bh=++37BNE68MVdChM0LoCg87zzFbUTUqDbPyrk6Ns+omM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aOoqepxGAxgNou/FgG/YKjQ7UahRNLeWqXeT+HaXRG+UM3TckogBFg3sa/jD7uNwY
	 GiUdGgPbNhQP8B/wJ2Tnmt1EVBudqzM+pKZXpT73EQabEn7mneosW55nqPSkYLRofX
	 2UPdFKRlzIKdeSvixgmZ8wqivK941MewwbgiC8lORnQ4Wxpgm0yYqHvC9xwGi3z2Ci
	 bmAOJtMfB6E7+Zj60zIuaIqKqV6sWWd2/pRXs/f0j8Geq9AqylggnMwOWgzVc0vyE+
	 pvEIW692GmXtOLVW0RSHyMtLw76Zi+nr3w8V1Kh50crZNiTMtb1AE7xEzTj1uAN0H0
	 ict9xf5yfWJbw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>,  Ziyang Huang
 <hzyitc@outlook.com>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath11k: simplify
 ath11k_mac_validate_vht_he_fixed_rate_settings()
References: <20230726092113.78794-1-dmantipov@yandex.ru>
	<b23c9ebe-b49b-0c8c-5e20-d02fd4134844@quicinc.com>
Date: Thu, 27 Jul 2023 19:33:00 +0300
In-Reply-To: <b23c9ebe-b49b-0c8c-5e20-d02fd4134844@quicinc.com> (Jeff
	Johnson's message of "Wed, 26 Jul 2023 11:31:12 -0700")
Message-ID: <87h6ppz54z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_173313_108772_96AC43E7 
X-CRM114-Status: GOOD (  10.82  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 7/26/2023 2:21 AM, Dmitry Antipov wrote:
>
>> In 'ath11k_mac_validate_vht_he_fixed_rate_settings()', 'ar->ab->peers'
>> list is not altered so 'list_for_each_entry()' should be safe.
>> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
>
> In the future please make sure driver-specific mailing lists are
> included in your patches when they exist in the MAINTAINERS file.
> Adding ath11k@lists.infradead.org

And this is actually v2, there was already v1 sent earlier this month:

https://patchwork.kernel.org/project/linux-wireless/patch/20230704174753.76968-1-dmantipov@yandex.ru/

Dmitry, PLEASE read our documentation from the wiki below. You need to
always mark the patch as v2 and provide a changelog what changed since
v1.

And especially slow down with the rate of patches you are submitting and
instead use that time to learn the process first.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
