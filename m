Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D87C433EF
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 13:03:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510B36023E
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 13:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 510B36023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSDNRDh5c0dfeS45TCOuyGYdN98rtYuPvEtM1WuH09w=; b=IRFhgoQwIynr/k
	7lpeVU/mPeM0eR9Qr6PC1FG8nipcwmVEpm6Sx9dAR4/2UQJAgaMrqCX6h46UYtX4xdX4mW09yrgow
	YOustEJkhPdvDn6zJHgtO8MuxBz3H1D87B9xK/6b9TBsDjgtxsDnvF+uVFQtFYhyKx5G/Sa8ZJYpc
	3Jw+JltPpjJL8JwcbCJq1nHGcaKGB0JS1CHvi1N+uiPuCcHGB9jZOLVsGrK3tobTeRcDrOwWXTIty
	sqy7tWXuywkWZxrdpcCi/Do98f23sQ2bB0mxF/CzCpmLVGPpZgr+DiL8mefhs6lRpSoKPvRj8Rx88
	+nD12FxDXVUGuooGfwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezdg-00GU3a-7o; Mon, 25 Oct 2021 13:03:44 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezdb-00GTtl-5T
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 13:03:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635167021; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=B2tcm02i8MgnLgeSg9kWTaBFkS8OcBQieb1rbcicaOI=;
 b=BA+9avuoAwCLpT/ZN4KYDCegTAD6jfsueESpqp2aGqhp/KyFO8fpit5cfO+DUd3DBZ8DTeTT
 qz3OyaYNlBwOxMg/Z5yQS5z0b70dCaIRavkuKXC1zZDemUGjuqjBdQoDecXDTZIG9lSrfT1i
 sfFYjExROHAwM7/GbOkCPL0Ohd0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6176ab1c321f2400513118ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 13:03:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CD2C9C4360C; Mon, 25 Oct 2021 13:03:24 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38524C4338F;
 Mon, 25 Oct 2021 13:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 38524C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] ath11k: change return buffer manager for QCA6390
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210914163726.38604-2-jouni@codeaurora.org>
References: <20210914163726.38604-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163516700088.3976.131263035323595692.kvalo@codeaurora.org>
Date: Mon, 25 Oct 2021 13:03:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_060341_492621_7F40A436 
X-CRM114-Status: UNSURE (   6.13  )
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

> QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not HAL_RX_BUF_RBM_SW3_BM. This is
> needed to fix a case where an A-MSDU has an unexpected LLC/SNAP header in the
> first subframe (CVE-2020-24588).
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

734223d78428 ath11k: change return buffer manager for QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210914163726.38604-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
