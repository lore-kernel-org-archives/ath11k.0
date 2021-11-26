Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B403C433EF
	for <ath11k@archiver.kernel.org>; Fri, 26 Nov 2021 03:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8OrvLzt0stVceXiRZsS4OiLz9AZAL3Zu1Ykx2yJDlw=; b=mnJl9mL03u6K1I
	Ao2ET+tLr46Ttfg5aAOl/cp8vBj/B/5JgEZDHwTI6rkOCQVQRiMSecGEwbc3qRy4aYuXdvyamTEiC
	8K7D8b8/4SA2sYPxlYQ0PP3TsdB4WUyCX4HDq77k1thhVu9/NrGz002RsAPhPpDYVa32faEcMCfD+
	ByNxkwRkoLT/I7hrpCaFzAp3n8dr3dlykeOn5gTDI76mYPBkBoU1wWnz3hVswErI/+OWgtz3DtFDB
	4QckAl399UHrI33wPvQRJcDElKF79et7SR6kiviOE2RRK//wOCZULPOYJR2Mo8Vom/xNqllUplzQM
	zVTjMXznrJ5EXO/rqhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqRys-00982c-0H; Fri, 26 Nov 2021 03:32:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqRyp-00981X-40
 for ath11k@lists.infradead.org; Fri, 26 Nov 2021 03:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637897575; x=1669433575;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0IhZ8UJB7i6Tr0soNrmMZPqHEAbchv6aLfa3KGn+V/E=;
 b=Nn+omszdf41FFmP9UO7qBxNe2VEJdk7iw2yVZaxuG177egy+3BBYfqVM
 I1Wqvzq+2gnJaBKrerrFphSw8x+4urP9e/hdLBfsxiDn4C1raR3HEWr4v
 tS/hmlvHr5aZVr5r2N0aInIQgwbUEsy5DYtZBXSD547yb/MHpkIolBo+A M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 25 Nov 2021 19:32:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 19:32:48 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 25 Nov 2021 19:32:48 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 25 Nov
 2021 19:32:46 -0800
Message-ID: <f19a7d40-02a4-f651-44c6-2e8f0c14ce9f@quicinc.com>
Date: Fri, 26 Nov 2021 11:32:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] ath11k: add wait operation for tx management packets
 for flush from mac80211
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20211118095254.7916-1-quic_wgong@quicinc.com>
 <871r389ycu.fsf@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <871r389ycu.fsf@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_193255_286334_A195382B 
X-CRM114-Status: GOOD (  11.33  )
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

Hi Kalle,

I have found the reason.

I will send new version to fix it.

It is because commit c0b0d2e87d91ce283c8766b4b3c2ec9ac90ebf96 (ath11k: 
Increment pending_mgmt_tx count before tx send invoke) which commit at 
Nov 15 11:25:52 2021.

And my rebase is auto merged by git, then it inc twice for 
num_pending_mgmt_tx.

wgong@wgong-HP3-Z230-SFF-Workstation:~/ath11k/ath-upstream$ git 
cherry-pick 0869610178a1
Auto-merging drivers/net/wireless/ath/ath11k/wmi.c
Auto-merging drivers/net/wireless/ath/ath11k/mac.c
Auto-merging drivers/net/wireless/ath/ath11k/core.h
Auto-merging drivers/net/wireless/ath/ath11k/core.c
[add_wait_mgmt_ath-202111221436 954d233dbe34] ath11k: add wait operation 
for tx management packets for flush from mac80211

On 11/22/2021 8:19 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> In ath11k, tx of management packet is doing in a work queue. Sometimes
>> the workqueue does not finish tx immediately, then it lead after the next
>> step of vdev delete finished, it start to send the management packet to
>> firmware and lead firmware crash.
>>
>> ieee80211_set_disassoc have logic of ieee80211_flush_queues after it
>> send_deauth_disassoc to ath11k, its purpose is make sure the deauth
>> was actually sent, so it need to change ath11k to match the purpose
>> of mac80211.
>>
>> To address these issue wait for tx mgmt and tx data packets.
>>
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01230-QCAHSTSWPLZ_V2_TO_X86-1
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> I sometimes see new warnings with this patch:
>
> [  142.346474] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
> [  147.466367] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
>
> And more importantly this breaks suspend on my NUC testbox:
>
> [  175.141820] PM: suspend entry (deep)
> [  175.150512] Filesystems sync: 0.008 seconds
> [  175.229703] Freezing user space processes ... (elapsed 0.003 seconds) done.
> [  175.233506] OOM killer disabled.
> [  175.233588] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  175.242457] printk: Suspending console(s) (use no_console_suspend to debug)
> [  175.245269] wlan0: deauthenticating from 00:03:7f:48:81:59 by local choice (Reason: 3=DEAUTH_LEAVING)
> [  175.285881] e1000e: EEE TX LPI TIMER: 00000011
> [  180.745259] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
> [  185.864977] ath11k_pci 0000:06:00.0: failed to flush mgmt transmit queue 0
> [  185.970601] PM: Some devices failed to suspend, or early wake event detected
> [  185.974081] usb usb3: root hub lost power or was reset
> [  185.974135] usb usb4: root hub lost power or was reset
> [  186.098870] nvme nvme0: 8/0/0 default/read/poll queues
> [  186.297077] OOM killer enabled.
> [  186.297361] Restarting tasks ... done.
> [  186.343733] PM: suspend exit
>
> My setup:
>
> Tag:	ath-202111221111
>
> [  151.123732] ath11k_pci 0000:06:00.0: MSI vectors: 32
> [  151.123851] ath11k_pci 0000:06:00.0: qca6390 hw2.0
> [  151.720618] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> [  151.720912] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
