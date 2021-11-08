Return-Path: <SRS0=XEXT=P3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E96C433F5
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 13:16:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F5566124D
	for <ath11k@archiver.kernel.org>; Mon,  8 Nov 2021 13:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F5566124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CC3iUm27/yjkdglaFgLmVa/CiOUd9Hy8bLMjIA8ay0Y=; b=G9ibQqN7mZxNj7
	3y623m5SokLUoZOFN3tLomn4su9BxxE9Qa5QWjPzZhgh1NboogmnQ9vluXMnWFdiHLX6oWY7ll4sC
	pJmWgstlNiuE5qdWkSmixKKMvQu6lFMz3tErqbGdAh9Bwb6UwA3LE6nQ6eW1KmRqrNZgmSRAS2xFK
	ZfDpGxhPrUB60r/iGlzhMiQ1f+NvHLTg1Z+hANS5FlOj9hKvIcoxu1gzgPn/2PWEGqDi+XE4uXxA+
	1AqHT3Z6k+qAfSWLyGiotrNSPk//wcuik6LUxciWeVHB24dgV/YDY1t7uyC7k42/hip6m135xSFXU
	cNfIlE3T3Gl1oQwUIjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk4VB-00GTSY-W4; Mon, 08 Nov 2021 13:15:58 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk4V6-00GTRc-BH
 for ath11k@lists.infradead.org; Mon, 08 Nov 2021 13:15:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636377353; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=A1GF7ciAhzKFLhXNoAxvAUsh4dNzJRLyoFWA/HdTu3Y=;
 b=EQYRfJ9dYR9jk+4ZKHa9+e65s3t798J0h1/9IKdX4KgWEmk+BL4Z9fNxgBvpQTf++MvjzbK5
 yeajx5W9AHayHrNVRc3a2n6Ews/QaVLb1O8o3McldrzKNLASoESBYB1dqDH6oIeYj3lz9nGu
 iRrY8HFVQ6CMCSKfGdeAKmza7fY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 618923069198e3b2569ed7ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 13:15:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8B528C4360C; Mon,  8 Nov 2021 13:15:50 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EBE9CC4338F;
 Mon,  8 Nov 2021 13:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EBE9CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH] ath11k: add string type to search board data in
 board-2.bin for WCN6855
References: <20210913181131.194024-1-jouni@codeaurora.org>
Date: Mon, 08 Nov 2021 15:15:44 +0200
In-Reply-To: <20210913181131.194024-1-jouni@codeaurora.org> (Jouni Malinen's
 message of "Mon, 13 Sep 2021 21:11:31 +0300")
Message-ID: <87mtmepz3z.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_051553_373578_87C2FE4B 
X-CRM114-Status: GOOD (  22.78  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Wen Gong <wgong@codeaurora.org>
>
> Currently ath11k only support string type with bus, chip id and board id
> such as "bus=ahb,qmi-chip-id=1,qmi-board-id=4" for ahb bus chip and
> "bus=pci,qmi-chip-id=0,qmi-board-id=255" for PCIe bus chip in
> board-2.bin. For WCN6855, it is not enough to distinguish all different
> chips.
>
> This is to add a new string type which include bus, chip id, board id,
> vendor, device, subsystem-vendor and subsystem-device for WCN6855.
>
> ath11k will first load board-2.bin and search in it for the board data
> with the above parameters, if matched one board data, then download it
> to firmware, if not matched any one, then ath11k will download the file
> board.bin to firmware.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 27 ++++++++++++++++++++------
>  drivers/net/wireless/ath/ath11k/core.h | 13 +++++++++++++
>  drivers/net/wireless/ath/ath11k/pci.c  | 10 ++++++++++
>  drivers/net/wireless/ath/ath11k/qmi.h  |  3 +++
>  4 files changed, 47 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index 8f09ae827170..a8c6f7cf33d5 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -406,11 +406,26 @@ static int ath11k_core_create_board_name(struct ath11k_base *ab, char *name,
>  		scnprintf(variant, sizeof(variant), ",variant=%s",
>  			  ab->qmi.target.bdf_ext);
>  
> -	scnprintf(name, name_len,
> -		  "bus=%s,qmi-chip-id=%d,qmi-board-id=%d%s",
> -		  ath11k_bus_str(ab->hif.bus),
> -		  ab->qmi.target.chip_id,
> -		  ab->qmi.target.board_id, variant);
> +	switch (ab->id.bdf_search) {
> +	case ATH11K_BDF_SEARCH_BUS_AND_BOARD:
> +		scnprintf(name, name_len,
> +			  "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x,qmi-chip-id=%d,qmi-board-id=%d%s",
> +			  ath11k_bus_str(ab->hif.bus),
> +			  ab->id.vendor, ab->id.device,
> +			  ab->id.subsystem_vendor,
> +			  ab->id.subsystem_device,
> +			  FIELD_GET(ATH11K_CHIP_ID_MASK, ab->qmi.target.chip_id),
> +			  ab->qmi.target.board_id & 0xFF,

Why are chip_id and board_id masked? Why cannot we use values directly
provided by the firmware?

And if we need to mask those, it's better to do them in qmi.c where they
are stored:

	if (resp.chip_info_valid) {
		ab->qmi.target.chip_id = resp.chip_info.chip_id;
		ab->qmi.target.chip_family = resp.chip_info.chip_family;
	}

	if (resp.board_info_valid)
		ab->qmi.target.board_id = resp.board_info.board_id;
	else
		ab->qmi.target.board_id = 0xFF;

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
