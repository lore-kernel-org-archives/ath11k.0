Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14995C433F5
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 08:39:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D091B61211
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 08:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D091B61211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mr0+2LlNvDMqmGF0nqDqJhWd7SfB7jDI5V7Nqs2RbYk=; b=RR2bFIL5FXsM7l
	c4ToWJ9YOGkb9QGtlOsyth+JL9OjGZzdx0NYXIjrqFsjf80gLsBD0zMEbsl+4vmkz10t8ztUDHoNV
	XCj/X0VU8FLcHnsSeK7nnk+J1COJEKCYd7I3ga0XYfxRB01kzQ/wwQ/zBMcrulng8JJ+ny7TjCy6m
	COuFZ+Y0hMn5csVVnSsG1+GTxxZTwNfUB/+6ObNup6rENeOkjuTX5VPQo1eN9POKLo5cwGI1lAgJY
	gYJsZKGUPuVHUy5lcVU+zdM76W9K/X0acLQCQu5TNwEwRprwzJOmoLQ6RevG5mJHhN73KdnQGx1Ke
	iHy9C5+trDp9/Y5HX0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTgjQ-00Dcgc-H5; Fri, 24 Sep 2021 08:38:56 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTghW-00DbgL-6G
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 08:37:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632472616; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=sFHIE4zJB+Alz/t8lIYIlIY1gRwMFajWERj2jYFYL78=;
 b=RNMNGYiZm0NBaAQ4IUf1nykHFuoeIdj2k1cxJBCw5jJ8sXsmazsYho5aRmIYJRzH9aZxox5s
 YHn6Uxcx56CakdQ5Gu0Y/2B7pL6GJxFPeiWqe0Rdl3ttSA0Zgr3MNnd3hXQmZU+0rJNksTAr
 BaVZrTFH/p0+DAD0taKsMFGHHXk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 614d8e21ebab8392924a70d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 08:36:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AF132C43618; Fri, 24 Sep 2021 08:36:48 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D652C43460;
 Fri, 24 Sep 2021 08:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0D652C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
Date: Fri, 24 Sep 2021 11:36:41 +0300
In-Reply-To: <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 (Loic Poulain's message of "Thu, 16 Sep 2021 12:18:10 +0200")
Message-ID: <877df6tlnq.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_013658_362589_3D29F304 
X-CRM114-Status: GOOD (  21.83  )
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

Loic Poulain <loic.poulain@linaro.org> writes:

> Hi Kalle,
>
> On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Hi Loic and Mani,
>>
>> I hate to be the bearer of bad news again :)
>>
>> I noticed already a while ago that commit 020d3b26c07a ("bus: mhi: Early
>> MHI resume failure in non M3 state"), introduced in v5.13-rc1, broke
>> ath11k resume on my NUC x86 testbox using QCA6390. Interestingly enough
>> Dell XPS 13 9310 laptop (with QCA6390 as well) does not have this
>> problem, I only see the problem on the NUC. I do not know what's causing
>> this difference.
>
> I suppose the NUC is current PCI-Express power during suspend while
> the laptop maintains PCIe/M2 power.

Sorry, I'm not able to parse that sentence. Can you elaborate more?

>> At the moment I'm running my tests with commit 020d3b26c07a reverted and
>> everything works without problems. Is there a simple way to fix this? Or
>> maybe we should just revert the commit? Commit log and kernel logs from
>> a failing case below.
>
> Do you have log of success case?

A log from a successful case in the end of email, using v5.15-rc1 plus
revert of commit 020d3b26c07abe27.

> To me, the device loses power, that is why MHI resuming is failing.
> Normally the device should be properly recovered/reinitialized. Before
> that patch the power loss was simply not detected (or handled at
> higher stack level).

Currently in ath11k we always keep the firmware running when in suspend,
this is a workaround due to problems between mac80211 and MHI stack.
IIRC the problem was something related MHI creating struct device during
resume or something like that.

[  164.088772] PM: suspend entry (deep)
[  164.089867] Filesystems sync: 0.000 seconds
[  164.140383] Freezing user space processes ... (elapsed 0.004 seconds) done.
[  164.146245] OOM killer disabled.
[  164.148024] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  164.151767] printk: Suspending console(s) (use no_console_suspend to debug)
[  164.155767] wlan0: deauthenticating from <SENSORED> by local choice (Reason: 3=DEAUTH_LEAVING)
[  164.197460] e1000e: EEE TX LPI TIMER: 00000011
[  164.787849] ACPI: EC: interrupt blocked
[  164.863887] ACPI: PM: Preparing to enter system sleep state S3
[  164.898479] ACPI: EC: event blocked
[  164.898483] ACPI: EC: EC stopped
[  164.898487] ACPI: PM: Saving platform NVS memory
[  164.898496] Disabling non-boot CPUs ...
[  164.910527] numa_remove_cpu cpu 1 node 0: mask now 0,2-7
[  164.911609] smpboot: CPU 1 is now offline
[  164.929506] numa_remove_cpu cpu 2 node 0: mask now 0,3-7
[  164.930593] smpboot: CPU 2 is now offline
[  164.947111] numa_remove_cpu cpu 3 node 0: mask now 0,4-7
[  164.948192] smpboot: CPU 3 is now offline
[  164.965687] numa_remove_cpu cpu 4 node 0: mask now 0,5-7
[  164.967133] smpboot: CPU 4 is now offline
[  164.983150] numa_remove_cpu cpu 5 node 0: mask now 0,6-7
[  164.984211] smpboot: CPU 5 is now offline
[  164.992047] numa_remove_cpu cpu 6 node 0: mask now 0,7
[  164.993549] smpboot: CPU 6 is now offline
[  165.004382] numa_remove_cpu cpu 7 node 0: mask now 0
[  165.005456] smpboot: CPU 7 is now offline
[  165.009866] ACPI: PM: Low-level resume complete
[  165.010106] ACPI: EC: EC started
[  165.010109] ACPI: PM: Restoring platform NVS memory
[  165.012344] Enabling non-boot CPUs ...
[  165.012978] x86: Booting SMP configuration:
[  165.012984] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  165.014850] numa_add_cpu cpu 1 node 0: mask now 0-1
[  165.023818] CPU1 is up
[  165.024455] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  165.026190] numa_add_cpu cpu 2 node 0: mask now 0-2
[  165.034904] CPU2 is up
[  165.035479] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  165.037193] numa_add_cpu cpu 3 node 0: mask now 0-3
[  165.046102] CPU3 is up
[  165.046639] smpboot: Booting Node 0 Processor 4 APIC 0x1
[  165.047005] numa_add_cpu cpu 4 node 0: mask now 0-4
[  165.058328] CPU4 is up
[  165.058976] smpboot: Booting Node 0 Processor 5 APIC 0x3
[  165.059342] numa_add_cpu cpu 5 node 0: mask now 0-5
[  165.070520] CPU5 is up
[  165.071192] smpboot: Booting Node 0 Processor 6 APIC 0x5
[  165.071574] numa_add_cpu cpu 6 node 0: mask now 0-6
[  165.082952] CPU6 is up
[  165.083609] smpboot: Booting Node 0 Processor 7 APIC 0x7
[  165.083980] numa_add_cpu cpu 7 node 0: mask now 0-7
[  165.095544] CPU7 is up
[  165.099137] ACPI: PM: Waking up from system sleep state S3
[  166.045084] ACPI: EC: interrupt unblocked
[  166.045242] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
[  166.056234] pcieport 0000:00:1c.1: Intel SPT PCH root port ACS workaround enabled
[  166.057410] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
[  166.057413] pcieport 0000:00:1c.2: Intel SPT PCH root port ACS workaround enabled
[  167.210794] ACPI: EC: event unblocked
[  167.258815] nvme nvme0: 8/0/0 default/read/poll queues
[  167.694965] atkbd serio0: Unknown key released (translated set 2, code 0x7c on isa0060/serio0).
[  167.695953] OOM killer enabled.
[  167.697336] atkbd serio0: Use 'setkeycodes 7c <keycode>' to make it known.
[  167.750241] Restarting tasks ... done.
[  167.770450] PM: suspend exit

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
