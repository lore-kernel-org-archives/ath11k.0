Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B167CC433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 12:53:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D69F61B39
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 12:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D69F61B39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4NJwoKQtnb1VhtZUXPqiOmO9MT+DMvhlnQtSIdk9DE=; b=uGT5fu+BW0hsoe
	VmgZ7B1xJT2tg9hNgtP7O+/cXDxvJGLltBL5JJ955Na56KTpJE6nvE6wYcqV0WFUIpbyw0LwRz9x5
	7p6J7oNewsHdVJsrQ9zknJx5l825iY9zaiSXhV5gi2wcJlLmUbPhXF+RHycM65elENT04yP8u43zS
	UZ4ztIhm2z4F2WKmCna+yPlQAIpBgm+04WyLkOYJ64OrHSh6gS/GG0KDDCa3rwlrzVXbyNdzymiFx
	SyC9qGGJW5AgP5etL8WUF9NKFawERS4UnkNGrPwY9y0hPkquIbsHoKJ9j51I+gYtcz57p6Hi2VJsh
	LmhqHmuAkEdUQVfgl16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmbU7-00FYPj-M6; Mon, 15 Nov 2021 12:53:19 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmbU4-00FYPP-6R
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 12:53:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636980795; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=MLo0Cr7KEDi5L0cuCBguP+bU0UNznjkDCKx2UliDxFw=;
 b=pxDc4Ld/5q7XMkbORwhPdcuD/cupVi7UYG94rN+VJbn98q4TIDecFUV57YiJGkL9b6WqslrI
 ps+apk67ODG4w+GekfNYyox6pi8zR33vn/BdfcL6DieVh/N/VtU+tRV8pqDskdw2/mw4Fffd
 q9bYLxRp/2MFmL6iRZg1ffTgF2Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6192583ae0b76a7314522dd2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 12:53:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7B7B9C43460; Mon, 15 Nov 2021 12:53:13 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CF7A2C4338F;
 Mon, 15 Nov 2021 12:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CF7A2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 0/3] ath11k: add feature for device recovery
References: <20211015035459.14190-1-wgong@codeaurora.org>
Date: Mon, 15 Nov 2021 14:53:07 +0200
In-Reply-To: <20211015035459.14190-1-wgong@codeaurora.org> (Wen Gong's message
 of "Thu, 14 Oct 2021 23:54:56 -0400")
Message-ID: <87h7cdh970.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_045316_313260_119005BE 
X-CRM114-Status: GOOD (  14.08  )
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

> From: Wen Gong <quic_wgong@quicinc.com>
>
> v3: remove time_left set but not used in
>     "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"
>
> v2: s/initilized/initialized in commit log of patch
>     "ath11k: add synchronization operation between reconfigure of mac80211 and ath11k_base"
>
> Add support for device recovery.
>
> Wen Gong (3):
>   ath11k: add ath11k_qmi_free_resource() for recovery
>   ath11k: add support for device recovery for QCA6390
>   ath11k: add synchronization operation between reconfigure of mac80211
>     and ath11k_base

I did some quick testing (commit 4716d5bb1e16 in pending branch) and it
does not seem to work for me:

oot@nuc1:~# echo assert > /sys/kernel/debug/ath11k/qca6390\ hw2.0/simulate_fw_crash
root@nuc1:~# iw wlan0 scan
command failed: Connection timed out (-110)
root@nuc1:~# 

Kernel logs have:

[  118.903092] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem 0xdb000000-0xdbffffff 64bit]
[  118.925164] ath11k_pci 0000:06:00.0: MSI vectors: 32
[  118.925285] ath11k_pci 0000:06:00.0: qca6390 hw2.0
[  119.093214] mhi mhi0: Requested to power ON
[  119.095430] mhi mhi0: Power on setup success
[  119.423735] mhi mhi0: Wait for device to enter SBL or Mission mode
[  119.543030] ath11k_pci 0000:06:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
[  119.543197] ath11k_pci 0000:06:00.0: fw_version 0x101c06cc fw_build_timestamp 2020-06-24 19:50 fw_build_id 
[  230.101077] ip (2367) used greatest stack depth: 24384 bytes left
[  283.663895] ath11k_pci 0000:06:00.0: simulating firmware assert crash
[  283.738422] ath11k_pci 0000:06:00.0: firmware crashed: MHI_CB_SYS_ERROR
[  295.236831] ath11k_pci 0000:06:00.0: wmi command 12290 timeout
[  295.237937] ath11k_pci 0000:06:00.0: failed to send WMI_STOP_SCAN_CMDID
[  295.238467] ath11k_pci 0000:06:00.0: failed to stop wmi scan: -11
[  295.240049] ath11k_pci 0000:06:00.0: failed to stop scan: -11
[  295.240558] ath11k_pci 0000:06:00.0: failed to start hw scan: -110

Also there should be a clear ath11k_warn() message when firmware
recovery was successful, I could not find one from patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
