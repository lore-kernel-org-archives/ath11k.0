Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DF6C433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 15:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2415460EFE
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 15:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2415460EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VKWaYHQCcRvDD7W3pjh/FJkl4JsyIoR59Al1uiqbAQ=; b=q0GYEV7patFWGJ
	T3NQ9aZ/b89HuBv554uFDY65tgunpDgs7kf4MgdZf/kthyS2HIn4EAn8ez4VV6vc1iXNyLMQQf2qC
	rvKa64fBdqD8/FOIskipl7fPy6+H8pD7ZTnaT5uLRFARdssXCfVuZeRn1Mx0pQindS08QpVUezKT/
	QzBuWeFMZtJ/uM3VPothQhSf8lYbssjSrernTfY9bhnpC3NO8BdXoXvqqp1USXyg8ntZ2PYRqgQrT
	OAQZ46OCJhPaHmLQ0HPbWYy4SvWynClq3RrdqNLxe+YOD0ah7cKKK4W717nXy5rM/9RN8hi89VBlc
	9h9yxSxIw3ZdF1pCkdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwyL-009tqT-LB; Mon, 11 Oct 2021 15:12:13 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwyI-009toz-Oj
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 15:12:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633965128; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ax258dGkFHdlEtg7gdzITAbzaEoTc1TinVq+aehmmo0=;
 b=Jr8c7qdGhOR3mtBfmtraR7JCLn7cyZk9PSQ/ll0JLnaPuVIh1oZsgczBW4AzN63IiOXStl9X
 w1fW6EO++BvmNRxJB5y3OFNVm/4QYh1Mq2y9ySJTMwER5YrB2MZM5cfHqdSWgAhPSCd7nHZb
 lK+FVz+cr0JqwdCO1EevIxik1ow=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61645435ff0285fb0a53caa6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 15:11:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E1F0C43460; Mon, 11 Oct 2021 15:11:49 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CEBAC4338F;
 Mon, 11 Oct 2021 15:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8CEBAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] ath11k: Handle MSI enablement during rmmod and SSR
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210913180246.193388-5-jouni@codeaurora.org>
References: <20210913180246.193388-5-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163396510235.19083.7350385840200082489.kvalo@codeaurora.org>
Date: Mon, 11 Oct 2021 15:11:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_081210_908222_53521AE0 
X-CRM114-Status: GOOD (  11.45  )
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

> When doing "rmmod ath11k_pci", ath11k performs global SOC reset
> and MHI reset, where 0 address access is captured by IOMMU. See
> log below:
> 
> ...
> [  133.953860] ath11k_pci 0000:02:00.0: setting mhi state: DEINIT(1)
> [  133.959714] ath11k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0x0 flags=0x0020]
> [  133.973854] ath11k_pci 0000:02:00.0: MHISTATUS 0xff04
> [  133.974095] ath11k_pci 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0x0 flags=0x0020]
> ...
> 
> This issue is also observed in SSR process, cause a similar
> sequence as above is performed.
> 
> Such an invalid access occurs because, during rmmod or SSR, MSI
> address is cleared but HW MSI functionality not disabled, thus HW
> target is able to raise an MSI transaction with 0 as MSI address.
> 
> So it can be fixed by simply disabling MSI before reset. For SSR,
> since MSI functionality is still needed after target is brought
> back, we need to reenable it.
> 
> Also change naming of some interfaces related.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

96527d527b27 ath11k: Handle MSI enablement during rmmod and SSR

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210913180246.193388-5-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
