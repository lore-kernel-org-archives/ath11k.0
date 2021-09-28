Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA76EC433EF
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 968EF60041
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 13:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 968EF60041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku+VKKeaE2rGrVWaqWWCc3oeyyMYpQThx6iV/N3Soeg=; b=D7BblJZxqCY8bc
	mx/I8lVmgA0QqutX5sL6kz20a27nMGWUwcVqyA/7ZgTyPXPh0MfiNYecQxQ5XYo8S2vv/vFm8Gy5k
	QKyO1h93AnhDwGl+IOhL7dy7hXLKoPNOZumeZMRPXXp9ZYAGwTcfMoz6IHHuGwufpHHjfflBILBg9
	10EYr3OVv4lLpA5x+jFM3IZy9PfZdyYpF/W/6h9GLoVKF2Ej6NvnGaJ8hsDrRm9i36jLGqR27dO0V
	YUg6PRAtBeLyGw6/AufqYtw9d57GzrKAnJN19tx9HdSShqIUeVIW3dojZZPue5ldUd8M0IeorghE+
	qKAHkw3aqd47EHM+7XHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDcs-007Srq-L8; Tue, 28 Sep 2021 13:58:30 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDcm-007Sc1-Gd
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 13:58:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632837507; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=m3B1qN05dLRIc1FoDoMKuANOq+i0q5N936G6b9QVU4Q=;
 b=CuIGOP/a7UB/1oEJNEFZlBs6spew1SUVtUWVx0S2nCuF21yZ8cGAOoPpA4abKRwMz+7XLb8/
 FT4RJ4ojYVmR4JbFbhw2j/FPmgu21dMjJlgnlxbfovfc4I9nIHNs2nffMUHeHZ3ssSbq/K9/
 04omNWrtqN8AFr97I0lPtsuLT+k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61531f66605ecf100bcb9086 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:57:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 12087C43460; Tue, 28 Sep 2021 13:57:58 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61EE1C4338F;
 Tue, 28 Sep 2021 13:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 61EE1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: add handler for scan event
 WMI_SCAN_EVENT_DEQUEUED
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210914164226.38843-1-jouni@codeaurora.org>
References: <20210914164226.38843-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928135758.12087C43460@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 13:57:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_065827_279957_A6E6986B 
X-CRM114-Status: GOOD (  13.90  )
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

> When wlan interface is up, 11d scan is sent to the firmware, and the
> firmware needs to spend couple of seconds to complete the 11d scan. If
> immediately a normal scan from user space arrives to ath11k, then the
> normal scan request is also sent to the firmware, but the scan started
> event will be reported to ath11k until the 11d scan complete. When timed
> out for the scan started in ath11k, ath11k stops the normal scan and the
> firmware reports WMI_SCAN_EVENT_DEQUEUED to ath11k for the normal scan.
> ath11k has no handler for the event and then timed out for the scan
> completed in ath11k_scan_stop(), and ath11k prints the following error
> message.
> 
> [ 1491.604750] ath11k_pci 0000:02:00.0: failed to receive scan abort comple: timed out
> [ 1491.604756] ath11k_pci 0000:02:00.0: failed to stop scan: -110
> [ 1491.604758] ath11k_pci 0000:02:00.0: failed to start hw scan: -110
> 
> Add a handler for WMI_SCAN_EVENT_DEQUEUED and then complete the scan to
> get rid of the above error message.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

441b3b5911f8 ath11k: add handler for scan event WMI_SCAN_EVENT_DEQUEUED
c677d4b1bcc4 ath11k: indicate scan complete for scan canceled when scan running
62db14ea95b1 ath11k: indicate to mac80211 scan complete with aborted flag for ATH11K_SCAN_STARTING state

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210914164226.38843-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
