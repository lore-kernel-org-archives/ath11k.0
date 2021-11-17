Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC99C433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987C461266
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 987C461266
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re/4+xkUHtuywuef7Kkj5825JjZpZDLeHFN6vQjiXc0=; b=cK9ekesQuxyN66
	IAbDcwtwvlo0jMnNpaRO4yTctkHLIqVoUWGmQ6QihwxfggecobQsNQorvzIeqty590nbHYFqAupUw
	IVCjytzX9bmegyjY06kCE2vbTrM7Jl8Wke6Jg0ewBxloWYyuqUYMgQfw4JaSTj+9iJjE0jxoeXvqv
	D29y7gduhwG2XegKIg0L32pEg5TalK2dMgX39ShDRyhpJ9xwsv/YWAkXlWhN6Pf1K0e93eVaZXdEF
	8CdXODwREFupMeOgnLY5OIiU3hWzgL8sM0rZxtnv12/+M1K6VK25R1oRvQQwFbxzhRVX787GMyx2e
	szTJmYCl4K/NnslLqi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFbe-003qZx-BI; Wed, 17 Nov 2021 07:43:46 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFbY-003qYR-9v
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:43:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637135020; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=3sSp4klagRt88pGsJmhchh7aqNuv0yFReBJKdJbycrU=;
 b=izF7mR+boswC/EC8h1V4DoKgdBiiiyAJ03D4LFfQz3TrPSQ3FoTvj4dIPvGqZCQMn4e/IHft
 hGa7mt6i4TBOECttX8nXODxAuh1X19wo5wzoFuasnJo3uBtIMiidaYk/m7jaE0QkUrAwxWJA
 JSybdrTm24RaiQREofPh//BjuxE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6194b2ab665450d43af497b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:43:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5B4F1C4360C; Wed, 17 Nov 2021 07:43:38 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 032ABC43460;
 Wed, 17 Nov 2021 07:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 032ABC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: "Seevalamuthu Mariappan \(Temp\) \(QUIC\)" <quic_seevalam@quicinc.com>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: add hw_param for wakeup_mhi
References: <1636702019-26142-1-git-send-email-quic_seevalam@quicinc.com>
 <87czn1iurz.fsf@codeaurora.org>
 <DM8PR02MB819953610F46F24C11AD955DF6999@DM8PR02MB8199.namprd02.prod.outlook.com>
Date: Wed, 17 Nov 2021 09:43:31 +0200
In-Reply-To: <DM8PR02MB819953610F46F24C11AD955DF6999@DM8PR02MB8199.namprd02.prod.outlook.com>
 (Seevalamuthu Mariappan's message of "Tue, 16 Nov 2021 08:04:54
 +0000")
Message-ID: <871r3ffcrg.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_234340_424188_405146BA 
X-CRM114-Status: GOOD (  13.89  )
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

"Seevalamuthu Mariappan (Temp) (QUIC)" <quic_seevalam@quicinc.com>
writes:

>> Seevalamuthu Mariappan <quic_seevalam@quicinc.com> writes:
>> 
>> > Wakeup mhi is needed before pci_read/write only for QCA6390 and
>> > WCN6855. Since wakeup & release mhi is enabled for all hardwares,
>> > below mhi assert is seen in QCN9074.
>> >
>> > 	Kernel panic - not syncing: dev_wake != 0
>> > 	CPU: 2 PID: 13535 Comm: procd Not tainted 4.4.60 #1
>> > 	Hardware name: Generic DT based system
>> > 	[<80316dac>] (unwind_backtrace) from [<80313700>]
>> (show_stack+0x10/0x14)
>> > 	[<80313700>] (show_stack) from [<805135dc>]
>> (dump_stack+0x7c/0x9c)
>> > 	[<805135dc>] (dump_stack) from [<8032136c>] (panic+0x84/0x1f8)
>> > 	[<8032136c>] (panic) from [<80549b24>]
>> (mhi_pm_disable_transition+0x3b8/0x5b8)
>> > 	[<80549b24>] (mhi_pm_disable_transition) from [<80549ddc>]
>> (mhi_power_down+0xb8/0x100)
>> > 	[<80549ddc>] (mhi_power_down) from [<7f5242b0>]
>> (ath11k_mhi_op_status_cb+0x284/0x3ac [ath11k_pci])
>> > 	[E][__mhi_device_get_sync] Did not enter M0 state, cur_state:RESET
>> pm_state:SHUTDOWN Process
>> > 	[E][__mhi_device_get_sync] Did not enter M0 state, cur_state:RESET
>> pm_state:SHUTDOWN Process
>> > 	[E][__mhi_device_get_sync] Did not enter M0 state, cur_state:RESET
>> pm_state:SHUTDOWN Process
>> > 	[<7f5242b0>] (ath11k_mhi_op_status_cb [ath11k_pci]) from
>> [<7f524878>] (ath11k_mhi_stop+0x10/0x20 [ath11k_pci])
>> > 	[<7f524878>] (ath11k_mhi_stop [ath11k_pci]) from [<7f525b94>]
>> (ath11k_pci_power_down+0x54/0x90 [ath11k_pci])
>> > 	[<7f525b94>] (ath11k_pci_power_down [ath11k_pci]) from
>> [<8056b2a8>] (pci_device_shutdown+0x30/0x44)
>> > 	[<8056b2a8>] (pci_device_shutdown) from [<805cfa0c>]
>> (device_shutdown+0x124/0x174)
>> > 	[<805cfa0c>] (device_shutdown) from [<8033aaa4>]
>> (kernel_restart+0xc/0x50)
>> > 	[<8033aaa4>] (kernel_restart) from [<8033ada8>]
>> (SyS_reboot+0x178/0x1ec)
>> > 	[<8033ada8>] (SyS_reboot) from [<80301b80>]
>> > (ret_fast_syscall+0x0/0x34)
>> >
>> > Hence, disable wakeup/release mhi using hw_param for other hardwares.
>> >
>> > Tested-on: QCN9074 hw1.0 PCI
>> > WLAN.HK.2.5.0.1-01060-QCAHKSWPL_SILICONZ-1
>> >
>> > Fixes: a05bd85133 ("ath11k: read and write registers below unwindowed
>> > address")
>> > Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
>> 
>> The commit log is not quite clear, are you saying that commit a05bd85133
>> broke QCN9074 support altogether? Or it was failing only in some cases?
>> I can update the commit log.
>> 
>
> [seevalam]: MHI assert seen during 'rmmod ath11k_pci' for QCN9074.

Thanks, I added that to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
