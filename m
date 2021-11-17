Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FFCC433F5
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:09:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5823E61B7D
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5823E61B7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSL6U2gTfEvM/30xwjv2jAMY5YEvXjuhvtBvFyy/Ci4=; b=yOMyt9ogVA7KUu
	TBH4x94scAdiKTXUTDFE1Momy+fGe3l4CP7xLUE1DZckf2ArqadmtJ/NNPjBV82dC+QlHK06SXq+u
	gZVDS5PW3/lqghc0TrbYRWLBnT3hkEkaetj5YAXHKCZmnwEmzRFxltntMYEtMN4ZbwrPGivQFCFwC
	vxg8qn2e6/Q6d0mYmVR5ye9G389V5bKXaV/9J/W/FdaaUAjcmnKMG/BAM8QFwdYKJIbodNJHjtuKT
	BbQU6+n0r9hnrBK1cGezAiiqj9Qb5xiXqps01vPTHVQP17cIMXSw1abGLcpqWSIEwAF3noVV1RKm0
	N3CSVicaP2MQNnc7if+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnG0I-003u2R-8m; Wed, 17 Nov 2021 08:09:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnG08-003u0m-3G
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:09:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637136551; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=aqwnkTtpw2IZjM/VcTVU4OqzZRbA+nxEKy/Q4nJXkU0=;
 b=AQ4a8sLYnZgbISLWTsGfz+CoNcrC5cyvZmreTnTIWoG3woZNJCCZIDETNqcjiulM7nMNznmv
 OynPyPGTqJyx+bD/ozxUjZ8ARRE0d1hgQUgKOMMoSIIoHW3RODGgV7q7/1QOrO5bkiXHipz8
 jauDMNg6vR/7bltlHJEqjH5eVaw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6194b8801e1d2f5233c80a90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:08:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 558B4C4360C; Wed, 17 Nov 2021 08:08:32 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DE8F5C4338F;
 Wed, 17 Nov 2021 08:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DE8F5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ath11k: add feature for device recovery
References: <20211015035459.14190-1-wgong@codeaurora.org>
 <87h7cdh970.fsf@codeaurora.org>
 <a9efda4011061f2f0d57ea597b9b8f0e@codeaurora.org>
Date: Wed, 17 Nov 2021 10:08:28 +0200
In-Reply-To: <a9efda4011061f2f0d57ea597b9b8f0e@codeaurora.org> (Wen Gong's
 message of "Tue, 16 Nov 2021 12:19:28 +0800")
Message-ID: <87sfvvdx1f.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_000911_414335_18EBA014 
X-CRM114-Status: GOOD (  18.29  )
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

Wen Gong <wgong@codeaurora.org> writes:

> On 2021-11-15 20:53, Kalle Valo wrote:
>> Wen Gong <wgong@codeaurora.org> writes:
>>
>>> From: Wen Gong <quic_wgong@quicinc.com>
>>>
>>> v3: remove time_left set but not used in
>>>     "ath11k: add synchronization operation between reconfigure of
>>> mac80211 and ath11k_base"
>>>
>>> v2: s/initilized/initialized in commit log of patch
>>>     "ath11k: add synchronization operation between reconfigure of
>>> mac80211 and ath11k_base"
>>>
>>> Add support for device recovery.
>>>
>>> Wen Gong (3):
>>>   ath11k: add ath11k_qmi_free_resource() for recovery
>>>   ath11k: add support for device recovery for QCA6390
>>>   ath11k: add synchronization operation between reconfigure of
>>> mac80211
>>>     and ath11k_base
>>
>> I did some quick testing (commit 4716d5bb1e16 in pending branch) and it
>> does not seem to work for me:
>>
>> oot@nuc1:~# echo assert > /sys/kernel/debug/ath11k/qca6390\
>> hw2.0/simulate_fw_crash
>> root@nuc1:~# iw wlan0 scan
>> command failed: Connection timed out (-110)
>> root@nuc1:~#
>>
>> Kernel logs have:
>>
>> [  118.903092] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem
>> 0xdb000000-0xdbffffff 64bit]
>> [  118.925164] ath11k_pci 0000:06:00.0: MSI vectors: 32
>> [  118.925285] ath11k_pci 0000:06:00.0: qca6390 hw2.0
>> [  119.093214] mhi mhi0: Requested to power ON
>> [  119.095430] mhi mhi0: Power on setup success
>> [  119.423735] mhi mhi0: Wait for device to enter SBL or Mission mode
>> [  119.543030] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb
>> board_id 0xff soc_id 0xffffffff
>> [  119.543197] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc
>> fw_build_timestamp 2020-06-24 19:50 fw_build_id
>> [  230.101077] ip (2367) used greatest stack depth: 24384 bytes left
>> [  283.663895] ath11k_pci 0000:06:00.0: simulating firmware assert
>> crash
>> [  283.738422] ath11k_pci 0000:06:00.0: firmware crashed:
>> MHI_CB_SYS_ERROR
>> [  295.236831] ath11k_pci 0000:06:00.0: wmi command 12290 timeout
>> [  295.237937] ath11k_pci 0000:06:00.0: failed to send
>> WMI_STOP_SCAN_CMDID
>> [  295.238467] ath11k_pci 0000:06:00.0: failed to stop wmi scan: -11
>> [  295.240049] ath11k_pci 0000:06:00.0: failed to stop scan: -11
>> [  295.240558] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>
>
> I have sent v4, it is not to fix your fail:)
> It added patch "ath11k: fix invalid m3 buffer address".
> https://patchwork.kernel.org/project/linux-wireless/cover/20211116041522.23529-1-quic_wgong@quicinc.com/
>
>
>> Also there should be a clear ath11k_warn() message when firmware
>> recovery was successful, I could not find one from patches.
>
> Yes, if recovery succes, it will have "success" log.

Where are the printouts? I cannot find any ath11k_warn() messages in v4.
Basically I would want to see something like this when the firmware
crashes:

firmware crashed, restarting it

And once the firmware is running again:

firmware restarted succesfully

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
