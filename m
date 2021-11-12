Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1CAC433EF
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:19:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7788560EB8
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7788560EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WKFabV9/XqU7rBuPFV60tI0TBVCTBbZnbptONFTZhH8=; b=4TzUc/iwJTt514
	CiOdseNxoFHoxsUvxTcovGH5gK/H2i3k1miQzicRXkLTSIPnt1E/G/8hYP3y0BgyoXBNf39s+Rrdo
	nwfHV6tI0uQzuDD17bUcT7iPpepCgtJKQIoA+7/MpCnE9Xn9S5uLXtX5cAvO3asN0hzl6Wt8DO8Ha
	GHgxw95S2N6xR+RZ6jo7NmfeYrkT3t3TjOhmRQ4/2zVJEOj6uh7pvPlX1qSrbsB4xNA3Rip0X41Tg
	MvBiwRJNZRMkecaUNCMsjaS45OIgHqx5M8lsEJvm+Dj971UOU2f4MFUmn/WtUiMS6A25cnl9+HQea
	Vt8WIe6wg22Mb2N4si3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlRmZ-009fo8-UG; Fri, 12 Nov 2021 08:19:35 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRmX-009fnf-04
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 08:19:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636705173; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=vJ8XMjUmB9hs5cs/fta2oLXbbtvRPmJPu2pUdlMQqRY=;
 b=L7uNNPkWWrwMFVORMqtjUae63rB92GknpxYZYC11sD1/rDJgceokTkrrOvXF4fSPvEfejqR2
 uBwLfpRfzgl1bv9Aik1ZBEQcSHctzWzcXCXX7htdRvnF48572NMCm8dMtvHL7PcHZmlvxhiJ
 qbX0lfhoyKYXJxApceLnI6O9fL0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 618e2391facd20d7957becd7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 08:19:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57596C43460; Fri, 12 Nov 2021 08:19:29 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D8A8C4338F;
 Fri, 12 Nov 2021 08:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8D8A8C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 12/12] ath11k: Change QCN9074 firmware to operate in mode-2
References: <20210721212029.142388-1-jouni@codeaurora.org>
 <20210721212029.142388-12-jouni@codeaurora.org>
Date: Fri, 12 Nov 2021 10:19:23 +0200
In-Reply-To: <20210721212029.142388-12-jouni@codeaurora.org> (Jouni Malinen's
 message of "Thu, 22 Jul 2021 00:20:29 +0300")
Message-ID: <871r3lkcqc.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_001933_189937_4DFBD528 
X-CRM114-Status: GOOD (  17.55  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
>
> In mode-2 QCN9074 firmware uses 15 MB of host memory and firmware
> request 1 MB size segments in QMI, whereas in mode-0 firmware uses 45 MB
> of host memory and each segment is of 2 MB size. In mode-2 firmware
> operates with reduced number of vdevs and peers.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Co-developed-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 23 ++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath11k/core.h |  6 ++++++
>  drivers/net/wireless/ath/ath11k/hw.c   | 14 +++++++-------
>  drivers/net/wireless/ath/ath11k/hw.h   | 20 +++++++++++---------
>  drivers/net/wireless/ath/ath11k/mac.c  | 10 +++++-----
>  drivers/net/wireless/ath/ath11k/qmi.c  |  2 +-
>  6 files changed, 52 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index d2ab3b134632..9f2c9795767e 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -77,6 +77,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_shadow_regs = false,
>  		.idle_ps = false,
>  		.cold_boot_calib = true,
> +		.fw_mem_mode = 0,
>  		.supports_suspend = false,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_ipq8074),
>  		.fix_l1ss = true,

[...]

> +static const struct ath11k_num_vdevs_peers ath11k_vdevs_peers[] = {
> +	{
> +		.num_vdevs = (16 + 1),
> +		.num_peers = 512,
> +	},
> +	{
> +		.num_vdevs = (8 + 1),
> +		.num_peers = 128,
> +	},
> +	{
> +		.num_vdevs = 8,
> +		.num_peers = 128,
> +	},
> +};

I am worried about this array. It implies that _all_ hardware support
these modes but is that really the case? I would guess that these are
very much hardware and firmware specific values.

So because of that I would feel clearer to have num_vdevs and num_peers
in ath11k_hw_params, to make it clear that the values are hardware
specific. And then have fw_mem_mode, num_vdevs and num_peers in their
own struct within struct ath11k_hw_params, just like spectral has
grouped valued together.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
