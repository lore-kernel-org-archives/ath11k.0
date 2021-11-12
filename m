Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F79BC433F5
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7A0360C4A
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 08:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7A0360C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i42qZ4smeE8oER4TFymQMgVsUFgluZnhpuK2Sgys27o=; b=5BwLYdeb3JIYHd
	YeMWxnT1d70sxyvC3VGvrtlApvGV1mhNGM8oVVaVNTAFBNJT/fghKuzeIamOiL25rIAr270mxD4iN
	JgXXrO/WJYaVrj/NikZtV+puG3veakWUNb0eq0u8/bNWpHE82ztdkDoeTgDT0qDYeWJKheXqyEYzi
	ag2ECUW86H1qZNoAg9uE+h79a6ompC8s4SdtkJ2MZN7V2/hHJ4qJRRK45DH9b+HQEjWthDRMRI/+T
	KTA7yrfc7YFQ+P+8t5x4ZuT0P4La0FRVohp/KuTXLYtHMSEXoE5g5rfwAW38CsuKhi4+TPJWfABqX
	JuWNrvlHONJpgXpOeeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlRWD-009eDH-ML; Fri, 12 Nov 2021 08:02:41 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlRW9-009eCq-7C
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 08:02:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636704159; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=7xz5juRc++U5jOSGEHBg//LXfIOPsTHeDZw9ypeO++8=;
 b=GanXXwybZbxCOVpFf6Wevf4VLSSxLWRErjoNOY65+TkUjije9E65xnXJ/itx/lz9JauVP6bV
 5mI8gglxIhx43jelqOth/zjlqE5OG8V0raGYvuJj9llvR8jxO/tKDgR4Yct0+YYJsbQfDise
 PoUIPPpsnbjdxViQdbKT6oGMv5s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 618e1f76d8b69943a35771c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 08:01:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48766C43460; Fri, 12 Nov 2021 08:01:58 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 64283C43460;
 Fri, 12 Nov 2021 08:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 64283C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Clear auth flag only for actual association in
 security mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635177786-20854-1-git-send-email-quic_ramess@quicinc.com>
References: <1635177786-20854-1-git-send-email-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>,
 Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163670411421.15262.14071753785667937503.kvalo@codeaurora.org>
Date: Fri, 12 Nov 2021 08:01:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_000239_325451_C245D332 
X-CRM114-Status: UNSURE (   6.71  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> wrote:

> AUTH flag is needed when peer assoc command is sent from host in
> security mode for non-assoc cases. Firmware will handle AUTH flag
> when client is associating as AUTH flag will be set after key exchange.
> For internally provided peer assoc commands from host, there won't be
> any key exchange, so AUTH flag is expected to be set in host.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01838-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c802b6d7815d ath11k: Clear auth flag only for actual association in security mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635177786-20854-1-git-send-email-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
