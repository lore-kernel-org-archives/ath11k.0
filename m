Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BFDC5478C
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtVZWVpU5R9hAHptwiMhbrmLXWCn2BTLHVeNkeWNIZs=; b=43YMDfG2vSxpdnn1Tkfny9Z97r
	duES3wjL6i8vWdsW1Kk8iimKIRw/m6Dm36Ezq36T1PCkORdmw4HsqvyxF5GWMIGfPouNeChrh2XnQ
	LImrRk5R/6oczF1LhLVAdlFmyndL060aX2oiz/au0RW2tmob8HPVXP+YnUQRbwuHvO7THS+mw5q7u
	ZA0DiBHNQAJxHxwEn0Q6mF5MemHWuAeMas/hxFu2GX3h3ZS4yM6pMW6tW+zQXGMR6g+48tcGPM3Oj
	m3cxi4IxDSW20hDnFr2FY8Y8BtQrEgPObivBuHnWN0LfxgdDrquDdmCUPbJhHieiVb89e3DA/vxo/
	xM2HISaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKUn-00000009aqH-3ctF;
	Wed, 28 Feb 2024 14:01:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKUk-00000009ao8-2KJ7
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 14:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB1A861262;
	Wed, 28 Feb 2024 14:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2272AC433C7;
	Wed, 28 Feb 2024 14:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709128873;
	bh=PQzkPrDo1YRo7+0s5+rzZSeJRnOLSEyHGwogClOAXNE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=tu7ykhg2nMk6abggJ0xU/tnHpUtTaVix0hYBh+eRcNsV0e18t0ryQ5Q5wxnPjUpLn
	 6k9rmoc1F8Xed9MQJ64a2IaywyhUhqGRdBruCM8GDrrJFfh9zkYwHZLrh3/Usuk4BU
	 EbG+hOGUIoO1N5jismTvvvsMZIkeXPqEfLjlvgdWw/W6kAeeJTMx0ejMZJ50Hh9Zzh
	 Pzktv6+nVEzWf2FN7Q5L0Mh45puvL8tQmIhalc26bVr6jul8zYyQm07aJlLMJXKXcG
	 +lt1Smgzr2SxS5M0bWk/5zu3GmYj98LKySZGJciVq97AwQQUfVssZLo4QKa0u9BGli
	 SiAkpTgI2weZg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  lvc-project@linuxtesting.org
Subject: Re: [PATCH] wifi: ath11k: fix few -Wmaybe-uninitialized warnings
References: <20240228131406.165786-1-dmantipov@yandex.ru>
Date: Wed, 28 Feb 2024 16:01:10 +0200
In-Reply-To: <20240228131406.165786-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Wed, 28 Feb 2024 16:14:06 +0300")
Message-ID: <875xy8k7rt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_060114_684493_6B40D81F 
X-CRM114-Status: GOOD (  12.11  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> When compiling with gcc version 14.0.1 20240226 (experimental) and
> W=12, I've noticed the following warnings:
>
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_remain_on_channel':
> drivers/net/wireless/ath/ath11k/mac.c:9230:12: warning: 'ret' may be used uninitialized
> [-Wmaybe-uninitialized]
>  9230 |         if (ret)
>
> drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_file_target_mem':
> drivers/net/wireless/ath/ath11k/qmi.c:2401:16: warning: 'ret' may be used uninitialized
> [-Wmaybe-uninitialized]
>  2401 |         return ret;
>
> drivers/net/wireless/ath/ath11k/qmi.c: In function 'ath11k_qmi_load_bdf_qmi':
> drivers/net/wireless/ath/ath11k/qmi.c:2494:17: warning: 'fw_entry' may be used uninitialized
> [-Wmaybe-uninitialized]
>  2494 |                 release_firmware(fw_entry);
>
> And a bunch of them traced to uninitialized fields of the same
> variable, e.g.:
>
> drivers/net/wireless/ath/ath11k/spectral.c: In function 'ath11k_spectral_process_data':
> drivers/net/wireless/ath/ath11k/spectral.c:700:47: warning: 'summ_rpt.meta.freq1' may
> be used uninitialized [-Wmaybe-uninitialized]
>   700 |         struct ath11k_spectral_summary_report summ_rpt;
>
> Fix all of the above by using 0 and NULL initializers where appropriate.
> Note there are few more (less obvious) -Wmaybe-uninitialized warnings
> still remains, but they're hardly possible to fix without running on
> a physical hardware. Compile tested oly.
>
> Also noticed by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Did you verify that the warnings are valid?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

