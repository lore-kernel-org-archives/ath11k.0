Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CABC54E4A
	for <ath11k@archiver.kernel.org>; Fri,  8 Mar 2024 15:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRAXzQ88m+qLgY9ohc7lnveW+NrmpTAiULo1HUYpObo=; b=LujZ23Qqfb6I29+Wh9IFT+NNTt
	9t4UeWwzIgyq+uxghe5T8AuJT4gKQjwD6Yl1REUD4Onjb61SXG6S2ysbSzAvaAiVUqMbfW/FzZ88p
	XG3JzcRmHBUZsaTKbdTVBhTBfpepplwG12WBKOKEHHYXkxM1TUjmB+5lye7+wrsT27+r33aEzjXyC
	RIq/zA154vo1l1vhc07ShZywQihl/oqxyVnksNh8y6ZqeP7IKvSZjw4NSHQm6aGLPMovkZXTYuXOO
	iCy9A0vMgYullWUYQa4ThKawN1cH7sQKdF8qyW428LxWebGChHEp/ij0U4dWl9sWIS5VVivhid6sV
	B3SOPOFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribmo-00000009kHo-41P9;
	Fri, 08 Mar 2024 15:05:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribml-00000009kGj-3Q56
	for ath11k@lists.infradead.org;
	Fri, 08 Mar 2024 15:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8912CE1E6B;
	Fri,  8 Mar 2024 15:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18664C433F1;
	Fri,  8 Mar 2024 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709910321;
	bh=1aTSQmB1Lqtv6HfbXy1Dq/89Mka4eQAhumaOmfFiNkU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nUir5kyGcQbspwaN9XpW5B369zLkl25EvQJuKpupORo56ZvVNGifEyLIIYEiZKZce
	 KPGqYNNKfleDoIsfb0NOMQ6IEgFVwxXSFZCrVRZvuDiaKiHPNPnH8ONsgxB0fu4qmm
	 zsv3iwMqoI2WrbuwcQXv6JwGS3ZxhWQNdipv5t9SHBTLuNI1BNbdqNHIgxnmpB7m7T
	 iYnzVmFZBsLT84sZhEA1/XT+w1Hb1VMXN68ULYpIWcbyXtYDuoe2Mp3rEgzuar+lBD
	 jPS6fmPlcqhMRAechsHpfHfDKHXZW7YTdSlf66mEwUdEYO6GSyAK7Ja4895n3wTSFj
	 KBHBoPl7bQKKw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: remove obsolete struct wmi_start_scan_arg
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240226-ath11k-obsolete-wmi_start_scan_arg-v1-1-c0b94c6e191d@quicinc.com>
References: <20240226-ath11k-obsolete-wmi_start_scan_arg-v1-1-c0b94c6e191d@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170991031809.1311983.16811598893372933463.kvalo@kernel.org>
Date: Fri,  8 Mar 2024 15:05:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_070524_136041_B8BDC1DC 
X-CRM114-Status: UNSURE (   5.32  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> ath11k inherited struct wmi_start_scan_arg from ath10k. However, in
> ath11k, this struct is unused -- struct scan_req_params is used for
> this functionality. So remove the unused struct.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8b9853048357 wifi: ath11k: remove obsolete struct wmi_start_scan_arg

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240226-ath11k-obsolete-wmi_start_scan_arg-v1-1-c0b94c6e191d@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


