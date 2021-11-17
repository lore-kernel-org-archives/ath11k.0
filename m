Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517FDC433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3146187F
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B3146187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFyrsOVgLa0nF7SNislVFa2ecQv69BEagJXpCMlnhKo=; b=2yyzGvREvmfKOS
	a9ITr+GnvU2tyJ6A1PZs3i6fLRlBK8uN7wQ5ZqSgNDEoewowaiBJj2CiUiAxcbC91GKAj+mRnj/KH
	PDDYRvpFaUqF+PUbylabKwZOwGSjTZ//iOfFhuWiK64M5Gmtul7U+v4WzzUsPDnJRojHee0alCLGj
	zoqNBQE5tHVH9tCcNA1t40OCHYxSzNBlw4Sp+7O+YekB790j2mCLLUpICRiaKCgJiy4Kd4eowAB3V
	AVAmeklJgnnJUGvVr0SPk+hM2fO887s/D2KzYYtgJsmhqJO5qoNT6ayMbnR//vdnZ/V9rtDfGz2Ot
	i+YcBKJQvMAIJL3/vlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGj7-0041fu-CS; Wed, 17 Nov 2021 08:55:33 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGj4-0041fK-Mm
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:55:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637139327; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=psNHdrQjd1DGSYvv+He0WJ21TCqFZwc6FWmmMhgbuog=;
 b=HhfvEhIM78PMSDuvV6+qPSc8JKH/RzOQPwRHt2fFze+LY1u9jtDHl3UOQ7GCZ7gbkCWDmqeH
 iBqx0ayHbmik3W1vM0ixKTxarpkuYIwabkrHIZdnX5GM1HVp8lks0i6lrmmBhTDsPXpIah4Y
 nGRV+EGu2TCn/1GUyxEVaHLeiPw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6194c37ef5c956d49e5cf705 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:55:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5E86C43617; Wed, 17 Nov 2021 08:55:26 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E00AC4338F;
 Wed, 17 Nov 2021 08:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5E00AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: skip sending vdev down for channel switch
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211027094836.12524-1-quic_wgong@quicinc.com>
References: <20211027094836.12524-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713932325.10263.1700447801857143342.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 08:55:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_005530_830562_BD48B442 
X-CRM114-Status: UNSURE (   9.14  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> The ath11k driver currently sends vdev down to the firmware before
> updating the channel context, which is followed by a vdev restart
> command.
> 
> Sending vdev down is not required before sending a vdev restart,
> because the firmware internally does vdev down when ath11k sends
> a vdev restart command.
> 
> Firmware will happen crash while channel switch without this change.
> 
> Hence skip the vdev down command sending when updating the channel
> context and then fix the firmware crash issue.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:5440
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211027094836.12524-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
