Return-Path: <SRS0=USyd=PA=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E44DC433EF
	for <ath11k@archiver.kernel.org>; Tue, 12 Oct 2021 09:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685D560EFE
	for <ath11k@archiver.kernel.org>; Tue, 12 Oct 2021 09:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 685D560EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From:Date:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ws+JtjRk4ItJN5zS5BskyEcuOSvOm/O2A7qwBugQ9LY=; b=bbhyAMbqFMxU4sdqRDHvF0HbEx
	Lk1F2Vuc9VHFIBVDIYm6+Hz7AE4wqa9ZEha9TR3GRgDdlE6GX7plSbcLFFl3k5pGfmBdp1n9edP0w
	rru9M7Mt2Q5A8Brf89yDqYIbY0zeHVyF6D68bnhjluiok31PZ/6VH9Q4uvgWsaM7Q1m+e5I3DflrW
	+/3bUDAyvp13BfPl5nOZgIoEiQRbAOM1wuPhqPhR3gVIjDv+baGLksSZdD2T7B3oR+jvTSyf8oSgU
	dhzIbCByI2dlHz3hSMAUyeMaI2+kbugk7e3C0j/DofiQxLiNlSyleRtqt1mLeY+73NvcBw4LmIfoE
	4RccHrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maDs7-00CCXX-QR; Tue, 12 Oct 2021 09:14:55 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maDs0-00CCTC-IQ
 for ath11k@lists.infradead.org; Tue, 12 Oct 2021 09:14:54 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634030092; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=WVAYj4pWS4vYz8R1uN6oSvdstfUkaZt7waIzqkcgYMk=;
 b=DYsiWiYu2qHAEYWuECkOeGDo8OC8uaS7034TJ8RoZ9wQW3fiDQDIDcbDaDGh/oYAvza1Xgip
 GK8KYhi1YZELc4PaiTAQn/ChzeBitBYttmKtqWJg0Oil0oxWZGJlESd/ZlxrxPJXzpRlK9K3
 QuzZLS88xNl8/zxwploZlOhJCaI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 616551f122fe3a98e5e63c40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 12 Oct 2021 09:14:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 12D72C43616; Tue, 12 Oct 2021 09:14:25 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: bqiang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 709BEC43460;
 Tue, 12 Oct 2021 09:14:24 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 12 Oct 2021 17:14:24 +0800
From: Baochen Qiang <bqiang@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: Advertise PLATFORM_CAP_PCIE_GLOBAL_RESET in qmi
 msg
Message-ID: <13074ee3556a72cd1f235a493c79f202@codeaurora.org>
X-Sender: bqiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_021453_019369_BBCFCCD8 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-10-11 14:30, Kalle Valo wrote:
> Baochen Qiang <bqiang@codeaurora.org> writes:
> 
>> Inform firmware that host is capable of triggering a global reset.
>> This is requested by firmware team.
> 
> Why?
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#answer_to_why

In some scenarios like rmmod/insmod, HW target needs to be completely 
reset. On ARM platforms we can rely on WL_EN pin and other power 
regulators to do this. However on x86 or some third party platforms, 
this has to be done by ath11k host by writing HW register 
PCIE_SOC_GLOBAL_RESET. But the problem is that some HW registers can not 
be cleared/restored. With this flag PLATFORM_CAP_PCIE_GLOBAL_RESET in 
QMI host_cap message, firmware can do some platform specific operations 
to fix this issue.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
