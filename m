Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6FEC433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:51:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F5461BA9
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50F5461BA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ew2fmfjSv2kOpMMd8UStnMdJ7eZ+CQ2MEC3b6Db1IjE=; b=xKQiIFhw2L4Bhn
	+YlfyFjolTf2odUCZp+3+yHxwRQZWU7pWCJHeuKuAz0G/62pfbPYhxK0cP5O8hxhKBoKVTjTwreqr
	ckK0fnzBotKz0EfVon7GECcy8dApUbezrziWQX8jvSKHHAZpYz7wnRfM6Zb8MI/3aa3iu9oTvjGhC
	A5sktqo2iHztuK5QSmNxBCSWhuUTjL4DLycw7V4L9D6aYDZHwrKYq+BfUGqtGMfPImzeQk0bS8e9s
	H9J9e0dI6R3SymBOcEkdcYkAyqRr3KNnGaLKY6krpK2HvJi0mxV3FerJ+5aa7hj5lLjA1l7q/cMde
	ByriWobnxirLIeohjllw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYdz-00F14j-Qu; Mon, 15 Nov 2021 09:51:19 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYE5-00Eu63-U6
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:24:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636968273; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=8t4DsSMao2L6j1TNomnRPPNMD+XcxA54KH3dyo9sTQQ=;
 b=MtOIbdn88n02q1eeLMpINnyrR8+FyrdzBXvv4orrWLBDP9w/J8Rp0O93+API2c291sEOQzmY
 rJCdYAfcd9oc0PabxSs42/dMLJZDDjRDHoxNKPPHHnjDhXr3TxEEWvxEc1SbL5w5YzjFUs30
 J05ZCU0X80aagis9dFZceqUMr9c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61922751a9c3e8b85b388869 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:24:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E22F5C43460; Mon, 15 Nov 2021 09:24:32 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BA95C4338F;
 Mon, 15 Nov 2021 09:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2BA95C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: move peer delete after vdev stop of station for
 QCA6390 and WCN6855
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211027093825.12167-1-quic_wgong@quicinc.com>
References: <20211027093825.12167-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696826945.13305.8157275042821853526.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:24:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012434_098504_1E410F27 
X-CRM114-Status: GOOD (  10.91  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When station connect to AP, the wmi command sequence is:
> 
> peer_create->vdev_start->vdev_up
> 
> and sequence of station disconnect fo AP is:
> 
> peer_delete->vdev_down->vdev_stop
> 
> The sequence of disconnect is not opposite of connect, it caused firmware
> crash when it handle wmi vdev stop cmd when the AP is support TWT of
> 802.11 ax, because firmware need access the bss peer for vdev stop cmd.
> 
> [  390.438564] ath11k_pci 0000:05:00.0: wmi cmd send 0x6001 ret 0
> [  390.438567] ath11k_pci 0000:05:00.0: WMI peer create vdev_id 0 peer_addr c4:04:15:3b:e0:39
> [  390.472724] ath11k_pci 0000:05:00.0: mac vdev 0 start center_freq 2437 phymode 11ax-he20-2g
> [  390.472731] ath11k_pci 0000:05:00.0: wmi cmd send 0x5003 ret 0
> [  390.560849] ath11k_pci 0000:05:00.0: wmi cmd send 0x5005 ret 0
> [  390.560850] ath11k_pci 0000:05:00.0: WMI mgmt vdev up id 0x0 assoc id 1 bssid c4:04:15:3b:e0:39
> 
> [  399.432896] ath11k_pci 0000:05:00.0: WMI peer delete vdev_id 0 peer_addr c4:04:15:3b:e0:39
> [  399.432902] ath11k_pci 0000:05:00.0: wmi cmd send 0x6002 ret 0
> [  399.441380] ath11k_pci 0000:05:00.0: wmi cmd send 0x5007 ret 0
> [  399.441381] ath11k_pci 0000:05:00.0: WMI vdev down id 0x0
> [  399.454681] ath11k_pci 0000:05:00.0: wmi cmd send 0x5006 ret 0
> [  399.454682] ath11k_pci 0000:05:00.0: WMI vdev stop id 0x0
> 
> The opposite sequence of disconnect should be:
> 
> vdev_down->vdev_stop->peer_delete
> 
> This patch change the sequence of disconnect for station as above
> opposite sequence for QCA6390, firmware not crash again with this patch.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b4a0f54156ac ath11k: move peer delete after vdev stop of station for QCA6390 and WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211027093825.12167-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
