Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87825C433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5589D61B54
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5589D61B54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFnRkvKYeS3ZvmQ18Y6fg3dq399KiRWzzQu21NWwMaY=; b=evdWxKcZHa1wmg
	GbcLYMNGGZcQ3o0/65xqh/8H3MhtM/hkQdfaKK6uI8Io1MoBn6e19U6d0kv5v8MRLwWWGXAhF7Ct0
	hMTAWdB17xp+eJZPmT2I/C7z7xlcyMwZUF/0FJ6gz6pxUdCtfZI9bi6+fPj9C3umikan7horU56Jd
	0U9YWJ8WXz/fiXvhcRfxSQ2nmwjpP8y9ODUYpX/zNRMvZeBd9qeZg9ZMwnHq+9WItkpZ2a1PCBNOm
	F5V+Zl9hnspqyLgGPi60b196w9TQgQA/J4G/nHFXDvNAYwOWDwAYzcUhYThVfHgHNTEQEhEWzyqaS
	7nf6m1k4XPz9XJBTEk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGrx-0045AE-Rq; Wed, 17 Nov 2021 09:04:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGpd-0043ip-N9
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 09:02:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637139737; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=TVoyhmDOA8yY1+/VY5xaUO5YXYtiHrkZw/+Lr/brWQ8=;
 b=HMT8FZ8tDR/T8usVRCK6O+EoWybIOC/NO2YSwXn+um9LeTK93w8/GtMP0s83ei5ZsVR3oEg7
 Bgf0f3V07Zymz27Ea6lp7X8A42wNrda9w+Ne+Rgn3lqqRwRkvX/eJ1H9ByLy13P9+SJNhHhQ
 aomvlY016mYRU663gl+x8IIHlu8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6194c5185bbbed1f7078fdec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 09:02:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D8D11C4361A; Wed, 17 Nov 2021 09:02:15 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A61ECC43618;
 Wed, 17 Nov 2021 09:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A61ECC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: set DTIM policy to stick mode for station
 interface
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211012191833.8836-1-cjhuang@codeaurora.org>
References: <20211012191833.8836-1-cjhuang@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713973269.10263.14105427993709518647.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 09:02:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_010217_971476_0EB82C69 
X-CRM114-Status: UNSURE (   5.95  )
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

Carl Huang <cjhuang@codeaurora.org> wrote:

> Set DTIM policy to DTIM stick mode, so station follows AP DTIM
> interval rather than listen interval which is set in peer assoc cmd.
> DTIM stick mode is more preferred per firmware team request.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:2219
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211012191833.8836-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
