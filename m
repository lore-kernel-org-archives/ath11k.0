Return-Path: <SRS0=S5NU=QD=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B288EC433F5
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 04:19:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CEA61B30
	for <ath11k@archiver.kernel.org>; Tue, 16 Nov 2021 04:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60CEA61B30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPoSveBPFZm1YU1NgWAf3H2Z5o3SSVqkQT4ZCPeDkaI=; b=vjrzzNX0zXMP7WtkM9+smtmygh
	7jNJXQMBFsThwnkwTrKlfoUQCGhQaBK29w7Bxm0J0pWVOI1GCg276esrERVmTP+fJuFV8FJ2ZBSUy
	gtBF5zMx1QI8DqbTMke6DbsYRCZcWroK2WQflOgo4v1WT1AAPKdiue2QsZAs/jg8dSyGmOKF3AEy3
	uMNZb2GICUZ8ij2DeDfTl1u86mrSDuRUPpoKE6dK53A47N9ntp9+ZDmUNYaMYWWlq4i9o/HtFxVH8
	U0yvmVA+35QrzpM3t5uUlLwVzpxBijl0Dv3KL0oXNmFk6en9RmUSZhqgAy1nFrH4DgbbuivYGQJy8
	GQwwJLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmpwU-000FHS-Cy; Tue, 16 Nov 2021 04:19:34 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmpwR-000FH0-7x
 for ath11k@lists.infradead.org; Tue, 16 Nov 2021 04:19:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637036370; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sB5/D994UQzTBtAp85fzMLbbNaRpZcBYwnSVLxcQl9c=;
 b=Piy4qIciZnXGfp+Xcr8K+uv8Hdu8VthKqeXl+PSpJkgfKSJD6UEFq3ZcU7q+/+3kwNPZ7O8p
 tl7+TYHJhQvz5LbGMR+8H1XxRUqTAGenfO6ZkjXAvgcHnkmFKHCmxFAEQA4TPpMSfXraoQ3j
 krd/4QhlG+4saTWXRoj+2TLCBRc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61933151ed14d5980f88cf0e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 04:19:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 275E3C4360D; Tue, 16 Nov 2021 04:19:29 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AA06CC4338F;
 Tue, 16 Nov 2021 04:19:28 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 16 Nov 2021 12:19:28 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ath11k: add feature for device recovery
In-Reply-To: <87h7cdh970.fsf@codeaurora.org>
References: <20211015035459.14190-1-wgong@codeaurora.org>
 <87h7cdh970.fsf@codeaurora.org>
Message-ID: <a9efda4011061f2f0d57ea597b9b8f0e@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_201931_390841_583E8BE1 
X-CRM114-Status: GOOD (  15.65  )
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

On 2021-11-15 20:53, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> From: Wen Gong <quic_wgong@quicinc.com>
>> 
>> v3: remove time_left set but not used in
>>     "ath11k: add synchronization operation between reconfigure of 
>> mac80211 and ath11k_base"
>> 
>> v2: s/initilized/initialized in commit log of patch
>>     "ath11k: add synchronization operation between reconfigure of 
>> mac80211 and ath11k_base"
>> 
>> Add support for device recovery.
>> 
>> Wen Gong (3):
>>   ath11k: add ath11k_qmi_free_resource() for recovery
>>   ath11k: add support for device recovery for QCA6390
>>   ath11k: add synchronization operation between reconfigure of 
>> mac80211
>>     and ath11k_base
> 
> I did some quick testing (commit 4716d5bb1e16 in pending branch) and it
> does not seem to work for me:
> 
> oot@nuc1:~# echo assert > /sys/kernel/debug/ath11k/qca6390\
> hw2.0/simulate_fw_crash
> root@nuc1:~# iw wlan0 scan
> command failed: Connection timed out (-110)
> root@nuc1:~#
> 
> Kernel logs have:
> 
> [  118.903092] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem
> 0xdb000000-0xdbffffff 64bit]
> [  118.925164] ath11k_pci 0000:06:00.0: MSI vectors: 32
> [  118.925285] ath11k_pci 0000:06:00.0: qca6390 hw2.0
> [  119.093214] mhi mhi0: Requested to power ON
> [  119.095430] mhi mhi0: Power on setup success
> [  119.423735] mhi mhi0: Wait for device to enter SBL or Mission mode
> [  119.543030] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb
> board_id 0xff soc_id 0xffffffff
> [  119.543197] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc
> fw_build_timestamp 2020-06-24 19:50 fw_build_id
> [  230.101077] ip (2367) used greatest stack depth: 24384 bytes left
> [  283.663895] ath11k_pci 0000:06:00.0: simulating firmware assert 
> crash
> [  283.738422] ath11k_pci 0000:06:00.0: firmware crashed: 
> MHI_CB_SYS_ERROR
> [  295.236831] ath11k_pci 0000:06:00.0: wmi command 12290 timeout
> [  295.237937] ath11k_pci 0000:06:00.0: failed to send 
> WMI_STOP_SCAN_CMDID
> [  295.238467] ath11k_pci 0000:06:00.0: failed to stop wmi scan: -11
> [  295.240049] ath11k_pci 0000:06:00.0: failed to stop scan: -11
> [  295.240558] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> 

I have sent v4, it is not to fix your fail:)
It added patch "ath11k: fix invalid m3 buffer address".
https://patchwork.kernel.org/project/linux-wireless/cover/20211116041522.23529-1-quic_wgong@quicinc.com/


> Also there should be a clear ath11k_warn() message when firmware
> recovery was successful, I could not find one from patches.

Yes, if recovery succes, it will have "success" log.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
