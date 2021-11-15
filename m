Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FB1C4332F
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C91B8604D1
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C91B8604D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyrtfDOqUo4uVfG7HvyTejEa++HADOBCmYjIVlK2VlA=; b=UnSzk7ckUyKKL9
	X0xqrMGtK1CdXWuw6UfbOwquLQsYJN/ZCqSmEMINDFS/iqQrkP9TW1W/KcW0kWvqMHYpfJnpzQIgC
	BaTuKTEt0G/D+QVpg85CgyMuXGIqwsZCwzjSa8TZEEr/WJ8+201DwsXkCJY5G3ZAx29xZzNdMYzab
	fJI55yR20J4u2t6L5iKv122Wbakml0ewQrRVqRREUkfpIA2r+35Lc+uldVVKmMlC14tI0BzAwmU9K
	g0FJg01BGob24+qd7gc7U0Ns86nr6QpD7VTX9DIAr0Azt++3nnLd77z1+GOPwyg3suaYvD11tVXJc
	q7AE1sRFy1fwRfHwmvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYjf-00F2dK-OE; Mon, 15 Nov 2021 09:57:11 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYFX-00EuOg-Qu
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:26:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968363; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=pM1Hj7+qTdm+bCFtPE48hOmFVlAu6IkxkbjG6nyb82M=;
 b=uwMmd+jPWf07DOwLjQ06xWzXHwcIhzM/356N3EZ1JPt/kCcu12YXOve61b7yNotSSt0Ttbbr
 njBbJAETzaD1Xvg+1MJN06DUKA69LxtnEIvjVvVSsSG7uuSkoDFRn93twMz+ViGH2VOj8ES9
 hUFNNJkYNAY+214jtSxIri6tJwk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 619227aba9c3e8b85b397b53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:26:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 22337C43619; Mon, 15 Nov 2021 09:26:02 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 312FEC43617;
 Mon, 15 Nov 2021 09:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 312FEC43617
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Increment pending_mgmt_tx count before tx send
 invoke
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635168282-8845-1-git-send-email-quic_ppranees@quicinc.com>
References: <1635168282-8845-1-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696835789.13305.793744230126024707.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:26:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012604_003828_01410204 
X-CRM114-Status: UNSURE (   9.21  )
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

> There is a race condition whereby the tx completion handler can be invoked
> before the 'num_pending_mgmt_tx" count is incremented. If that occurs, we
> could get warning trace indicating that 'num_pending_mgmt_tx' is 0 (because
> it was not yet incremented). Ideally, this trace should be seen only if
> mgmt tx has not happened but tx completion is received, and it is not
> expected in this race condition.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c0b0d2e87d91 ath11k: Increment pending_mgmt_tx count before tx send invoke

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635168282-8845-1-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
