Return-Path: <SRS0=iaLC=PU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FC0C433EF
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 14:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF7B361051
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 14:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF7B361051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjrIG9xcDIJYipgnbW4MKm06Gz9NgDs2WtZ1chjnUzY=; b=qjQwVA8B1I0LSp
	AC3UlMIFwwk5rDREUUmzPGA88/03NxfNclKb36zHOCxVc+EZvBKV3t+0XyBL+I/+vI26JPN4ON5s9
	vrvNbzmyjhFAMF6ZvQwZPSA1fBiF9fap/vcD3tboWD4WvXcKZOuve9E4/j4WID1oR/qvPkmxHn4Qy
	N7ddWdxnMKi5ost++QA80KDII42runUACA6r8xI/f2UHOjF8xdbTBd1BbolEUqCGYntNaz4RqgqYN
	2iwEOZ5+QfDtG9239nN5NGaY3gCCN+dgd/XICwTWBsbyHS3Zzqb8Am3yLkFkze+hPxqQICLoOv5+C
	Aan8a/Hn6qKCw4Oy++dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhY4i-00GYIK-NI; Mon, 01 Nov 2021 14:14:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhY4Y-00GYH0-H9
 for ath11k@lists.infradead.org; Mon, 01 Nov 2021 14:14:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635776050; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=hfPTa5dxL3T5AIUBZZwn7bV77RB+FEBII+Ne84D4g4c=;
 b=WoarPtKYrXtHzUVFdiZCeCnoGGLvaWZbQo8evi2w07unOAk4ZCfRqqPxZUuBbyYM73i3yqD6
 ccF5MMcIr+o/9hFe2QyBp2U381FZDTZWs+S258LKiY4543RbOmUnY7yZV4vGu0Pn/C5BzuDW
 M7hRo1gQxcVVtvNnJAJlLWXyr30=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 617ff61cf6a3eeacf9215ce1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Nov 2021 14:13:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8686C43460; Mon,  1 Nov 2021 14:13:47 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2437DC4338F;
 Mon,  1 Nov 2021 14:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2437DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for
 WCN6855
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210914163726.38604-3-jouni@codeaurora.org>
References: <20210914163726.38604-3-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163577602395.7461.6563543942960093028.kvalo@codeaurora.org>
Date: Mon,  1 Nov 2021 14:13:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_071410_814736_639B6F40 
X-CRM114-Status: UNSURE (   9.56  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Commit 6f4d70308e5e ("ath11k: support SMPS configuration for 6 GHz") changed
> "if (ht_cap & WMI_HT_CAP_DYNAMIC_SMPS)" to "if (ht_cap &
> WMI_HT_CAP_DYNAMIC_SMPS || ar->supports_6ghz)" which means
> NL80211_FEATURE_DYNAMIC_SMPS is enabled for all chips which support 6 GHz.
> However, WCN6855 supports 6 GHz but it does not support feature
> NL80211_FEATURE_DYNAMIC_SMPS, and this can lead to MU-MIMO test failures for
> WCN6855.
> 
> Disable NL80211_FEATURE_DYNAMIC_SMPS for WCN6855 since its ht_cap does not
> support WMI_HT_CAP_DYNAMIC_SMPS. Enable the feature only on QCN9074 as that's
> the only other device supporting 6 GHz band.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

82c434c10340 ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210914163726.38604-3-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
