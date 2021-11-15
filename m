Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23636C433F5
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07FC61AFB
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E07FC61AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHe7oM6YXWabbzv+w6+DZhur+tmDJkzrgKcIZkjHtaY=; b=XIwYEav811HBWS
	OUnhi47OUVgMPLif5WFif7lWeLC0EnyOMbJ91y4oY8cW8rXv4qGkmgMpI3RWD6YTBEFepQ0D2U+eS
	Ulo1XHCjzvRtIppWhi9LJbuGKrSYECJs6WxJZYUc/WH/8VL5Z2jhsCIM1dSn8Bhp9KaT2bPxNPJvz
	YLzbz+c7R1uHn6wH7S2kT60D6w7ZmToCEcimrg66o947P56bgnRZ7RcNfoqreQ96M0GKZZO+5NcQv
	3JwSn8jsGfAJj8nLXs4tfxIlX230LdP/3tSSooPWl4W2Czg2eOymmQLkjeK/6eW3t3zQoeHMt1rJD
	ZUlMk74Zi4tc1rHiC0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYWc-00Eyyh-UU; Mon, 15 Nov 2021 09:43:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY85-00Et5f-Dq
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:18:23 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636967900; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=30bUz3OSS/1vF7tLro7ewqfgS82d3CrP773b3fdWGRo=;
 b=mej+3AGmN0v/S1kG7SAneuVaKFn4kRzWKyAsQLK/ualGRanWmn6uPSxO/9lFopfAOA3jAuk8
 fpUsrhIygVVem5leUjiQvy+ULXmBSOc6tv1e3zPCmkwnWz0tDp+Abm5B0L6R3yedRAgEknxI
 vE5QEG/rZ0wz+BjfN4PnT5om/4E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61922548e10f164c25dd2d04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:15:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3B7A7C4360C; Mon, 15 Nov 2021 09:15:52 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 80709C43616;
 Mon, 15 Nov 2021 09:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 80709C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix error routine when fallback of add interface
 fails
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636558557-2874-1-git-send-email-quic_periyasa@quicinc.com>
References: <1636558557-2874-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696774835.20888.6635469600353151710.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:15:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011821_594739_68E036D9 
X-CRM114-Status: GOOD (  10.10  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> When there is an error in add interface process from
> ath11k_mac_set_kickout(), the code attempts to handle a
> fallback for add_interface. When this fallback succeeds, the
> driver returns zero rather than error code. This leads to
> success for the non created VAP. In cleanup, driver gets
> remove interface callback for the non created VAP and
> proceeds to self peer delete request which leads to FW assert.
> Since it was already deleted on the fallback of add interface,
> return the actual error code instead of fallback return code.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4ea03443ecda ath11k: fix error routine when fallback of add interface fails

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636558557-2874-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
