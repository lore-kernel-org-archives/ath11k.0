Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC8C433F5
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 07:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fafWOxtJISU0VjlkueCtqpY8k662yT9HwSDyngbvVEQ=; b=L14VkQE632GKyX
	Oij5q+krQVzcbX2WEvkR0WmRcHnhM6tRyMxnE6IcpD6uJh2sYb2fsFCavQ1dS+xCBEJoh2Eo+MggM
	6poYtn9/937YMoaThWnTT4pp2jNFzzIfQTSRwwuLodg+F5djcMgCNPg4VBo4zzZ9YQpvyrhBUmsvg
	4kAU4t80iavnp5wpCAJspYySDoGe88K/RG3eqVimZL8tvcYQ1G2UsZCgABO8f777DvvXJXFzP9Iio
	1m1T63+r2E5xkKZ3JKyfDllIgWqIsTGDFu7ni8Op2JP76pgmIBFYlNm32jxrkR+gp+3mxB0yeCEzL
	aGItE4sF6Q/SUeDqbKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZT5t-00EeXR-RT; Wed, 30 Mar 2022 07:50:17 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZT5q-00EeWT-Em
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 07:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648626614; x=1680162614;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u/nT8YVsKsmr7Ini2Bd+sBRW7SVZCd1ouseI9s1ePh8=;
 b=FOj70ERbVaCrMySfOFBv6fWfkeZL3iVfbTP9YaAHRIBBKKk4xMaCTpF+
 xev3eUnkDDukeYTRo6mjTgCiXfZIm7Vyyecrg2g/CDzKOB67MKBCO+ErE
 Z1h9i0sAGtfwZlQgeSLKFHNWZw6/BizJ3G7aXdw9qWJ9pxD591srJ5PsP M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 30 Mar 2022 00:50:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 00:50:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 30 Mar 2022 00:50:11 -0700
Received: from [10.50.50.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 30 Mar
 2022 00:50:09 -0700
Message-ID: <30e22170-fdc4-cf66-a39b-921b5f89c6e8@quicinc.com>
Date: Wed, 30 Mar 2022 13:20:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 00/12] add support for WCN6750
Content-Language: en-US
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_005014_570545_803D74C7 
X-CRM114-Status: GOOD (  18.98  )
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

On 3/28/2022 11:39 AM, Manikanta Pubbisetty wrote:
> WCN6750 is non-DBS 2x2 11AX chipset. Unlike QCA6390/WCN6855 which
> are DBS (dual band simultaneous) solutions (2 LMACs), WCN6750 has a
> single LMAC supporting 2G, 5G and 6G bands. It can be operated only
> on one band at any given point.
> 
> WCN6750 is a PCIe device. Unlike other supported ATH11K PCIe devices
> which are directly attached to APSS (Application Processor SubSystem),
> WCN6750 is not attached to APSS, it is attached to the WPSS
> (Wireless Processor SubSystem) Q6 processor, the FW which runs on the
> Q6 processor will enumerate the PCIe device. Since APSS is unaware of
> such a device, it has to be registered as a platform device(AHB) to the
> kernel for device probing. Like other AHB devices, remoteproc APIs are
> used to boot up or shutdown of WCN6750.
> 
> WCN6750 uses both AHB and PCIe ATH11K APIs for it's operation.
> It uses AHB APIs for device probe and booting of the remote processor.
> Once device is booted up, it uses ATH11K PCIe APIs for initialization
> and register access. Hence, it is referred as hybrid bus device in
> the rest of this series.
> 
> Since the chip is enumerated by WPSS Q6, device information like
> BAR and BAR size is not known to the APSS processor. A new QMI message
> called device info QMI request will be sent to the target for fetching
> these details.
> 
> STA and AP modes are supported; Basic connectivity and ping are
> verified in both the modes.
> 
> An important point to note is that though WCN6750 is a PCIe device,
> it cannot be attached to any other platform except on Qualcomm
> Snapdragon SoCs due to the aforementioned reasons.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Manikanta Pubbisetty (12):
>    dt: bindings: net: add bindings of WCN6750 for ath11k
>    ath11k: Add HW params for WCN6750
>    ath11k: Add bus params for WCN6750
>    ath11k: Add register access logic for WCN6750
>    ath11k: Fetch device information via QMI for WCN6750
>    ath11k: Add QMI changes for WCN6750
>    ath11k: HAL changes to support WCN6750
>    ath11k: Datapath changes to support WCN6750
>    ath11k: Do not put HW in DBS mode for WCN6750
>    ath11k: WMI changes to support WCN6750
>    ath11k: Update WBM idle ring HP after FW mode on
>    ath11k: Add support for WCN6750 device
> ---
> Note:
> *	Remoteproc driver changes for WCN6750 which takes care of
> 	downloading the FW and booting of Q6 processor are under
> 	upstream review.
> 	Link: https://patchwork.kernel.org/project/linux-remoteproc/cover/1643712724-12436-1-git-send-email-quic_mpubbise@quicinc.com/

Hi Kalle,

It looks like the remoteproc changes have landed in linux-next tree. 
Shall I remove this dependency and resend the series?

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
