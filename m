Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB7FC433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0BF26101E
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 10:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0BF26101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V1plXGxocG3X0fkre33iN6bQy3YbishqNKrdOi1jxE=; b=p6qUnM0CBQ/5fX
	jKVwnRtTXNwbTcGm1TLYGDmmufTjO80Q/ZRUEbew+/sSF8xa+GqFUWKiGfxf2Zw7E6J/lj4sKsyCh
	tcZ9bxGENnNrju8yqlnWgWVpv+g8/gguQqxbWu0NxI06knwDvJLDYiA/nNYnVqRVH9zwfbvgqxLTA
	fqcxVyevZapmUnDRjU7FjgJJWieOBFaF/ClqdJr2tapdqIxmTpe8l+Zmx1L6y6zteYWxUPqZtt99Z
	H80bLZrkGyq5+oX4nMInvMu0mV9E0W/rkyIz0uWnjgGmWMMFCUcBBSNsGrxyReVhOJiPYwqPU3sC0
	SkESXtuxfyNz/CehT+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVAlp-006ssk-N6; Tue, 28 Sep 2021 10:55:33 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVAlm-006ssF-SC
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 10:55:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632826530; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=z0OOqPlUIz2VSpoSabNQP0cl97JN4q8tbV7qWlpVx6w=;
 b=r0dnKNHY2wC83dseLtkGZxv1Fq1v1biMeYnT/73RBk8isKuTK7C+Usp3/obSsDUAD+9LlNep
 UdxMYqwT24HfoUnbVCKEKl2JsPQ0B8LlOtziJO3Ky7vAn36GC717Dzv2vmT/8iGf2APa71v6
 kRzSAlw1Nc7IbS2j6VvHeNBoCiQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6152f4a13cc3a01f262d0217 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 10:55:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AB730C4361A; Tue, 28 Sep 2021 10:55:29 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C2B3C4338F;
 Tue, 28 Sep 2021 10:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0C2B3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: qmi: avoid error messages when dma allocation
 fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210823063258.37747-1-aaron.ma@canonical.com>
References: <20210823063258.37747-1-aaron.ma@canonical.com>
To: Aaron Ma <aaron.ma@canonical.com>
Cc: aaron.ma@canonical.com, davem@davemloft.net, kuba@kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928105529.AB730C4361A@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 10:55:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_035531_011466_CF4758C8 
X-CRM114-Status: UNSURE (   7.36  )
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

Aaron Ma <aaron.ma@canonical.com> wrote:

> qmi tries to allocate a large contiguous dma memory at first,
> on the AMD Ryzen platform it fails, then retries with small slices.
> So set flag GFP_NOWARN to avoid flooding dmesg.
> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b9b5948cdd7b ath11k: qmi: avoid error messages when dma allocation fails

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210823063258.37747-1-aaron.ma@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
