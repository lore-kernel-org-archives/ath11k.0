Return-Path: <SRS0=GJml=HS=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776D0C433DB
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 16:37:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0ED64E10
	for <ath11k@archiver.kernel.org>; Tue, 16 Feb 2021 16:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0ED64E10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WG21RYc9qUJE3mrDTjUoUeCSzMP5XILgVQbCkEJznNU=; b=cwhCX+yL19wjVVef6U447cy93
	7Ck342nSWjbCwDTp8a89kfvq1c06LxeRwcHuIsShX/rwIv48EH7BGHmAnXlEggwV2Xnt/8/dUY5CC
	Uia3Limg6oOZUOBUbI4o40XyopN3Kukmu8mCjOciKwid6GzoF60wlizZXSG7XT0CUV8UkDSnHAUeT
	bpNAcAKCAE2Ls7s3PhHggY1xciFS5M6WUTxGIo7B6NStlyMpznUHAuWR1KEWtcduUSQn0pkoa/q9h
	TKvJIVNnW3jCU2tVx9ZQp7qsfNrvD4WUVO00ogCFa8ISxqDv6f+0+diAraYS/qTMqdpbIyd3uYo63
	DVt9EvALg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3LP-0003zt-DQ; Tue, 16 Feb 2021 16:36:59 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3LN-0003zK-E3
 for ath11k@lists.infradead.org; Tue, 16 Feb 2021 16:36:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613493416; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=CdYvfmPYYINxLli89m+5gs/J3wf3B6ct7MojvVUEhVU=;
 b=OA1XRZ482gp6+xM72JAO/Eva7qxedjEaZYT87Jp5xvxVF1iC5kCkuw8d5WpnWh9W4tYAtuzl
 QP3j+w3KqsS7+rf86hHo87nLgQ+coguoqPs1wZ6Rytvu9+6hkMnF12VNtbPe7X/vlIqgk9Nw
 HaJsE6jbgm7fzfPchXn8VOVvKrw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602bf4a4fe1d3964381e38c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 16:36:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1582EC43463; Tue, 16 Feb 2021 16:36:52 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 87A4FC43462;
 Tue, 16 Feb 2021 16:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 87A4FC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Subject: Re: [PATCH 11/11] ath11k: add qcn9074 pci device support
References: <1612946530-28504-1-git-send-email-akolli@codeaurora.org>
 <1612946530-28504-12-git-send-email-akolli@codeaurora.org>
Date: Tue, 16 Feb 2021 18:36:48 +0200
In-Reply-To: <1612946530-28504-12-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Wed, 10 Feb 2021 14:12:10 +0530")
Message-ID: <87mtw4q89r.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_113657_593848_1A57DFAA 
X-CRM114-Status: GOOD (  19.57  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> QCN9074 is PCI based 11ax radio.
> 	- has 2G/5G/6G variants.
> 	- has NSS 2x2 and 4x4 variants.
>
> QCN9074 uses 45MB of HOST DDR memory, target requests host memory in
> segments, each segment is of 2MB size and is physcial contiguous and
> use static window configuration.
>
> Below QMI issues are seen with QCN9074,
> Issue 1:
>  ath11k_pci 0000:06:00.0: qmi failed memory request, err = -110
>  ath11k_pci 0000:06:00.0: qmi failed to respond fw mem req:-110
> Issue 2:
>  ath11k_pci 0000:06:00.0: firmware crashed: MHI_CB_SYS_ERROR
>  ath11k_pci 0000:06:00.0: qmi failed set mode request, mode: 0, err = -110
>  ath11k_pci 0000:06:00.0: qmi failed to send wlan fw mode:-110

I clarified the commit log to mention that QCN9074 is not fully working
yet.

> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1.r2-00012-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index 70dcb80475b1..259a39e59a91 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -34,10 +34,12 @@
>   */
>  #define ACCESS_ALWAYS_OFF 0xFE0
>  
> -#define QCA6390_DEVICE_ID		0x1101
> +#define QCA6390_DEVICE_ID              0x1101

Here you convert tabs to spaces, I fixed them back.

> +#define QCN9074_DEVICE_ID              0x1104

And modified this to use tabs as well.

>  static const struct pci_device_id ath11k_pci_id_table[] = {
>  	{ PCI_VDEVICE(QCOM, QCA6390_DEVICE_ID) },
> +	{ PCI_VDEVICE(QCOM, QCN9074_DEVICE_ID) },

I removed this and added a comment instead. Let's add the pci id once
the device is fully working.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
