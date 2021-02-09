Return-Path: <SRS0=1RzP=HL=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B44DC433DB
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 15:25:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B5064EBC
	for <ath11k@archiver.kernel.org>; Tue,  9 Feb 2021 15:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B5064EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=umc8MW7qRNMKtEPheuwDXJ9EC98IBRdipz0JNWyVSU4=; b=gTe/naE+g32DHdzhUrPg/xGXv
	TEWZUjQNcahXjLO1Eo4sdn2Vz98gCx8W2jKEaKoa6iSmze9QrFwrawb4nAVkqKEbjmBrdu+3kiddN
	EXwVnMGAQ5lnZv8SWd92fy/4LcwzWE1oAb8VqVKhR6lff7rR/BgyMBQ0c5tkro4PqSeBw97w97Vgl
	h7YSgNLahs2MtjYTWKkJk1RzfTmGmb+81Y1m2ki0zMACpYkBLqcknkLRCWsJpWbK5q1KXLfjNiFog
	IKcGzX03F+a35QybaSjEus5z4RJhU9eRmd56gDqe/10qYWcciyBXEsYDC3ts5b2pluhA5MpbBhhXg
	8LJwzBo5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Utl-0008GM-Po; Tue, 09 Feb 2021 15:25:53 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Utf-0008F4-7c
 for ath11k@lists.infradead.org; Tue, 09 Feb 2021 15:25:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612884351; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=oq5INHOENsPvBDSGhKLY5rHnMSycJSg4zHZVqtqS9sA=;
 b=uZ46AmkrgDNzy1oDPIFmCJc4V9z6IV/r/adaHNhda32ajtntRIA0sXu4OO0UAl+bpYeI6Lt9
 J1YU2bkJ7XwBLecvip3e3WMQC6tEPWFqRyqnj948EkyTGOOqYXCbqOnnE6lKV32IzToas4ty
 Iij2NjdDWU/kwN/gRu5wugiDfAQ=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6022a975f112b7872c4a8624 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 15:25:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8023CC433C6; Tue,  9 Feb 2021 15:25:41 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C04BC433CA;
 Tue,  9 Feb 2021 15:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C04BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [regression] mhi: rmmod ath11k_pci crashing on v5.11
References: <8735y5uwke.fsf@codeaurora.org>
 <CAMZdPi9pFHA-p3-e+-HNp8y3QPwg7GOgDucJ+HG8ETtxqZ=_9A@mail.gmail.com>
Date: Tue, 09 Feb 2021 17:25:37 +0200
In-Reply-To: <CAMZdPi9pFHA-p3-e+-HNp8y3QPwg7GOgDucJ+HG8ETtxqZ=_9A@mail.gmail.com>
 (Loic Poulain's message of "Tue, 9 Feb 2021 16:21:28 +0100")
Message-ID: <87y2fxtg9a.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_102551_460995_040F5110 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 ath11k@lists.infradead.org, Hemant Kumar <hemantk@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Loic Poulain <loic.poulain@linaro.org> writes:

> On Tue, 9 Feb 2021 at 15:48, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Hi Loic,
>>
>> I noticed that v5.11-rc6 was crashing on my ath11k test box with
>> QCA6390. The box was down for few weeks so I only noticed it late in the
>> cycle. After some manual testing I found out that reverting this commit
>> fixes the issue:
>>
>> a7f422f2f89e bus: mhi: Fix channel close issue on driver remove
>>
>> The crash happens when I issue 'sudo rmmod ath11k_pci' and it happens
>> every time. Through netconsole I get:
>>
>> Feb 9 16:43:30 nuc1 [ 313.202778] ath11k_pci 0000:06:00.0: qmi
>> failed set mode request, mode: 4, err = -110
>> Feb 9 16:43:30 nuc1 [ 313.202932] ath11k_pci 0000:06:00.0: qmi
>> failed to send wlan mode off
>> Feb  9 16:43:30 nuc1 [  313.225017] ------------[ cut here ]------------
>> Feb 9 16:43:30 nuc1 [ 313.225118] DMA-API: ath11k_pci 0000:06:00.0:
>> device driver tries to free DMA memory it has not allocated [device
>> address=0x00000000fffbc000] [size=2047 bytes]
>> Feb 9 16:43:30 nuc1 [ 313.225146] WARNING: CPU: 2 PID: 94 at
>> kernel/dma/debug.c:963 check_unmap+0x54a/0x8b0
>> Feb 9 16:43:30 nuc1 [ 313.225173] Modules linked in: ath11k_pci(-)
>> ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr ns
>> mos7840 usbserial nvme nvme_core
>> Feb 9 16:43:30 nuc1 [ 313.225222] CPU: 2 PID: 94 Comm: kworker/u17:0
>> Not tainted 5.11.0-rc6 #362
>> Feb 9 16:43:30 nuc1 [ 313.225243] Hardware name: Intel(R) Client
>> Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601
>> 08/01/2018
>> Feb  9 16:43:30 nuc1 [  313.225263] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
>> Feb  9 16:43:30 nuc1 [  313.225290] RIP: 0010:check_unmap+0x54a/0x8b0
>> Feb 9 16:43:30 nuc1 [ 313.225312] Code: 4d 85 e4 75 03 4c 8b 27 4c
>> 89 04 24 e8 8f 78 66 00 4c 8b 04 24 48 89 c6 4c 89 e9 4c 89 e2 48 c7
>> c7 c8 be 16 8f e8 26 39 ae 00 <0f> 0b 44 8b 1d 6d c2 9b 01 45 85 db
>> 0f 84 5f 02 00 00 48 83 c4 18
>> Feb  9 16:43:30 nuc1 [  313.225333] RSP: 0018:ffffbab5c08f3ab0 EFLAGS: 00010282
>> Feb 9 16:43:30 nuc1 [ 313.225355] RAX: 0000000000000000 RBX:
>> 00000000fffbc000 RCX: ffff99dbf55d9fb8
>> Feb 9 16:43:30 nuc1 [ 313.225375] RDX: 00000000ffffffd8 RSI:
>> 0000000000000027 RDI: ffff99dbf55d9fb0
>> Feb 9 16:43:30 nuc1 [ 313.225395] RBP: ffffbab5c08f3b00 R08:
>> 0000000000000001 R09: 0000000000000000
>> Feb 9 16:43:30 nuc1 [ 313.225415] R10: 0000000000000003 R11:
>> 3fffffffffffffff R12: ffff99da84c525d0
>> Feb 9 16:43:30 nuc1 [ 313.225434] R13: 00000000fffbc000 R14:
>> ffffffff90b96c90 R15: 0000000000000000
>> Feb 9 16:43:30 nuc1 [ 313.225453] FS: 0000000000000000(0000)
>> GS:ffff99dbf5400000(0000) knlGS:0000000000000000
>> Feb 9 16:43:30 nuc1 [ 313.225479] CS: 0010 DS: 0000 ES: 0000 CR0:
>> 0000000080050033
>> Feb 9 16:43:30 nuc1 [ 313.225500] CR2: 0000556d03a34250 CR3:
>> 000000010d9e2003 CR4: 00000000003706e0
>> Feb  9 16:43:30 nuc1 [  313.225520] Call Trace:
>> Feb  9 16:43:30 nuc1 [  313.225541]  ? __lock_acquire+0x3bd/0x6d0
>> Feb  9 16:43:30 nuc1 [  313.225565]  debug_dma_free_coherent+0xb0/0xf0
>> Feb  9 16:43:30 nuc1 [  313.225594]  ? mhi_driver_remove+0x11d/0x290 [mhi]
>> Feb  9 16:43:30 nuc1 [  313.225620]  ? __mutex_lock+0x6ca/0x8f0
>> Feb  9 16:43:30 nuc1 [  313.225643]  ? qcom_mhi_qrtr_remove+0x18/0x30 [qrtr_mhi]
>> Feb  9 16:43:30 nuc1 [  313.225668]  dma_free_attrs+0x48/0xb0
>> Feb  9 16:43:30 nuc1 [  313.225710]  mhi_driver_remove+0x21e/0x290 [mhi]
>> Feb  9 16:43:30 nuc1 [  313.225742]  __device_release_driver+0x17b/0x230
>
> Ok, I think it's because there are two paths leading to
> 'mhi_deinit_chan_ctxt' and causing double page free (driver's remove
> callback via channel_unprepare and mhi_driver_remove via deinit loop).
> Checking and going to provide a fix.

Great, thank you. Feel free to send me any test patches, it's very easy
for me to reproduce the crash.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
