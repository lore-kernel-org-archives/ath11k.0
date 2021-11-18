Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6E0C4332F
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 10:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B5D61B93
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 10:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7B5D61B93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIUe4f/yWaMgTYGHEBO8ue68arIbCC3XTe0LSZzoB44=; b=kkRZGq4o9DsJEwsCYQQzcXI6YA
	3YVxgAE+GqZvGjCJ1NJ7wdopFNS1vePmtM4aG8AnSd6e4qP3XnEsCbO+GpFrcxuK4NlQfNANxxrdS
	jPCxtIEJHAt31qoLA6FAJ7fC1/SpzTZhsVPDdN0rX5no19XjThubzNoCSvLA5cUn+++rfZH0jE7SE
	ASWACZ21lubGYtZs1Ew01jJQDrSTGkwopx7eU+nytetLhC4lDXux5Vz4mwA31512iWB5PJrtTo/et
	2oqc+mpkpHufqLRkJSAPo5lDd+G25lSYp7VIveou689VXUsSxoQrLeAix4tJ04ovGAtmuLbxiIAUP
	E5UvBg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnebv-007SL4-W9; Thu, 18 Nov 2021 10:25:44 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnebt-007SKX-CZ
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 10:25:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637231139; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4927RC/IA3KFdMDmSVHhPFatshhrWxyEjmsrez8/tlA=;
 b=s/DXdebV+nGytJtdayLrzE9z6RXdyhGAqJRgKh0tEkmZDdZaAs9y29FVd5g2YvW5q48Ft9s+
 hkhPtuEL9jJQEVJJaTm09hgaeaBl04YiQkShxqh+LIqT1xMePv+hSV3kwTaUkeInYs4nMNyA
 SVY+r/uJYoUzYHe3UJhrln/2l1Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61962a231e1d2f5233108931 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:25:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E742CC4360D; Thu, 18 Nov 2021 10:25:38 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CB3EC4338F;
 Thu, 18 Nov 2021 10:25:38 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 18 Nov 2021 18:25:38 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: add read variant from SMBIOS for download board
 data
In-Reply-To: <163713928364.10263.15372409026240983506.kvalo@codeaurora.org>
References: <20211011082433.30415-1-wgong@codeaurora.org>
 <163713928364.10263.15372409026240983506.kvalo@codeaurora.org>
Message-ID: <d9ff63f49c50b0561932be77bed5ce87@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_022541_536585_429421BC 
X-CRM114-Status: GOOD (  13.43  )
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

On 2021-11-17 16:54, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> wrote:
> 
>> This is to read variant from SMBIOS such as read from DT, the variant
>> string will be used to one part of string which used to search board
>> data from board-2.bin.
>> 
>> Tested-on: WCN6855 hw2.0 PCI 
>> WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> 
>> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> 
> I'm dropping all patches listed below in one go. I didn't manage to
> apply any of these without conflicts, please remember to always use
> ath.git master branch as the baseline to avoid conflicts.
> 
> 9 patches set to Changes Requested.
> 
> 12549401 ath11k: add read variant from SMBIOS for download board data
> 12549415 ath11k: add wait operation for tx management packets for
> flush from mac80211
> 12549419 ath11k: change to treat alpha code na as world wide regdomain
> 12549431 ath11k: report rssi of each chain to mac80211
> 12549433 ath11k: Add signal report to mac80211 for QCA6390 and WCN6855
> 12549449 ath11k: report tx bitrate for iw wlan station dump
> 12554953 ath11k: add support for hardware rfkill for QCA6390
> 12583807 ath11k: add 11d scan offload support
> 12583809 ath11k: calculate the correct NSS of peer for HE capabilities

I have rebased to latest ath.git master ath-202111170737 and resend v2 
for below patches:
[v2] ath11k: report rssi of each chain to mac80211
[v2,0/2] ath11k: add 11d scan offload support for QCA6390/WCN6855
[v2] ath11k: add read variant from SMBIOS for download board data
[v2] ath11k: skip sending vdev down for channel switch
[v2] ath11k: fix read fail for htt_stats and htt_peer_stats for single 
pdev
[v2] ath11k: calculate the correct NSS of peer for HE capabilities
[v2] ath11k: add wait operation for tx management packets for flush from 
mac80211
[v2] ath11k: change to treat alpha code na as world wide regdomain

I will rebase the left patches after these patches upstream, otherwise 
the left patches will have conflict with these patches
because they change same location but actually have no logic relation.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
