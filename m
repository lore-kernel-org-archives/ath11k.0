Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DD4C433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3wuLQCZQB7CPsvxQavPHAavaEvEUGl+q6B88Y6TmXg=; b=Cc0l44UyRoVxZp
	NR+y4MKTUZoFl6ablPvmwG2cERpmBO/wfSYgd6C0ih/SCjKQeqSbQ0oPQ3Hb0U27Zib2wijIjb9Xc
	dnSMnoJ8zWO8fJ15X3ml/5Q5pju50omouIffhyVeoc1TltqTmsc5tKEbQQMPAE39Zw1rUgGAa0pbX
	JJ7zaB7+ztCjFqaInRCnnC+VCE/pjbbBBO9UoPtfnBfyLSOHqdo/DtxYrv5JsplOzktVMmlEOAPxz
	qS4Qgq3AAaYmlY9yP1EAXZ6G+vCsIg/gEryIamOcrGDQ4FSOTxlEUJjsIfZpQCK+u4evjsLeha70u
	q0OpU6f7+xRLBEABcUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx3GM-006lHU-Ua; Fri, 03 Jun 2022 09:06:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx3GK-006lGk-D6
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 09:06:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDDCA61986;
	Fri,  3 Jun 2022 09:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9386EC34115;
	Fri,  3 Jun 2022 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654247191;
	bh=CHKMNR+H8Gtn+Ze4scSHGJ2E/aJ7BboldlK/dhnan54=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Xut/TjneAAO6EpTmhfcqo0t1rdn3Mh45/jCnHwO96LnKhY7kXIilrc13esgyR0nHo
	 SgaO066BAUGamwmcIaWyEiUHOEIElOjcRq9iSRHMbZNWZ6cWf71bL40DCSsQE2Vy+F
	 U7RG3HUH02H/Zj3haL914S+8FuNZ0cM+gmXmIejy8xCV+fYebbiN44dAdi4leNSzQ7
	 7453QaWlKhs9gx84OTp80gv3vXO1/EHR1NQA7qnuSKAyE2p56Slv4lZ+cT0HPc0QKd
	 nbCpzku7HA08G6abosyCkkPvkd24qwWC9FkAuqdBP7hffoRuglAGiqtTFpGL06VX82
	 Ja4JeRacZLlxA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855 issues with latest linux-firmware
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
	<CAA8EJpoHKUSx3Aq+fB-4s0ZpZXfvp8p-==hO12hxsrxE46YfCw@mail.gmail.com>
	<87zgium9dw.fsf@kernel.org>
	<f77c78c4-2dee-3798-4a8a-c42abc0e1c6f@linaro.org>
Date: Fri, 03 Jun 2022 12:06:28 +0300
In-Reply-To: <f77c78c4-2dee-3798-4a8a-c42abc0e1c6f@linaro.org> (Dmitry
	Baryshkov's message of "Fri, 3 Jun 2022 11:40:20 +0300")
Message-ID: <87v8tim7zf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_020632_521961_7856B654 
X-CRM114-Status: GOOD (  16.13  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hi Kalle,
>
> On 03/06/2022 11:36, Kalle Valo wrote:
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>>> I have tested the latest firmware from linux-firmware and it still
>>> fails to send the bdf file request:
>>>
>>> [    3.740702] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
>>> board_id 0xa7 soc_id 0x400c0210
>>> [    3.752952] ath11k_pci 0000:01:00.0: fw_version 0x11090c35
>>> fw_build_timestamp 2022-04-18 20:23 fw_build_id
>>> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>>> [    3.760674] ath11k_pci 0000:01:00.0: failed to fetch board data for
>>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=167
>>> from ath11k/WCN6855/hw2.1/board-2.bin
>>> [....]
>>> [   13.843957] ath11k_pci 0000:01:00.0: failed to wait board file
>>> download request: -110
>>
>> Yeah, I have a bunch of missing board files but I haven't been able to
>> start searching for them yet. This will take time, sorry.
>
> I might be mistaken, but for me it looks like the problem is not in
> the missing board file. I have added local board.bin.

That's expected, board files from other drivers are unsupported. You
need an ath11k specific board file.

If you use something outside of my repositories (ath.git &
ath11k-firmware) please mention that clearly as that's unsupported. I
try to make sure that everything in my repos is backwards compatible,
but I cannot guarantee that for out of tree releases.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
