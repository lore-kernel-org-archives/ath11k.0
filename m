Return-Path: <SRS0=wXcr=JT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09EAC433ED
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 14:05:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C8A608FE
	for <ath11k@archiver.kernel.org>; Thu, 22 Apr 2021 14:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C8A608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LKVi1TrQH+gpCOjhSf88qQaIFbQqgX78new7uE6ETiU=; b=n+pcXrESQwTvKZD0EIEGzKO3R
	x++ZM/AvaJ0aa49aOZj9W+Ufv5Zsd/OdvBYPdTdvDRb1ZQ0QBxcRAdizyVXZUFEucFC48QJeXCqRm
	ox0P2GQNUN4g+0ReMAVWTuWiLp4uLGlN+qXxmlS0PV6iTme0w6UbVPbIHULTzXKmDWt/Cenr567GA
	AzxcJq3X08p9Jkqz0tHDHx/otl5pbYbQZLKLKC165TFGjZ/PuyZjFjs4/AWpTugg6mp2EDUuX3ZmF
	fJZ0KMdTYdFUKCef8/Eb2xLEi/NF7LyAM8ijTZ9fLD+Nj0YnKLQ5M6sPgbo0GlKB4MJmi9gtx9vEw
	WWL4GhhAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZxm-00GqlS-RB; Thu, 22 Apr 2021 14:05:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZxl-00GqlA-BT
 for ath11k@desiato.infradead.org; Thu, 22 Apr 2021 14:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Message-Id:Cc:To:References:
 In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=I4XwGNDATYls9g0XO/wHPfOU5OZR/ZYbaXk6AcN2vdM=; b=VXaADYNjhW0YZ3mUaZaEgiMmln
 gHTLRdr/FiKEY+YD0I/Oy6qJnxCvuu4J46h8rfOiXl87MwG1E7Olf/DPQH3Qr94bmCTkAqmv2upEu
 GUduRt0Jb8lmScCvnWnZO9oQp3uaHnK+fZVttWnfQAYMNh7D3D56PQEpXhXgkHBW5qCWBz7LWrdYM
 3KrRPbEMj67BZd4vrklC2nYvet2S0aqG5LEQkVfixNEVlA74l7aEH1vdpWZHARnumr5YKSiqzyOoH
 AFVLuyOScCiKZspwvJFB+9wUI15jSJjacWsrWvSva8UWQIcWeQClUZ53Wco9nDkd2botHuL83xkNE
 1KQ9IEnA==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZxg-00Dk6n-JP
 for ath11k@lists.infradead.org; Thu, 22 Apr 2021 14:05:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619100346; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=I4XwGNDATYls9g0XO/wHPfOU5OZR/ZYbaXk6AcN2vdM=;
 b=IToCGKJipR3aK3dndn8z/Nx6p3Z5ONA4znFWMLkp7GWV9onw8iiXdS78k7iP8siMaz0tkHYs
 Eu6wPP613Hwob6LmdlKnn7cTnuN1IYukZB0H2IVgTv4i8nFdGf3EUtiNbKu0Qs76ywT487De
 PCaMvV5XO7cEAs2X9ZXWn4CHqEM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 608182b4febcffa80f3f30d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 14:05:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7AC3EC4338A; Thu, 22 Apr 2021 14:05:40 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E1A0CC433F1;
 Thu, 22 Apr 2021 14:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1A0CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix warning in ath11k_mhi_config
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1617857830-19315-1-git-send-email-akolli@codeaurora.org>
References: <1617857830-19315-1-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210422140540.7AC3EC4338A@smtp.codeaurora.org>
Date: Thu, 22 Apr 2021 14:05:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_070546_887089_B46E2917 
X-CRM114-Status: UNSURE (   6.94  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> Initialize static variable ath11k_mhi_config for all hw_rev,
> return error for unknown hw_rev.
> This patch fixes below Smatch warning:
>     drivers/net/wireless/ath/ath11k/mhi.c:357 ath11k_mhi_register()
>     error: uninitialized symbol 'ath11k_mhi_config'.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
> 
> Fixes: a233811ef600 ("ath11k: Add qcn9074 mhi controller config")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ff9f732a87ca ath11k: fix warning in ath11k_mhi_config

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1617857830-19315-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
