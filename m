Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37380C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 06:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HJcQDHQh+hup+GEIFZzpJpDoLHoNYNBk5j8aBUD5PA=; b=eCBconVSZUn5/m
	mv4aourPSYg9KSb7kYfPy1gslfTi0BhEPW9NiHCfSrwdC3L+DFBdVxnAJT3XZJb3GmBZW+Dn7eaAp
	qAo7KGT9bMi8ylNI2ljXzDL9NSDPXNH4Eus0Bg6bQNaD7cUvZAu3C2ivb/QMcqwkm2u0MvArd2xN5
	0tXpFvXKEmI07GUwVceXKmii3t8DHQ4HZAdsgyOjoszBhWTt5R+qQnqXPgynX9djXAe0/Xr/9S2nK
	j6bVRPAhY3EqumWVyHD8YKD5iie/vyTkyNHa5KvZFSqU4ZptgJt1/64U8vS/fj4UexBzw4Zj4R4S3
	ZJyS9jDfP8eaVfs5Go4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM2FI-003i5O-DB; Mon, 21 Feb 2022 06:32:28 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM2Cf-003h9I-PF
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 06:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645424985; x=1676960985;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dXYD8eWi1+Io0cIGkxMhaeSzOKmEOR73lAviKQy1nXM=;
 b=TyrvO5zvAYiVtvD7W0JZhx798zc5Oe84FsAkgwbFC11ZlZecwWWEM0kL
 AM46SSMOkOjAabs9TNJ5tOXh3MySiFZ6rYZnkJ3c9QU8X5BxF6P8ij6FL
 pLL/FPYJ3J33RGLFwKFTVT6p7tbYrwbG0fO2IpVHBHormShBHv1lFlBlA M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Feb 2022 22:29:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 22:29:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 20 Feb 2022 22:29:41 -0800
Received: from [10.216.7.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Sun, 20 Feb
 2022 22:29:38 -0800
Message-ID: <f3704567-f269-c836-2880-e953c4abb872@quicinc.com>
Date: Mon, 21 Feb 2022 11:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/19] add support for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <87ilu4gomd.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87ilu4gomd.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_222945_941934_C638BBD0 
X-CRM114-Status: GOOD (  22.95  )
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

On 1/28/2022 3:37 PM, Kalle Valo wrote:

> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>
>> WCN6750 is non-DBS 2x2 11AX chipset. Unlike QCA6390/WCN6855 which
>> are DBS (dual band simultaneous) solutions (2 LMACs), WCN6750 has a
>> single LMAC supporting 2G, 5G and 6G bands. It can be operated only
>> on one band at any given point.
>>
>> WCN6750 is a PCIe device. Unlike other supported ATH11K PCIe devices
>> which are directly attached to APSS (Application Processor SubSystem),
>> WCN6750 is not attached to APSS, it is attached to the WPSS
>> (Wireless Processor SubSystem) Q6 processor, the FW which runs on the
>> Q6 processor will enumerate the PCIe device. Since APSS is unaware of
>> such a device, it has to be registered as a platform device(AHB) to the
>> kernel for device probing. Like other AHB devices, remoteproc APIs are
>> used to boot up or shutdown of WCN6750.
>>
>> WCN6750 uses both AHB and PCIe ATH11K APIs for it's operation.
>> It uses AHB APIs for device probe and booting of the remote processor.
>> Once device is booted up, it uses ATH11K PCIe APIs for initialization
>> and register access. Hence, it is referred as hybrid bus device in
>> the rest of this series.
>>
>> Since the chip is enumerated by WPSS Q6, device information like
>> BAR and BAR size is not known to the APSS processor. A new QMI message
>> called device info QMI request will be sent to the target for fetching
>> these details.
>>
>> STA and AP modes are supported; Basic connectivity and ping are
>> verified in both the modes.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Note:
>> *	Remoteproc driver changes for WCN6750 which takes care of
>> 	downloading the FW and booting of Q6 processor are under
>> 	upstream review.
>> 	Link: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=582475
> This is a very good overview, thanks for that. But I think something
> which is not clearly mentioned here is that this only works on Qualcomm
> Snapdragon SoC, right?

You are absolutely right.

>   So even though WCN6750 is a PCI device, it cannot
> be attached to any platform. It would be good to emphasise that.

I'll add this detail in the next revision.

>> Manikanta Pubbisetty (19):
>>    ath11k: PCI changes to support WCN6750
>>    ath11k: Refactor PCI code to support hybrid bus devices
>>    ath11k: Choose MSI config based on HW revision
>>    ath11k: Refactor MSI logic
>>    ath11k: Remove core PCI references from PCI common code
>>    ath11k: Add HW params for WCN6750
>>    ath11k: Add bus params for WCN6750
>>    ath11k: Add register access logic for WCN6750
>>    ath11k: Fetch device information via QMI for WCN6750
>>    ath11k: Add QMI changes for WCN6750
>>    ath11k: HAL changes to support WCN6750
>>    ath11k: Datapath changes to support WCN6750
>>    ath11k: Fix RX de-fragmentation issue on WCN6750
>>    ath11k: Do not put HW in DBS mode for WCN6750
>>    ath11k: WMI changes to support WCN6750
>>    ath11k: Update WBM idle ring HP after FW mode on
>>    ath11k: Add support for WCN6750 device
>>    ath11k: Add support for targets without trustzone
>>    dt: bindings: net: add bindings of WCN6750 for ath11k
> 19 patches is a lot to chew on in one go, my recommendation is to have
> max 10-12 patches per set.
>
> In this case having three patchsets would make it a lot easier for
> reviewers, but not sure how to split them. Maybe you could submit these
> patches separate for preparing WCN6750 support, after a quick look they
> seem pretty independent:
>
>    ath11k: Fetch device information via QMI for WCN6750
>    ath11k: HAL changes to support WCN6750
>    ath11k: Fix RX de-fragmentation issue on WCN6750
>    ath11k: Do not put HW in DBS mode for WCN6750
>    ath11k: WMI changes to support WCN6750
Sure, I'll logically split the series in the next revisions.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
