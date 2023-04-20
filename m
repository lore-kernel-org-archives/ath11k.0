Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B1C77B73
	for <ath11k@archiver.kernel.org>; Thu, 20 Apr 2023 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InaIc3L2bx63j59UFzu4Glhnn4b5OQxg1Zma0MiyDRE=; b=Oo4AYNR0jHqBSQ
	A7ix+EG1IyaepyKmNIZIVESx3TlfY5M9CGXAhDS0WNARLMwFfqMNzRNOMR8lzONuBzbu5oC61i/nS
	ZqmkrKqZRbZtldTsZfGXGuf/sMqsHxnLszc67n8GLVDS+zOAx9cAvS9WCeI+CLDlztCwh65JNAWdZ
	hkDS1q6mgQI8OGulQvrjCrDsxy+h+Yh3NvUr4B2L4NQygm/urheB015xjSoEftmb13Tm9d24IOQ+h
	/yQAjvzN6QpsqoZsvjANT3LvU9EMFiRU7THaZYWnJBVRvQOim8YeFhgexyYiAnWHj5JhLc+EjO3N8
	VCQOPP/V/EnyrV8qSgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTA6-0081Tt-1R;
	Thu, 20 Apr 2023 12:13:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTA3-0081Sv-0M
	for ath11k@lists.infradead.org;
	Thu, 20 Apr 2023 12:13:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D79E60AE8;
	Thu, 20 Apr 2023 12:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D57C433EF;
	Thu, 20 Apr 2023 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681992794;
	bh=2BKR3UhDK1E2h5WRNrJ3jYoywm1lljSOCAo0hZC/kGQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=k2EtE19S7IlBnEXe6dnVZyq4mQPhOc3bDqKVWZBHTPWTZT/+Pbh63nQ6OMxK/Llqg
	 iy4dgrfm0nIkaki+eJACT7nTIivXk84nrv4KpNj5PBEmSe3gXcBO55+EzZVKsusduF
	 Z2d4GYX8AMySJia97uzBdtt9xfWjMz3rWv8A06HNAaREBq1SRaAJTodcxT/vFuIQ8t
	 6/CD0m0tDJVjpks/hk7HTt5H9XlBVKfEjwIZIkqtL9ZLQ/LPp6Bk0zK00e6Gj+V6zH
	 r+3qStuuYDwBooG3UnPS5bN43ZEfoKXOe/k3uNjmy3gINVIx6bqj932NXHR8OU1iIt
	 6coA8UYymR03Q==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] ath11k: factory test mode support
References: <20230420113653.1686-1-quic_rajkbhag@quicinc.com>
	<825cf403-b833-beff-02d4-cf8fbab89eb0@quicinc.com>
Date: Thu, 20 Apr 2023 15:13:09 +0300
In-Reply-To: <825cf403-b833-beff-02d4-cf8fbab89eb0@quicinc.com> (Raj Kumar
	Bhagat's message of "Thu, 20 Apr 2023 17:31:25 +0530")
Message-ID: <87r0sevjje.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_051315_194046_2F8543AA 
X-CRM114-Status: GOOD (  16.86  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> On 4/20/2023 5:06 PM, Raj Kumar Bhagat wrote:
>
>> Device is booted in factory test mode to calibrate the board.
>> The commands are sent from a userspace application, which is
>> sent to firmware using wmi commands. Firmware will send the
>> response back to the application which stores the calibration
>> data in caldata.bin file. This file will be loaded when the
>> device boots up normally next time.
>> 
>> Govindaraj Saminathan (3):
>>   wifi: ath11k: remove unused function ath11k_tm_event_wmi
>>   wifi: ath11k: optimize ath11k_tm_cmd_get_version
>>   wifi: ath11k: factory test mode support
>> 
>> Sowmiya Sree Elavalagan (1):
>>   wifi: ath11k: Allow ath11k to boot without caldata in ftm mode
>> 
>> ---
>> v2:
>> - added separate patch for removal of ath11k_tm_event_wmi()
>> - added separate patch for changes in ath11k_tm_cmd_get_version()
>> - removed unused cmd and updated documentation for enum ath11k_tm_cmd
>> - changed warning print to debug print
>> ---
>> 
>>  drivers/net/wireless/ath/ath11k/ahb.c        |   3 +-
>>  drivers/net/wireless/ath/ath11k/core.c       |  20 +-
>>  drivers/net/wireless/ath/ath11k/core.h       |  15 +-
>>  drivers/net/wireless/ath/ath11k/mac.c        |  13 +-
>>  drivers/net/wireless/ath/ath11k/pci.c        |   3 +-
>>  drivers/net/wireless/ath/ath11k/qmi.c        |  10 +-
>>  drivers/net/wireless/ath/ath11k/testmode.c   | 320 ++++++++++++++++---
>>  drivers/net/wireless/ath/ath11k/testmode.h   |  20 +-
>>  drivers/net/wireless/ath/ath11k/testmode_i.h |  16 +
>>  drivers/net/wireless/ath/ath11k/wmi.c        |  40 ++-
>>  drivers/net/wireless/ath/ath11k/wmi.h        |  20 ++
>>  drivers/net/wireless/ath/ath11k/wow.c        |   3 +-
>>  12 files changed, 419 insertions(+), 64 deletions(-)
>> 
>> 
>> base-commit: 12f167f02a1abe2c8817496a902de00758285b92
>
> Please ignore this patch series. Tested-on tag is missing for patches 1/4 and
> 2/4. Will send v3 with correct Tested-on tag.

Please wait, I need to first push back my changes to the pending so that
you can see them.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
