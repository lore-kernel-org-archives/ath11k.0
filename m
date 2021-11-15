Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04E8C433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:57:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8796860D07
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8796860D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUJqSFIWElnKak39CDU/DDgjWaUjyA2Bykadl8LGMPo=; b=jLl2DV7fhE0VRp
	ChmVIIWR9viEeUGBWI04yowXj6XNbhGE+Zn4GhkBKftpuFval0qBTmtbaG70h9sU9wEngXKxJsS35
	Ryg90N41AY2MITzN8S5Au34b0JPc87nUfXKOkv7LulsmupupcUTRfSmVRGJfQVr5RYe/r9sgg1XHZ
	WYqnSJshNS8izeoe4OWmdf4y+mu+tSzqWhPWNBmMM6qMn002mwfo1IK+L70Ci6NW8bC1QoS/O6biv
	wSHyrrR76TeBbsXvo+3Pvo2NNjAT9/lHGeP6pF857xrTK5HD1JCqVpOYXVfXtUAhy186P/IAJvr8a
	L3Si3N345S5cNqsDM7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYjc-00F2ci-Ds; Mon, 15 Nov 2021 09:57:08 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYF3-00EuOg-Kr
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:25:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968333; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=uWWkoroa+vndB5zMrYhTlTTPt7zfbQBsjQuRvgZzl40=;
 b=CpCeK6VitAsvQi/OapmA1Y//BmbCYe2EbLhh3w/LvSwomuRxEDcOaMh/mFdTxcqQJjGOSUJG
 7wPObmPif9kGqADrUJsFbR3J4gM+CHfgSLradYt+vQnLbn28WnpOBIVsTdqdT9eiHzp687Lp
 dbIwzPXgUo/C3xZyqOlsu2NePT4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6192278de10f164c25e544f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:25:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 71BAEC4360D; Mon, 15 Nov 2021 09:25:32 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7B2FBC4338F;
 Mon, 15 Nov 2021 09:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7B2FBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: send proper txpower and maxregpower values to
 firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635164229-22880-1-git-send-email-quic_ppranees@quicinc.com>
References: <1635164229-22880-1-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696832875.13305.14477826340345763613.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:25:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012533_959591_ED20D221 
X-CRM114-Status: UNSURE (   8.12  )
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

P Praneesh <quic_ppranees@quicinc.com> wrote:

> Set proper values for max_regpower, max_power, max_antenna_gain as it
> is because firmware will convert power values to 0.5dbm steps by
> multiplying it with 2.
> 
> If txpower is not set, it will lead to cca stuck resulting in latency
> issues for QCN9074.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9212c1b9e80a ath11k: send proper txpower and maxregpower values to firmware

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635164229-22880-1-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
