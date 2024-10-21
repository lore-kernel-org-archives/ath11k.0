Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA897D17122
	for <ath11k@archiver.kernel.org>; Mon, 21 Oct 2024 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eHR45grE/UwjBVhQirkQCYHFtj+9w2v8yowLBJB/G4=; b=mYIfEtOrLw68WrfV21FG6rpbSg
	aFxTTcWLqaGloehNoK8fGb/AIbxyFj2S9C4NzJ3Dbz8tITHvdgDjirnliXr2xqqPDhq1YHmguxamO
	13ijPZ+xdLIHYI9r6sJvedhtmHYEiCJ9dJiS25xKtW79je3XTGV4nsJhsvxtE6Ydzt2MhLBQ35B0s
	kweqjvRUWIsx9xl/EWfR6BJiiAFq1MblWuh5RZwlXOqk5Jk6j0arHns0yMzhwb69xJZVL32vHLgBB
	5q/LMfD2w6ZwoILNmQBddxkZV686GVpb8D1eZb4NzkgNcHja9owVxf37ejte+PfNAszU3/t54yMqw
	EEcKYAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2x3k-00000008IEF-0Xz9;
	Mon, 21 Oct 2024 18:23:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2x2b-00000008I8K-49S5
	for ath11k@lists.infradead.org;
	Mon, 21 Oct 2024 18:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 525A8A43849;
	Mon, 21 Oct 2024 18:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A27EC4CEC3;
	Mon, 21 Oct 2024 18:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729534923;
	bh=9pZU9zAoGZt6NGrlu4fYgkLxteWoyzNrqWQutED9lPs=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=T64i2lxTqV5l+RWPHnJvW43X4ADrpOdvNHCitFLZDyBkVWrM3hgNOfdg5Dkl9FK8X
	 ARs+1wzp2I1+5KfJf7WBaTInoUeiMXrzu2FRko/lPRd0dVwMkjUmiOnJIYzs1SlnyA
	 Wc8GjPrsZMTEOoaKM/nAfB8vhbqiA2bS1DG6yUjxYKxkwyKX6Sdp06T/Zvl7uxrVP1
	 6pWJLMtiZzMOEcktEY5ywWgt7XB0WzVra1PxkPhkpRrVES66ek674o8vpr5MiqX6xc
	 MxHUKrPjaIQuYhf7lyb7Kpx74B4AnyrpLCuTVVEmd1tSSr735lvXRADkS3SRxBwLZU
	 QEVWjZIKUMeOQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  Bjorn Andersson <andersson@kernel.org>,  Konrad
 Dybcio <konradybcio@kernel.org>,  <linux-firmware@kernel.org>,
  <ath11k@lists.infradead.org>,  <linux-arm-msm@vger.kernel.org>
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific
 subdir
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
	<379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com>
Date: Mon, 21 Oct 2024 21:22:00 +0300
In-Reply-To: <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com> (Jeff
	Johnson's message of "Fri, 18 Oct 2024 15:16:02 -0700")
Message-ID: <87plntnwon.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_112206_181140_95E7A001 
X-CRM114-Status: GOOD (  24.62  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
>
>> The firmware under ath11k/WCN6750 can not be utilized on other devices using
>> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
>> attempt to propose a solution by moving the file into device-specifig subdir.
>> Other platforms can place firmware files in other subdirs, depending on the
>> SoC.
>> 
>> Note, while performing the move I also propose squashing the firmware
>> file.

I assume you mean squashing the files to wpss.mbn?

>> This is the practice recommended by the msm platform maintainers for the DSP
>> firmware (not to mention that it also saves us from the extra symlinks). If
>> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
>> 
>> For now this is an RFC in order to gather opinion form respective platform and
>> driver maintainers.
>> 
>> ----------------------------------------------------------------
>> 
>> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
>> 
>>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
>> 
>> are available in the Git repository at:
>> 
>>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
>> 
>> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
>> 
>>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
>> 
>> ----------------------------------------------------------------
>> Dmitry Baryshkov (1):
>>       ath11k: move WCN6750 firmware to the device-specific subdir
>> 
>>  WHENCE                                             |  12 ++----------
>>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
>>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
>>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
>>  11 files changed, 2 insertions(+), 10 deletions(-)
>>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)

So this follow basically the same directory hierarchy as you Dmitry
implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
board-specific firmware overrides"), right? Just making sure we are on
the same page. I think ath10k/ath11k/ath12k drivers should follow the
same design as much as possible.

>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
>
> I'm waiting for Kalle to respond, but at a minimum I suspect our internal
> firmware tooling would be impacted by this change.

Yeah, most likely we need to update our tools. But we would have to do
it anyway so I'm not concerned about that.

> Kalle, do you have concerns or suggestions on how to handle this issue?

Looks good to me.

Dmitry, if you have the time please take a look at this:

https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/

Based on a quick look it seems to do things differently and not really a
fan of that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

