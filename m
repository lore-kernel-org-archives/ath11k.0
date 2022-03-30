Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22398C433EF
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QxHK3crIs3Kdah9yUQznsRlAFoQ2XlamQD/sRZ55Q8Q=; b=yyUwLBUIC2Rp9o
	/GSbbZ6u5KUL4F4BTVhnCpw7BcTrqaIJQTG/RkmfZfyWl9YXOoREnRB39nu1RMZ8dlLR6cLEpu1Sm
	49vVG2UbJVmo4U+o7pE2LVWYRXIV+MoDrlCVkHDbJYA7HbYHmbUz/d37iTE8vQmheKUXBN3OQsGU7
	lNKobNd+dAcEt8Zin4quJj3bx0akHXSSj3EeuYCCV4iBONfOau6EOJ6woJ0r3lEDLWT6NZuhD7F9h
	TSf6+5vJi/SHP3pqhSagMgvgAClauNY8B8OT/Ioq/Jqn6R7jLd8WRb+giPvcSzZlJpw2TFC0NPqNw
	58mZCDRcIQCBxroX+acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTEX-00EfSC-5r; Wed, 30 Mar 2022 07:59:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTEU-00EfRm-N2
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 07:59:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26A17617A6;
 Wed, 30 Mar 2022 07:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E2EC340EC;
 Wed, 30 Mar 2022 07:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648627149;
 bh=5+woyzDsfK3hKaCYXH65F2mlggFPnKmyw6YLV2QIotY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=KLneqMcStRqDdiHwH8iLShOnJtrp+JCf+NNj9cw+DdNTvncU/pbZQpoogcNlxn6rK
 vsgTcb/VcOH9NlxQa8h73NB8kjYdDfYjyskUpZ/KWN+7RnnJOkIFh+RfIYxDJ7jly5
 JbO2J6cHCo1rBcuwNVjMrDfWnjiXOOnXcee1sZz8ylCFWoi2xsIBOJs2kdirCZzN0n
 0H/2trofY1r2a7riVm2odE9qPG0zfbtzJMCQbZ+c6XYbKqmlx/Qy1MTAUdIgu61TEn
 X5Lwh0QmoeEFE/HEOyD/qDAS+VPI0t1So4S6lTdYpOLp18ea0BuFTocvaASE49Gz+k
 XsLkoJtWvaGUQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 00/12] add support for WCN6750
References: <20220328060937.16738-1-quic_mpubbise@quicinc.com>
 <30e22170-fdc4-cf66-a39b-921b5f89c6e8@quicinc.com>
Date: Wed, 30 Mar 2022 10:59:04 +0300
In-Reply-To: <30e22170-fdc4-cf66-a39b-921b5f89c6e8@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 30 Mar 2022 13:20:06 +0530")
Message-ID: <87tubfx453.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_005910_854031_7B00331C 
X-CRM114-Status: GOOD (  20.40  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> On 3/28/2022 11:39 AM, Manikanta Pubbisetty wrote:
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
>> ---
>> Note:
>> *	Remoteproc driver changes for WCN6750 which takes care of
>> 	downloading the FW and booting of Q6 processor are under
>> 	upstream review.
>> 	Link: https://patchwork.kernel.org/project/linux-remoteproc/cover/1643712724-12436-1-git-send-email-quic_mpubbise@quicinc.com/
>
> Hi Kalle,
>
> It looks like the remoteproc changes have landed in linux-next tree.
> Shall I remove this dependency and resend the series?

Please wait, I want to look at the patchset first and provide comments.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
