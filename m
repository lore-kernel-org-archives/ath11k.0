Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA122C433F5
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugmVOX6wl3o99Chj32ac91/ieK48vP9iJBIe4rAiWNY=; b=yS1ZYj9SdX/JFQ
	uas86yezFufiV6f351JRLmpYrKwFcrMN0n8l0X0M41LWucKfHfAmGErn2yBqZz4KMGjLwwvs2z+S2
	FXgV9kpUYk6STaYtmfMKhA4S5r8BRxUAEGr8jYgUwxoM74ANB9oEcP7PaQy+O7yJkgP8ZmprNvN08
	hr2xGcBDtn9oDWjdUyvsIC2CFy0/F4/K7WGlJS7jUEpTDCJP7cK7rJgPCMeKKIU+xuHu9AtoLSgeE
	cuUo85IZHSh/S9gokjicv3OpwvNifc5GJy4QKSTN+TmhFld65mCmCK0IF9i8cxdknTNi/XK0oyzoh
	Kjk/TAUT2PkmOURux6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrirj-001KvT-DU; Mon, 29 Nov 2021 15:46:51 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrirh-001Kv7-27
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 15:46:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638200808; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=vZUaxIxdjFlhWiYowHvoa+o2WN9GNEEMMdBJfyVcvgQ=;
 b=QmkXDBcFw4KuLO4KuPH0gvIqPJuwa6Gh9D2hiDjGd9W/Wp18mNWF4dRJfm3Ft76Ao3JcusHx
 87XHXvo/fLn1UdbXHajDD2fjAdf4Snb/7fNCxQkFzBJqIdK9OKWkGYabtlvDupVHOSC30Dac
 BUR4H1c/wIzVWfa8+V+8qjLw/Jw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61a4f5e7db3ac5552a102070 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Nov 2021 15:46:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 75BBCC43618; Mon, 29 Nov 2021 15:46:47 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AB28BC4338F;
 Mon, 29 Nov 2021 15:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AB28BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Avoid NULL ptr access during mgmt tx cleanup
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com>
References: <1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163820080368.7221.13211393859054966547.kvalo@codeaurora.org>
Date: Mon, 29 Nov 2021 15:46:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_074649_188775_CCBD63F2 
X-CRM114-Status: UNSURE (   8.82  )
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

Sriram R <quic_srirrama@quicinc.com> wrote:

> Currently 'ar' reference is not added in skb_cb during
> WMI mgmt tx. Though this is generally not used during tx completion
> callbacks, on interface removal the remaining idr cleanup callback
> uses the ar ptr from skb_cb from mgmt txmgmt_idr. Hence
> fill them during tx call for proper usage.
> 
> Also free the skb which is missing currently in these
> callbacks.
> 
> Crash_info:
> 
> [19282.489476] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> [19282.489515] pgd = 91eb8000
> [19282.496702] [00000000] *pgd=00000000
> [19282.502524] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [19282.783728] PC is at ath11k_mac_vif_txmgmt_idr_remove+0x28/0xd8 [ath11k]
> [19282.789170] LR is at idr_for_each+0xa0/0xc8
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a93789ae541c ath11k: Avoid NULL ptr access during mgmt tx cleanup

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637832614-13831-1-git-send-email-quic_srirrama@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
