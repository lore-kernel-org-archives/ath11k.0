Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1D6C61D9B
	for <ath11k@archiver.kernel.org>; Wed, 22 Nov 2023 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVGJmRdcbf/s3KXAfYTYIDv0spH4UehjXNLjJ0iI1OI=; b=IVe9gmmFJjqjXG
	5gLf8inODFMEcQKaB6ej1XuTtm+ZhD6r5AVrNDSpy917sTbNbSfJG0VyJG0OWy3XznE0jKSpkVZnd
	FYXfdFMGnnJoe6fCGwnJgOyPXWGnRKdp3fhXoPJ5tC8bqcmrRFXtn/3NtfIHGP/azPKPes3UkehIA
	IeJdLt37hzKDDasx1am5l3N3BfUwB14JyxH0dNpHT7yBbCsF+ta0RvNIQXYn8Q6dkI/d+GWIoFH5Q
	XDdaLlSXcnEbo2rpoPzGTLF9LiXEXenv3nJhZGdG+jfClmTSwM1JYYdAvQnsoZxIiBG0E2U4m/deu
	bGjXgYQSz/JCDVJhuuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rtl-002oWi-25;
	Wed, 22 Nov 2023 18:24:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rti-002oTL-19;
	Wed, 22 Nov 2023 18:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C4603B825D3;
	Wed, 22 Nov 2023 18:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D59C433C9;
	Wed, 22 Nov 2023 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700677464;
	bh=uEpmgyO2p6pkPeAJKJ2rj0J4ai28EXrVdy4cfpMdf+4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=i9XO28Hhada/rH6RHoiEK9h0S8bM0G5BNDWTyD3RB0NJfur5jVQKbugoZPxB8bSK/
	 Qs12wUEfKg5KhO+svT2F/0FzB12M7+Ha1P3S04ZYWBdht8rFAtUFQHXM0GxuaroiGr
	 H2ECRw8wdtovAoumpvrg/RH/t2E9wbk++Zn5/XiS6rgqpNZDtJUdMJ3e79Q9o8y3bE
	 85n5wxs13KBo0DgYlYcOWa1wF83vp3K7u9pR6bpK6h1RlAJBhfXMglpjerL4LWESZl
	 TUjAo7N2aLb9BOwL9Yi56DvymjMmRRE789qWeDn+682yuhyLF+df69Yrz7jryLL/T5
	 sge5daIwplRXw==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: Remove struct ath11k::ops
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231106-ath12k-remove-ieee80211_ops-v1-1-d72cef1a855b@quicinc.com>
References: <20231106-ath12k-remove-ieee80211_ops-v1-1-d72cef1a855b@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170067746080.158537.6690430337439338561.kvalo@kernel.org>
Date: Wed, 22 Nov 2023 18:24:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102426_534112_8559B04C 
X-CRM114-Status: UNSURE (   7.48  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently struct ath11k defines the following member:
>         struct ieee80211_ops *ops;
> 
> This is being flagged by checkpatch.pl:
> WARNING: struct ieee80211_ops should normally be const
> 
> The original plan was to add the const qualifier.  However, it turns
> out this is actually unused, so remove it.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

199a78565cc2 wifi: ath11k: Remove struct ath11k::ops
3b6ec0409fe8 wifi: ath12k: Remove struct ath12k::ops

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231106-ath12k-remove-ieee80211_ops-v1-1-d72cef1a855b@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
