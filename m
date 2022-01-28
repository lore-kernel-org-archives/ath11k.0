Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E164C433EF
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nw8fmJHfP8KBAgc5hILI3ZKaH8xe9Dw9SDVFb5Pkis4=; b=egN/Y6UkZBVPPr
	kCphcWuJn4uTf4TyYpV0lqzIlA42gVfwt9GbswuccE62suKbuvIXWKK71Biqix52ZJueIQx+Tmn2S
	EFxCoMU3+8TcJzyB8eYW5dEH+msgwgBpFm1Alri3tSyE0ma2yjwr2dQYT3F4OAjyQye2MVC4hRcb+
	Mn+AA/I+dXW2WikSj9XmVjfupSHlAHgXpopepeVygyfDKbOazXBcspKDRW6Lo1WYS1hhb7V8yImZS
	r4Ga+cD1zpd8bbzhz5iHe1nv9+1h82DkoDANpo1jL8IR2E5kULSkwtQd/jmPQiOBk3AV2SCvAcb76
	5/zpTQdYGBYRtbt6cw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOfm-001XN0-3K; Fri, 28 Jan 2022 10:40:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOfj-001XLZ-2Q
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:40:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABB8FB824E8;
 Fri, 28 Jan 2022 10:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E75C340E0;
 Fri, 28 Jan 2022 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643366399;
 bh=5ZYPGoe4Z/8bZLzjkru39spkwNs6rMO5FMpqtHS75Lo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=jQYH/s8MZ9GBMiGcf31uNDjRqAA5tfwcQ1zdcmE3QKbd9RqR1jcAUqVFnMWWCnj6a
 i0lOiBbGd8+YYRq8lP05irglsVZ04OvT9YHqVm5NTVNdNnMeK9nNgTZqrdAjumRrND
 u1b56pxPWyt1v8S77x/r7J1zCk4zkH1jKrLbyQMlLWMR8Urabkvq88h3uyNPLVlIUs
 Oizb72eAgqYFHHcA4DxHSjMc8zmzSs0dl0ac8fTu/6wbEjJuncsEdH14ymCrMzLN6g
 yMJbI//lB1K9ip08oP/7QubfqXSS1mCfYR/ddibpBXd7RgjkLMKvTilKYO455/9PhZ
 G6euLpqaZJAyg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 19/19] dt: bindings: net: add bindings of WCN6750 for
 ath11k
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-20-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 12:39:56 +0200
In-Reply-To: <1642337235-8618-20-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:17:15 +0530")
Message-ID: <87wnikf8jn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_024003_299252_ECA8EC74 
X-CRM114-Status: UNSURE (   8.86  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> Add WCN6750 wireless driver support, its based on ath11k driver.
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Device tree bindings should be first in the patchset.

I'm no DT expert, but you have a lot of changes in the bindings and it
would be nice to have some kind of description what you are doing here.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
