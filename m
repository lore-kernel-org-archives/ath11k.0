Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EACC433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ju1hvye/jSwtSaBy3Gp8WZ/BYgLCD9GwHmX76UAAprU=; b=fhCDFC1zJv5MFc
	a6OiEFLHBSxK7rC62IZHF8BqW+qXlbXfS5TOkOEgNHuoh57iUvwbh0o8+4pLeCQoQhJ6T6o/W6UFi
	mbwrLHJuCvpNN0UWKOUIAZ1kf+t8t+ayMij9GmqGJUJRjKllJ2YtYU96ScaTTwwOaF/k6HB3HKLjm
	RZoWbdVdoe07ztOGaeIlRkGFwNLaKEQOwFPrAdxUIZEFUN7at4dfnDsc1EKvkVNssXdIKAY2YhFSS
	9V1JV+hhKrBMpQ9ty31x+sg6/Rn7NbmiBLPjGJh+lyIHqg3j5ZuqNCREwmPhfEbHhHtBKtJDM6FhZ
	QrRwVEvmpMlAja7EtV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njahM-00HWnf-44; Wed, 27 Apr 2022 05:58:48 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njahI-00HWn0-P1
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651039124; x=1682575124;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=44Oitdd6bU/DkMQH+snqOY/4gCm8SnyjNlbVGhy1gLo=;
 b=YbBU/Rcr/khYjPIRGBOLbH6nBpO95gFNhCNFhhEvMGmgPOI6Uxr4N1O4
 aEc91V+PEgedtbcOE5YLpwf/dqD9RXce8Bvk8K1gffX1shLIl7ZOf5Ikr
 9V7oNC1ejKSnZW9vbxz/BbheNkiZIyYbL6mLzXdd3iviCgccE4y8sjXND o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 22:58:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 22:58:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 22:58:44 -0700
Received: from [10.50.15.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 22:58:41 -0700
Message-ID: <c1d7930e-3796-fb65-2cb9-caed131b51e3@quicinc.com>
Date: Wed, 27 Apr 2022 11:28:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 00/12] add support for WCN6750
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <874k2fgjhu.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <874k2fgjhu.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_225844_885856_8DD6950B 
X-CRM114-Status: GOOD (  16.15  )
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

On 4/27/2022 11:23 AM, Kalle Valo wrote:
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
>> An important point to note is that though WCN6750 is a PCIe device,
>> it cannot be attached to any other platform except on Qualcomm
>> Snapdragon SoCs due to the aforementioned reasons.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Manikanta Pubbisetty (12):
>>    dt: bindings: net: add bindings of WCN6750 for ath11k
>>    ath11k: Add HW params for WCN6750
>>    ath11k: Add bus params for WCN6750
>>    ath11k: Add register access logic for WCN6750
>>    ath11k: Fetch device information via QMI for WCN6750
>>    ath11k: Add QMI changes for WCN6750
>>    ath11k: HAL changes to support WCN6750
>>    ath11k: Datapath changes to support WCN6750
>>    ath11k: Do not put HW in DBS mode for WCN6750
>>    ath11k: WMI changes to support WCN6750
>>    ath11k: Update WBM idle ring HP after FW mode on
>>    ath11k: Add support for WCN6750 device
> 
> Due to the bus_params problem I had to drop most of the patches, but I
> did keep few of them in the pending branch to reduce the patchset size:
> 
> 495a15b1969a ath11k: Update WBM idle ring HP after FW mode on
> 8d121dacbe35 ath11k: WMI changes to support WCN6750
> e31091e06011 ath11k: Do not put HW in DBS mode for WCN6750
> 
> Please submit v6 only after I have applied these, I'm waiting for some
> build testing first.
> 

Sure Kalle, thanks!!

Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
