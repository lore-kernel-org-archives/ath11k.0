Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA9DC4332F
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1106187F
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 09:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A1106187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a31EijJvADaPeb4Io9ANgHowxg67WhTkuof8i0NGz0c=; b=vAPQJTOAXWlXa2
	WVe3fB9LvMUecNMHWxHnexdk3TT+CRUDwr6N1QSdrkyoxBah12KfVgFXw6GUsa7mL19e5gcEpyOLj
	GbGqoKA+nm7oj70zWdDPSd0iFvXvd2hrj5/r/TdnbO8Dfr4ZX+Fku1SHnThpHrATGYjCLmC/b4LFf
	UnsvDRLOlkwLN5MnxwJkwbwK/IZd9odVMoTVvAnBq0pcGWS1JIsWKBeCAA46BmAHVcyDCDIMpSHCm
	cvHSWJQOrZIM2cLBt+3u3o4Xq63p0uMiEZIXAtrlFsrAZ4QgQRd/5wL8dep23oigb4qHuvfz1CnSt
	1mOGd18yEQCa0xalDsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGrM-0044nL-3M; Wed, 17 Nov 2021 09:04:04 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGo1-0042fm-8Q
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 09:00:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637139637; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=3hreFxFHtbQ0izQqhx3XYL+J9hIMiI0WfjRmzFBqzks=;
 b=p21v2+0s/L8qncF7+AwY+oR4FxqCYpaoAYKlBQ8I/Yy/0ePsxRukYOmopc2KlweRgQXTzO7v
 QH+bn5O3v41lVVCP/EqEbjkXPMqhVTPAyMD0DLQ/3RLEukzzwOirRIVluXl/KVYIK0SMi4Pw
 O+CgX6S0S4TwEHVScFumEl4/MkA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6194c4b311cd6d4077b538ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 09:00:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F31F6C43460; Wed, 17 Nov 2021 09:00:34 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 45FB0C4360C;
 Wed, 17 Nov 2021 09:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 45FB0C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: add dbring debug support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713962902.10263.772030244296005272.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 09:00:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_010037_483381_7BC84861 
X-CRM114-Status: UNSURE (   9.45  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> Target copies spectral report and CFR report through dbring to
> host for further processing. This mechanism involves ring and
> buffer management in the Host, FW, and uCode, where improper
> tail pointer update issues are seen.
> 
> This dbring debug support help to debug such issues by tracking
> head and tail pointer movement along with the timestamp at which
> each buffer is received and replenished.
> 
> Usage:
> 
> echo <module_id> <val> > /sys/kernel/debug/ath11k/ipq8074_2/
> mac0/enable_dbr_debug
> 
> module_id: 0 for spectral and 1 for CFR
> val: 0 - disable, 1 - enable.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>

Failed to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/dbring.c:94
error: drivers/net/wireless/ath/ath11k/dbring.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

12609785 [1/2] ath11k: add dbring debug support
12609787 [2/2] ath11k: add spectral/CFR buffer validation support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636439522-14509-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
