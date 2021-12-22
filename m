Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9A8C433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRguwW2ZvqUHOWkPL0s+a/jC/kBnKdvR5m6vGvTL0Dw=; b=Dxl9OMjltYVbAo
	CgGaoBMbRqMzMGo1hUvNlcL27XCrtB1z3XNI6Ihb5MmDX0EGDn4429k60BQOsyuS5gBzKWzHEgnUg
	lZSGmRmnp9ZiF635vfn5isCBiCq33n7VeNxvNGpwpOvy/s6Hzy/6JZMaVpRavbhm6s5f+E/KxTpmS
	PGPRNRgn4i9G0h44mYa6WIHXMk3wuq1yKzxN/7/8d7icxNeJLxigMfjMszzShOhkKxCJHqC3sZzzS
	HrA1dBR8exG70UoGuT/v5L8S0VaevAoUiAS7aov5Ph2roAnFSqPAkgqtOUdFKcR04GnoSdkPumjEn
	saU5jMG0Sq4bqmAA8rLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzvlA-009RD5-Jr; Wed, 22 Dec 2021 07:10:00 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzvkv-009R7Q-D3
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 07:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1640156985; x=1671692985;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H7Dok7WK0H59Mj54+rSDd7Yj5ML+6uiquMm8Ib7Shlk=;
 b=LKHYYycfG7Mtw3iPYd2iepOLzDcSn3BVIQANVd38VwHHfDC683bcKvr8
 vdbdMO636i0Bj4QcGiG10BcVHgj10T7KavsRk5OSPja7E0GmnS1mMazRX
 20vw5Q9ysYrTudFMVFYycXZtAAO+JMZ753zOCs6knWJQeH5XHcpJUiU6w 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Dec 2021 23:09:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 23:09:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 21 Dec 2021 23:09:39 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 21 Dec
 2021 23:09:38 -0800
Message-ID: <a9c1ed53-d83e-141f-abdf-3a8fe91f142d@quicinc.com>
Date: Wed, 22 Dec 2021 15:09:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] ath11k: free peer for station when disconnect from AP
 for QCA6390/WCN6855
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211215063442.15629-1-quic_wgong@quicinc.com>
 <87a6gu9sy8.fsf@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87a6gu9sy8.fsf@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_230945_523518_4E7320BD 
X-CRM114-Status: UNSURE (   9.71  )
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

On 12/21/2021 6:02 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> Commit b4a0f54156ac ("ath11k: move peer delete after vdev stop of station
>> for QCA6390 and WCN6855") is to fix firmware crash by changing the WMI
>> command sequence, but actually skip all the peer delete operation, then
>> it lead commit 58595c9874c6 ("ath11k: Fixing dangling pointer issue upon
>> peer delete failure") not take effect, and then happened a use-after-free
>> warning from KASAN. because the peer->sta is not set to NULL and then used
>> later.
>>
...
> I still see unknown peer warnings during suspend:
>
> [  506.782421] wlan0: authenticate with xx:xx:xx:xx:xx:xx
> [  506.845984] wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
> [  506.852199] wlan0: authenticated
> [  506.855886] wlan0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
> [  506.862157] wlan0: RX AssocResp from xx:xx:xx:xx:xx:xx (capab=0x431 status=0 aid=2)
> [  506.887866] wlan0: associated
> [  507.603717] igb 0000:05:00.0 eth1: igb: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX
> [  510.610907] PM: suspend entry (deep)
> [  510.611871] Filesystems sync: 0.000 seconds
> [  510.663217] Freezing user space processes ... (elapsed 0.003 seconds) done.
> [  510.668909] OOM killer disabled.
> [  510.670619] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  510.674552] printk: Suspending console(s) (use no_console_suspend to debug)
> [  510.679606] wlan0: deauthenticating from xx:xx:xx:xx:xx:xx by local choice (Reason: 3=DEAUTH_LEAVING)
> [  510.722483] e1000e: EEE TX LPI TIMER: 00000011
> [  510.764835] ath11k_pci 0000:06:00.0: peer-unmap-event: unknown peer id 10
> [  511.374486] ACPI: EC: interrupt blocked
> [  511.440359] ACPI: PM: Preparing to enter system sleep state S3
> [  511.473142] ACPI: EC: event blocked

Hi Kalle,

patch v3 which has sent has fixed the warning "ath11k_pci 0000:06:00.0: 
peer-unmap-event: unknown peer id 10".

...

>>   		ath11k_mac_dec_num_stations(arvif, sta);
>>   		spin_lock_bh(&ar->ab->base_lock);
>>   		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
>>   		if (peer && peer->sta == sta) {
>> -			ath11k_warn(ar->ab, "Found peer entry %pM n vdev %i after it was supposedly removed\n",
>> -				    vif->addr, arvif->vdev_id);
>> +			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
>> +				   "Found peer entry %pM n vdev %i after it was supposedly removed\n",
>> +				   vif->addr, arvif->vdev_id);
> I'm not sure about changing this warning to a debug message, though I
> don't have time to analyse this right now. But what if there's a race
> condition somewhere still?
patch v3 which has sent has changed it back to ath11k_warn().

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
