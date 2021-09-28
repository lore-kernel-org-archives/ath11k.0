Return-Path: <SRS0=DASI=OS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BE3C433F5
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71EAF60FE3
	for <ath11k@archiver.kernel.org>; Tue, 28 Sep 2021 09:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71EAF60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9J/z6GJG5fJE/y+GvX9Taf6w9qSjh2/iWjxxXdN87oU=; b=V6F1Hbgp6buzdU
	h4Zt2D9SdnH8nrQg5AIKstCX/XmPoXyIXSFvAPjQ+zFOWuUo7/pP35Jt3jyM9nVwgZ5Ve3o8I6CU7
	tMS3isbLI9/rCNk1r19HBUGDCU6op9IcmB4RzS2/0ga70AwZIx4kXBMGLCDZEdqkTU1qoADK0irtf
	q27Ompp+imCGRgRHf8mkp/5TD3I94X2olYE/OOXf8OcjiX/8Y8YR9RO1EBVjVInEH9dj2/xKVmjWU
	XnJ9FK412yM6NLxJ/+datt4cxbfHcWMEA8iowkGA4wtenrjhT1zD347hAojkFDEGKmKAO+oOECQ9V
	WIzITnSH2YuJA6kJt7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV99i-006Uij-LO; Tue, 28 Sep 2021 09:12:06 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV8rf-006Med-Uy
 for ath11k@lists.infradead.org; Tue, 28 Sep 2021 08:53:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632819209; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=xxc57pA7P7Hr8p2jqyTfuWaaedJKDN0V4xMP0FTM2BU=;
 b=EyuK2EEsob0lgPsj/lD5ZdFleQayPu9oLHY8SoLWadlcBmtn0CQNjIF/87LqHxAUo/MJn6Gc
 3p1Sd/iI96MJjJVGW32/9eiv+US8qjA8EFNScXcDFlwO0nQ84HPKFk6xYHWUG/yxufAzDaSb
 9mMo742jqM5qtDX7uwOLUsJkCSc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6152d8039ffb4131498f295a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 08:53:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D52B2C4361A; Tue, 28 Sep 2021 08:53:22 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 293D1C43460;
 Tue, 28 Sep 2021 08:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 293D1C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: Refactor spectral FFT bin size
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210721180809.90960-2-jouni@codeaurora.org>
References: <20210721180809.90960-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928085322.D52B2C4361A@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 08:53:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_015329_358162_763DFE9F 
X-CRM114-Status: GOOD (  10.17  )
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

> In IPQ8074, actual FFT bin size is two bytes but hardware reports it
> with extra pad size of two bytes for each FFT bin. So finally each FFT
> bin advertise as four bytes size in the collected data. This FFT pad is
> not advertised in IPQ6018 platform. To accommodate this different
> behavior across the platforms, introduce the hw param fft_pad_sz and use
> it in spectral process. Also group all the spectral params under the new
> structure in hw param structure for scalable in future.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath-next branch of ath.git, thanks.

cc2ad7541486 ath11k: Refactor spectral FFT bin size
1cae9c0009d3 ath11k: Introduce spectral hw configurable param
6dfd20c8a6cd ath11k: Fix the spectral minimum FFT bin count
b72e86c07e98 ath11k: Add spectral scan support for QCN9074

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210721180809.90960-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
