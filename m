Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23157C433EF
	for <ath11k@archiver.kernel.org>; Fri, 25 Feb 2022 05:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7ENRJzSInXjrv0gLjRq6PCGOva9GaGl17V1qKg7aaw=; b=Zc9Mj4Ckivd9TE
	b9EG/AB+rBBE5tPTgaqIL7xLenRJWf3YsvqvjWal7mhSQGd7pkkVxOLNNmfpxPDrWTLhDKjfaM9Mp
	2dLZgHVbxnXZBOMKu11N8siS7DTFPt5gzpJnChLGyeYzPeAKXPwBOCrEe0UITaprHheVHsnZ6k2on
	S32tJzwGLXxYkJXUJyrjMIncFdn1LKoz7ciEvwXrxGU+rpRwmYUxF/NjwcsH68svxMvgfIDLxq3ui
	0EL9RPLGhPg+jrTGVV2Y+66OX5G+urfiYgBZxyOLzN6Te8n/4Xp1gtRpMh0LXmCD/gP7NV7vHh8kl
	YCEgNGr3+/yo8HDiXPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNTVB-003N8J-Ga; Fri, 25 Feb 2022 05:50:49 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNTV9-003N7m-4w
 for ath11k@lists.infradead.org; Fri, 25 Feb 2022 05:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645768247; x=1677304247;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ym6OTnxseorW8cS3VLj8xkqARTJwvANZ11x0wPsNmEs=;
 b=EOAjTgSGHYAGuhAWnocwUHxD0HXm81BZx5VZOHj/oePeMVQ1REiu3/yq
 7oNzTBv9NjYBv1oJqaNbN5Kq0j0FsLH2nzaqBC6cqW7Sh3xnuxAO9r8xG
 PEz24urnbEHfHXmb0fy9ckgqtt4iWMy4xeRh6Jn6dLGa33oA4+emig8/q I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Feb 2022 21:50:45 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 21:50:44 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 21:50:44 -0800
Received: from [10.216.32.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 21:50:41 -0800
Message-ID: <41f8fd92-70e4-def6-0bd1-c764b1445d68@quicinc.com>
Date: Fri, 25 Feb 2022 11:20:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 02/19] ath11k: Refactor PCI code to support hybrid bus
 devices
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
 <87ee4sgo7l.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <87ee4sgo7l.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_215047_284118_536BE32C 
X-CRM114-Status: GOOD (  21.45  )
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

On 1/28/2022 3:46 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Unlike other ATH11K PCIe devices which are enumerated by APSS
>> processor (Application Processor SubSystem), WCN6750 gets
>> enumerated by the WPSS Q6 processor (Wireless Processor SubSystem);
>> In simple terms, though WCN6750 is PCIe device, it is not attached
>> to the APSS processor, APSS will not know of such a device being
>> present in the system and therefore WCN6750 will be registered as
>> a platform device to the kernel core like other supported AHB
>> devices.
>>
>> WCN6750 uses both AHB and PCI APIs for it's operation, it uses
>> AHB APIs for device probe/boot and PCI APIs for device setup
>> and register accesses; Because of this nature, it is referred
>> as a hybrid bus device.
>>
>> Refactor PCI code to support hybrid bus devices like WCN6750.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> 
> [...]
> 
>> --- a/drivers/net/wireless/ath/ath11k/Makefile
>> +++ b/drivers/net/wireless/ath/ath11k/Makefile
>> @@ -29,7 +29,7 @@ obj-$(CONFIG_ATH11K_AHB) += ath11k_ahb.o
>>   ath11k_ahb-y += ahb.o
>>   
>>   obj-$(CONFIG_ATH11K_PCI) += ath11k_pci.o
>> -ath11k_pci-y += mhi.o pci.o
>> +ath11k_pci-y += mhi.o pci.o pci_cmn.o
> 
> So the end result looks like this:
> 
> obj-$(CONFIG_ATH11K_AHB) += ath11k_ahb.o
> ath11k_ahb-y += ahb.o pci_cmn.o
> 
> obj-$(CONFIG_ATH11K_PCI) += ath11k_pci.o
> ath11k_pci-y += mhi.o pci.o pci_cmn.o
> 
> Linking pci_cmn.o to both ath11k_pci.ko and ath11k_ahb.ko looks wrong.
> Does that even compile if ath11k is linked to the kernel, eg. with
> allyesconfig?
> 

I did try compiling the kernel with allyesconfig after your comment, 
compilation went through without any hiccups.

> One way to solve is to link pci_cmn.o to ath11k.ko. But for another
> approach, for a long time I have been thinking about what's the point to
> have separate ath11k_pci.ko and ath11k_ahb.ko modules?,They are very
> small anyway compared to ath11k.ko. So my ideais that should we have
> just one ath11k.ko module, it contains all AHB and PCI code as well, and
> ath11k_pci.ko and ath11k_ahb.ko would not be created anymore. It would
> simplify things a bit, especially here.
> 
> Thoughts?
> 

I see some concerns going with single module combining both AHB and PCI 
modules into ath11k.ko

1) AHB and PCI drivers make use of completely different kernel 
frameworks, for example AHB driver needs remoteproc APIs for booting and 
require CONFIG_REMOTEPROC to be compiled in to the kernel. Similarly, 
PCI driver needs MHI APIs and also dependent on CONFIG_PCI. Both MHI and 
PCI bus frameworks need to be compiled for PCI to work. If we club all 
of this into single module, I see that unnecessarily additional modules 
will be compiled into the kernel which IMO is not so good idea.


2) Secondly, there is high chance of writing bad code all over the 
driver. For example, there are chances that developers put AHB/PCI 
specific code all over the driver creating a big mess.
Though this can be avoided with stringent code review, but why to
give the chance.

Though AHB and PCI drivers are smaller in size, IMHO let AHB and PCI be 
independent drivers, code looks cleaner and properly segregated by 
keeping them as it is today.

Regarding the compilation of PCI common code, shall we move it into 
ath11k.ko? What is your opinion on this.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
