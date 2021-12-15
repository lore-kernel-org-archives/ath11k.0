Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68BFC433EF
	for <ath11k@archiver.kernel.org>; Wed, 15 Dec 2021 02:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdhY83teoLX2OQdicPGdg+kewiOXDu37mwI7heeipco=; b=ouu44+jHCSB3gOaV6XGKbk28h/
	q8CtPTgxGMHcHvG5jnEZF9ZRimraJApgDluSkr6emenrm9s1c/+0oO07cXLATfdkqo8aqC5uK6OKN
	xlCMsYUb7gnRSD/642uUj1dA/mjNXaUIup2t2TtVblg/AkC4IBH5AuFH/YSK1XUmRoqwNb01gl6n9
	QkNmG3G5zLz/bdJp4ZTNNoM0JZlitfI1i59ePA6tvUZBnqSsonV+lH+g+bE3BKoxQni0ycP9LuQ2h
	42HyhIwXWrx3k1Mb9/bqnSrjAHHNxb8oCwTQKj7LljMHS3hDX0XK9qCmixPMjt3p8PMoyoud4fduf
	1Pj6sVvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxKJc-00GSJZ-TS; Wed, 15 Dec 2021 02:46:48 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxKJa-00GSIj-9i
 for ath11k@lists.infradead.org; Wed, 15 Dec 2021 02:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1639536406; x=1671072406;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qjh5IH0gbJaORXiYlwQGGRIxp4q1ofgr0uaexJCSsIM=;
 b=ArGDAKNlUg9MOOx6ZRVK0yRjADeq5ptb5FUhKuT5MSAoUIAsano3xxz6
 RT8GyAUDJY8r6TRH98Jkcd1KQAwYQDufQaN7eXLrfE44J2MrA71Xl4KY4
 fFw/ANYzv+k7HsYkYEOW8kyTjUBSmM7kZy319+FSZPfJC3nxEr4KK8uwj I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Dec 2021 18:46:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 18:46:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 14 Dec 2021 18:46:43 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 14 Dec
 2021 18:46:41 -0800
Message-ID: <a02c79da-17da-9b9a-6c09-1cd7b6696427@quicinc.com>
Date: Wed, 15 Dec 2021 10:46:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: ath11k: firmware variants for WCN6855 v2
Content-Language: en-US
To: Sven Eckelmann <sven@narfation.org>, <ath11k@lists.infradead.org>, Chun Wu
 <chunwu@qti.qualcomm.com>
References: <3348649.btbF5x2DtX@ripper>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <3348649.btbF5x2DtX@ripper>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_184646_407228_23E29015 
X-CRM114-Status: GOOD (  12.35  )
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

On 12/14/2021 9:37 PM, Sven Eckelmann wrote:
> Hi,
>
> the EmWicon WMX7205 (Milan) seems to have a special board.bin from the
> manufacturer. But when using it, the firmware seems to crash:
>
>      [   10.710206] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 0xd0000000-0xd01fffff 64bit]
>      [   10.819230] ath11k_pci 0000:01:00.0: MSI vectors: 1
>      [   10.840305] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
>      [   12.234095] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
>      [   12.242991] ath11k_pci 0000:01:00.0: fw_version 0x110c0b4c fw_build_timestamp 2021-11-24 04:24 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>      [   12.271180] ath11k_pci 0000:01:00.0: qmi failed to load CAL data file:cal-pci-0000:01:00.0.bin
>      [   12.520852] ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_SYS_ERROR
>      [   22.333795] ath11k_pci 0000:01:00.0: failed to wait board file download request: -110
>      [   22.341751] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
>      [   22.347921] ath11k_pci 0000:01:00.0: failed to load board data file: -110
>
> But they also provided a firmware which doesn't end with
> QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 but with QCAHSPSWPL_V2_SILICONZ_CE-1. This
> firmware doesn't seem to crash with their board.bin.
>
> Does anybody know whether the firmware QCAHSPSWPL_V2_SILICONZ_CE-1 (which
> cannot be found in Kalle's repository) is actually meant to work with ath11k?
> At least from past experience (with HK01), I know that the firmware for the
> proprietary driver is not meant to be used for ath11k and caused interesting
> crashes.

As I know, the firmware 
WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 has validation for 
the board data file.

And the special board.bin did not pass the validation, so firmware crashed.

>
> Kind regards,
> 	Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
