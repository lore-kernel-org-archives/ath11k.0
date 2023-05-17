Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959D5C7EE23
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 08:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=II3j4WYd4k6Q9BoBQUI6y2Di+WgczlS8xRJErKa67PI=; b=HT9PaOxx/nT2Eu
	TnKbWXnfDXmk9UfpAr2dPtQg4myQkBUHVVabTrCXMgYR73rLya87RUgRgZ8P3EP+2JPiGcuTKTfqH
	+LnQq87PtRIBD7uOo+VvXAnTrqZI0iVRhFM6uqor9gWmbdHWXUIh/bCZ7e6mnP7M8AB9hNRs8FKby
	m4tLYBhT7EA+8X4WQdBexoWoh1kvhRedPUKI0/VVayPg0o2Wgs33S1L/qPPweRB7Rt/xU6hhVxpCG
	0BHli7PyqlSxRVvKogsLDxKM7NcqfnLOToIIPwsHxI4Om88FSaaC4vcb2rDLjXxfrV30Yj2ktx94c
	8jbb0FXKUg7ffO/bUnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCSH-008pzx-0D;
	Wed, 17 May 2023 08:24:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCSE-008pyj-12
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 08:24:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9C03637A7;
	Wed, 17 May 2023 08:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E77C433D2;
	Wed, 17 May 2023 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684311853;
	bh=CB5qEF8ReCaIt+XiAIqzmCU3UHsgYgsJP9IZuPQ4zEI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WUkKvsMBAPe6+kpVTcsMBpNiPv3U4eiyeUtW7twzej6xxRWXxSJuxaf0ekg0H2tQA
	 E3Znb5k72xvJK7MsgjLDvGAEBWLWJj+Olx4MUUmYlGlH/CRR/tq50t4cMo7ClxNgzE
	 7HNIDBCA0ZO+gTDU1lq7GXobxihJ1PefFtyGb80HyNY+mhlIElxvmyi0bFd4JAi5Wl
	 qgjHrVVHOVmjOwVZ34ydQNPVeg5PfwM162i7uPKFdvRdF4d8xez/Jhmd3eqOrSUqyC
	 XqKFbMNmoG8JEZCSe6G0JeJ+bgMTmsJjYxs3egMIH1Yq7rd9ZzIKNwDPfFnOWzpdxb
	 02VviRXoAUHZQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath11k: Relocate the func
 ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230510100242.1241752-2-quic_mkenna@quicinc.com>
References: <20230510100242.1241752-2-quic_mkenna@quicinc.com>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168431185022.6823.2193709812407218849.kvalo@kernel.org>
Date: Wed, 17 May 2023 08:24:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_012414_399946_800905DE 
X-CRM114-Status: UNSURE (   9.17  )
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

Maharaja Kennadyrajan <quic_mkenna@quicinc.com> wrote:

> Relocate the function ath11k_mac_bitrate_mask_num_ht_rates() definition
> to call this function from other functions which helps to avoid the
> compilation error (function not defined).
> 
> ht_mcs[] is 1 byte array and it is enough to use hweight8() instead
> of hweight16(). Hence, fixed the same.
> 
> Tested on: Compile tested only.
> 
> Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>

I took v1 instead:

https://patchwork.kernel.org/project/linux-wireless/list/?series=744909&state=*&order=date

2 patches set to Superseded.

13236705 [v2,1/2] ath11k: Relocate the func ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
13236704 [v2,2/2] ath11k: Send HT fixed rate in WMI peer fixed param

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230510100242.1241752-2-quic_mkenna@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
