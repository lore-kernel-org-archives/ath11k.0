Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCA4C433F5
	for <ath11k@archiver.kernel.org>; Fri, 18 Mar 2022 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2GCuwgxfY6pL+RkFqxnX/vNEiVvLMTqzEKfDFuYm/I=; b=IMmaFHy2oOgZsb
	Ya+kyPtODe0ZDY3XhAXvI7yHRj0EUUFTwKlzxG8e44c9kwmzPP9RB71i0Ddq8VnJjpCt5Cph0zV8a
	2NnpQCz1qR2w0PujS9IJ5ehJghqlAmug+9ryi9kv2P5vWAjtXNilmsHVTGQPD2BGwV93DSAeMCZB5
	Z82P3IOuS9LXhZfxfh5k2RDfPvJ9lPKE7/2DY9EDOWGVZOz9M8vE3d8/uwlPmuuwEyGcxKZMGIlHY
	HhJOBM/8WqNW5zQG9AZndXaqjSoxBWxza5i3Qk8/QnjEAYFbngwQlFExLTsCzj+WS8tQbIy6ytMMs
	ydFbKC3PjHNeF/hMWBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVEsN-002JKy-SH; Fri, 18 Mar 2022 15:50:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVEsL-002JJx-1y
 for ath11k@lists.infradead.org; Fri, 18 Mar 2022 15:50:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3474B82474;
 Fri, 18 Mar 2022 15:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99892C340E8;
 Fri, 18 Mar 2022 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647618646;
 bh=z9ElKH/RPJ8dL6ucObv3OjEkF6xDUpmy50+aWINS/t0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=pCE+1ifPe3yI5D4B1URHeIbCjWDCQz3EL6E4xqrNO+pqvqi8CUy/Pfc4mkZ02/P7w
 RWcFMNuDx4c0ZH3Uh2v3ctgJfuYk2te/q2NO1MuTsWOC/sdqsiE35N0E+aNe2WpJph
 ZINFmtJdSutwIFYR6STciopg7RrTVjNGXIT5+hR8pNso8cTlNKHhZbZ69OTZeR2QrT
 YzL9F+5IfVR2xgc4xernihANYAkUxf99Ehg3jh1Qt/AurITA+wZ6Ddt5e1zv1pAn7Q
 mVHnYYOnKyg4vyVZwd865avHb/WcleYaqOvCk2X7J/sLfHvKYeVB3zF3FQlpq0jo4t
 +LEhkqSrkD3jg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support for SAR
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220317012728.18932-1-quic_bqiang@quicinc.com>
References: <20220317012728.18932-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164761864196.8951.13534371903381562941.kvalo@kernel.org>
Date: Fri, 18 Mar 2022 15:50:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_085049_277089_9EF4C08D 
X-CRM114-Status: GOOD (  10.58  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops,
> and this function is called when user space application
> calls NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR
> type and frequency ranges to wiphy so user space can query
> SAR capabilities.
> 
> This feature is currently enabled for WCN6855.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

What did you use as the baseline? I could not able to find an ath- tag to which
this patch would apply. I strongly recommend using --base, that way I don't need to
waste time trying to guess what was the baseline.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220317012728.18932-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
